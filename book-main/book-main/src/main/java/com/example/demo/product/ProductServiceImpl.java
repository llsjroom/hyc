package com.example.demo.product;

import java.time.LocalDate;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.util.WebUtils;

import com.example.demo.dto.BaesongDto;
import com.example.demo.dto.GumaeDto;
import com.example.demo.dto.InquiryDto;
import com.example.demo.dto.MemberDto;
import com.example.demo.dto.MyCouponDto;
import com.example.demo.dto.ProductDto;
import com.example.demo.dto.ReviewDto;
import com.example.demo.etc.MyUtils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Service
@Qualifier("ps")
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductMapper mapper;

	@Override
	public String productList(HttpServletRequest request, Model model) 
	{
	    String sword=request.getParameter("sword");
	    String pcode=request.getParameter("pcode");
	    int order=1;
	    if(request.getParameter("order") != null)
	        order=Integer.parseInt(request.getParameter("order"));
	    
	    String orderStr="";
	    switch(order)
	    {
	        case 1: orderStr="pansu desc"; break;
	        case 2: orderStr="price asc"; break;
	        case 3: orderStr="price desc"; break;
	        case 4: orderStr="writeday desc"; break;
	    }

	    model.addAttribute("order", order);

	    int page = 1;
	    if(request.getParameter("page") != null)
	        page = Integer.parseInt(request.getParameter("page"));


	    // 한 페이지당 10개 상품
	    // 한 페이지당 20개 상품
	    int itemsPerPage = 15;
	    int index = (page - 1) * itemsPerPage;

	    // 페이지 블럭 계산 (5페이지 단위)1
	    int pstart, pend, chong;
	    int pagePerBlock = 5; // 한 블럭에 보여줄 페이지 수

	    pstart = ((page - 1) / pagePerBlock) * pagePerBlock + 1;
	    pend   = pstart + pagePerBlock - 1;

	    if(pcode == null || pcode.length() == 0)
	        chong = mapper.getChong(sword, 0);
	    else
	        chong = mapper.getChong(pcode, 1);

	    if(pend > chong)
	        pend = chong;

	    model.addAttribute("page", page);
	    model.addAttribute("pstart", pstart);
	    model.addAttribute("pend", pend);
	    model.addAttribute("chong", chong);


	    // 상품 목록 가져오기

	    ArrayList<ProductDto> plist;
	    if(pcode == null || pcode.length() == 0)
	        plist = mapper.productList(sword, orderStr, index, 0);
	    else
	        plist = mapper.productList(pcode, orderStr, index, 1);

	    // 배송일 처리 및 대표 이미지
	    for(ProductDto pdto : plist)
	    {
	        String baesongStr = MyUtils.getBaesong(pdto.getBaeday());
	        pdto.setBaesongStr(baesongStr);

	        String pimg = pdto.getPimg().split(",")[0];
	        pdto.setPimg(pimg);
	    }


	    // 분류명 생성 (HOME - 대분류 - 소분류)

	    String homeStr;
	    if(pcode == null || pcode.length() == 0)
	    {
	        homeStr = "검색어 : " + sword;
	    }
	    else
	    {
	        homeStr = "🏠︎ ";
	        if(pcode.length() == 2) // 대분류
	        {
	            String dae = pcode.substring(0);
	            String daeName = mapper.getDae(dae);
	            homeStr += daeName;
	        }
	        else if(pcode.length() == 4) // 중분류
	        {
	            String dae = pcode.substring(0,2);
	            String so = pcode.substring(2);
	            String daeName = mapper.getDae(dae);
	            String soName = mapper.getSo(so, dae);
	            homeStr += daeName + " - " + soName;
	        }
	    }

	    model.addAttribute("homeStr", homeStr);
	    model.addAttribute("sword", sword);
	    model.addAttribute("pcode", pcode);
	    model.addAttribute("plist", plist);

	    return "/product/productList";
	}

	@Override
	public String productContent(HttpServletRequest request, Model model, HttpSession session) 
	{
		
      String pcode=request.getParameter("pcode");
      ProductDto pdto=mapper.productContent(pcode);
      
      
      String[] pimgs=pdto.getPimg().split(",");
      model.addAttribute("pimgs",pimgs);
      
      // 배송일
      String BaesongStr=MyUtils.getBaesong(pdto.getBaeday());
      pdto.setBaesongStr(BaesongStr);
      
      model.addAttribute("pdto",pdto);
      
      int ok=0;
      if(session.getAttribute("userid")!= null)
      {
        String userid=session.getAttribute("userid").toString();
        ok=mapper.isOk(pcode,userid);
      }
      model.addAttribute("ok",ok);
      
      ArrayList<ReviewDto> rlist=mapper.getReview(pcode);
      for(int i=0;i<rlist.size();i++)
      {
        String content=rlist.get(i).getContent().replace("\r\n", "<br>");
        rlist.get(i).setContent(content);
      }
      
      model.addAttribute("rlist",rlist);
      ArrayList<InquiryDto> ilist=mapper.getInquiry(pcode);
      for(InquiryDto idto : ilist)
      {
        if(idto.getQna() == 1) 
        {
          int count=mapper.answerInquiryCount(idto.getRef());
          idto.setChkAnswer(count > 0 );        
          }
      }
      model.addAttribute("ilist",ilist);
      
      return "product/productContent";
	}

	@Override
	public String jjimOk(String pcode, HttpSession session) 
	{
	  try
	  {
	    String userid=session.getAttribute("userid").toString();
	    mapper.jjimOk(pcode,userid);
	    return "1";
	  }
	  catch(Exception e)
	  {
		return "0";
	  }

	}

	@Override
	public String jjimDel(String pcode, HttpSession session) 
	{
	  try
	  {
	    String userid=session.getAttribute("userid").toString();
	    mapper.jjimDel(pcode,userid);
	    return "1";
	  }
	  catch(Exception e)
	  {
	   return "0";
	  }

	}

	@Override
	public String addCart(String pcode, int su, HttpSession session, HttpServletRequest request,
			HttpServletResponse response)
	{
	  try
	  {
	    if(session.getAttribute("userid")!= null) // 로그인 한 경우
	    { 	
	      String userid=session.getAttribute("userid").toString();
	    
	      if(mapper.isCart(userid,pcode))
	      {
	        mapper.upCart(su, userid, pcode);
	      }
	      else
	      {
	        mapper.addCart(pcode, su, userid);
	      }
	    }
	    else
	    {
	      String chugaPcode=pcode+"-"+su+"/";
	      Cookie cookie=WebUtils.getCookie(request, "cart");
	      
	      if(cookie==null || cookie.getValue().equals(""))
	      {
	        Cookie newCookie=new Cookie("cart",chugaPcode);
	        newCookie.setMaxAge(60*60*24);
	        newCookie.setPath("/");
	        
	        response.addCookie(newCookie);
	      }
	      else
	      {
	        String beforeCookie=cookie.getValue();
	        if(beforeCookie.indexOf(pcode)!= -1)
	        {
	          String[] imsi=beforeCookie.split("/");
	          for(int i=0;i<imsi.length;i++)
	          {
	            if(imsi[i].indexOf(pcode)!= 1)
	            {
	              String first=imsi[i].substring(0,8);
	              int second=Integer.parseInt(imsi[i].substring(8));
	              String newCode=first+(second+su);
	              imsi[i]=newCode;
	            }
	          }
	          
	          String upCode="";
	          for(int i=0;i<imsi.length;i++)
	          {
	            upCode=upCode+imsi[i]+"/";
	          }
	          
	          Cookie newCookie=new Cookie("cart",upCode);
	          newCookie.setMaxAge(60*60*24);
	          newCookie.setPath("/");
	          response.addCookie(newCookie);
	        }
	        else
	        {
	          Cookie newCookie=new Cookie("cart",beforeCookie+chugaPcode);
	          newCookie.setMaxAge(60*60*24);
	          newCookie.setPath("/");
	          
	          response.addCookie(newCookie);
	        }
	      }
	    }
	    return "1";
	  }
	  catch(Exception e)
	  {
		  
	  }
		return null;
	}

	@Override
	public String productGumae(HttpServletRequest request, HttpSession session, Model model) 
	{
	 Object obj = session.getAttribute("userid");
     if(obj == null) 
     {
	    // 로그인 안 된 상태면 로그인 페이지로 이동
	   return "redirect:/login/login";
	 }
	 
	  // 구매자
	 String userid = obj.toString();
	
	 String pcode=request.getParameter("pcodes");
	 
	 // 쿠폰 정보를 읽어 전달
	 ArrayList<MyCouponDto> mlist=mapper.gumaeCoupon(userid);
	 // System.err.println("mlist size: " + mlist.size());  // 표준 오류 출력 사용
	 System.out.println("Logged in user id: " + userid);
	 model.addAttribute("mlist", mlist);

	 
	 // 대 분류값
	 for(int i=0;i<mlist.size();i++)
	 {
		String scope=mlist.get(i).getScope();
		if(pcode.indexOf(scope) != -1)
		  mlist.get(i).setChk(1);
	 }
	  MemberDto mdto=mapper.getMember(userid);
	  model.addAttribute("mdto",mdto);
	  
	  // 배송지 정보
	  BaesongDto bdto=mapper.getGibon(userid);
	  if(bdto != null)
	  {
        String reqStr=MyUtils.getReq(bdto.getReq());
        bdto.setReqStr(reqStr);
	  }
	  model.addAttribute("bdto",bdto);
		  
	  // 배송상품
	  String[] pcodes=request.getParameter("pcodes").split(",");
	  String[] sus=request.getParameter("sus").split(",");
	  
	  model.addAttribute("pcodes",request.getParameter("pcodes"));
	  model.addAttribute("sus",request.getParameter("sus"));
	  
	  ArrayList<ProductDto> plist=new ArrayList<ProductDto>();
	  
	  int totalPrice=0; // 상품합계
	  int totalBaePrice=0; // 배송비 합계
	  for(int i=0;i<pcodes.length;i++)
	  {
        ProductDto pdto=mapper.productContent(pcodes[i]);
        if(pdto == null)
        {
          return "redirect:/member/cartView?userid="+userid;
        }
        String baesongStr=MyUtils.getBaesong(pdto.getBaeday());
        pdto.setBaesongStr(baesongStr);
        
        // 할인율 계산해서 변수에 저장
        int price=pdto.getPrice()-(pdto.getPrice()*pdto.getHalin()/100);
        price=price*Integer.parseInt(sus[i]);
        pdto.setPrice(price); 
        
        // 수량 Dto에 전달
        pdto.setSu(Integer.parseInt(sus[i]));
        
        //할인상품금액 * 수량을 누적시켜 저장
        int imsiPrice=pdto.getPrice()-(pdto.getPrice()*pdto.getHalin()/100);
        imsiPrice=imsiPrice*pdto.getSu();
        totalPrice=totalPrice+imsiPrice;
        
        // 배송비 누적
        totalBaePrice=totalBaePrice+pdto.getBaeprice();
        plist.add(pdto);
	  }
	  model.addAttribute("totalBaePrice",totalBaePrice);
	  model.addAttribute("totalPrice",totalPrice);
	  model.addAttribute("plist",plist);
	  
	  return "/product/productGumae";
	}

	@Override
	public String baesongList(HttpSession session, Model model) 
	{
	  String userid=session.getAttribute("userid").toString();
	  ArrayList<BaesongDto> blist=mapper.baesongList(userid);
	  for(int i=0;i<blist.size();i++)
	  {
	    blist.get(i).setReqStr(MyUtils.getReq(blist.get(i).getReq()));
	  }
		model.addAttribute("blist",blist);
		
	  return "/product/baesongList";
	}

	@Override
	public String baesongAdd(Model model,HttpSession session) 
	{
	  String userid=session.getAttribute("userid").toString();
	  boolean chkBae=mapper.chkBae(userid);
	  model.addAttribute("chkBae", chkBae);
		 	
	  return "/product/baesongAdd";
	}

	@Override
	public String baesongAddOk(BaesongDto bdto, HttpSession session) 
	{
	  String userid=session.getAttribute("userid").toString();
	  bdto.setUserid(userid);
	  
	  mapper.baesongAddOk(bdto);
	  
	  return "redirect:/product/baesongList?aa="+bdto.getAa();
	}

	@Override
	public String baesongDel(int id) 
	{
	  mapper.baesongDel(id);
		return "redirect:/product/baesongList";
	}

	@Override
	public String baesongUp(int id, Model model) 
	{
      BaesongDto bdto=mapper.baesongUp(id);
      model.addAttribute("bdto",bdto);
      
     return "/product/baesongUp";
	}

	@Override
	public String baesongUpOk(BaesongDto bdto, HttpSession session) 
	{
	  if(bdto.getGibon()==1)
	  {
	    mapper.setGibon(session.getAttribute("userid").toString());  
	  }
	  mapper.baesongUpOk(bdto);
	  return "redirect:/product/baesongList";
	}

	@Override
	public String gumaeOk(GumaeDto gdto, HttpSession session) 
	{
	  if(session.getAttribute("userid")==null)
	  {
	    return "redirect:/login/login";
	  }
	  else
	  {
	    String userid=session.getAttribute("userid").toString();
	    gdto.setUserid(userid);  
	    
	    // 주문 코드 생성
	    String today=LocalDate.now().toString();
	    today=today.replace("-", "");
	    String jumuncode="j"+today;
	    
	    int num=mapper.getJumunCode(jumuncode);
	    String code=String.format("%03d", num);
	    jumuncode=jumuncode+code;
	    
	    gdto.setJumuncode(jumuncode);
	    
	    String[] pcodes=gdto.getPcodes().split(",");
	    String[] sus=gdto.getSus().split(",");
	    
	    for(int i=0;i<pcodes.length;i++)
	    {
	      gdto.setPcode(pcodes[i]);
	      gdto.setSu(Integer.parseInt(sus[i]));
	      
	      mapper.gumaeOk(gdto);
	    }
	    mapper.minusJuk(gdto.getUseJuk(),userid);
	  
	    return "redirect:/product/jumunContent?jumuncode="+jumuncode;
	  } 
	}

	@Override
	public String jumunContent(String jumuncode, Model model) 
	{
	  ArrayList<GumaeDto> glist=mapper.jumunContent(jumuncode);
	  
	  ArrayList<ProductDto> plist=new ArrayList<ProductDto>();
	  for(int i=0;i<glist.size();i++)
	  {
	    GumaeDto gdto=glist.get(i);
	    ProductDto pdto=mapper.productContent(gdto.getPcode());  
	    String baesongStr=MyUtils.getBaesong(pdto.getBaeday());
	    pdto.setBaesongStr(baesongStr);
	    
	    plist.add(pdto);	  
	  }
	  
	  BaesongDto bdto=mapper.baesongUp(glist.get(0).getBaeId());
      String reqStr=MyUtils.getReq(bdto.getReq());
	  bdto.setReqStr(reqStr);
	  
	  int cprice=glist.get(0).getCprice();	  
	  int useJuk=glist.get(0).getUseJuk(); 
	  model.addAttribute("cprice",cprice);
	  model.addAttribute("useJuk",useJuk);
	  
	  model.addAttribute("plist",plist);
	  model.addAttribute("bdto",bdto);
	  
	  return "/product/jumunContent";
	  
	 }

	@Override
	public String reviewDel(ReviewDto rdto) 
	{
	 // reivew레코드 삭제
	  mapper.reviewDel(rdto.getId());
	  
	  // 리뷰 갯수
	  int len=mapper.getCount(rdto.getPcode());
	  mapper.chgProduct(len,rdto.getPcode());

      mapper.chgReview(rdto.getGid());
      
      return "redirect:/product/productContent?pcode="+rdto.getPcode();	  
	  
	}

	@Override
	public String reviewUpOk(ReviewDto rdto) 
	{
	  mapper.reviewUpOk(rdto);
	  
	  int len=mapper.getCount(rdto.getPcode());
	  mapper.chgProduct(len,rdto.getPcode());
	  
	  return "redirect:/product/productContent?pcode="+rdto.getPcode();
	}

	@Override
	public String inquiryOk(InquiryDto idto, HttpSession session)
	{
		
	  if(idto.getContent().trim().isEmpty())
	  {
		 return "redirect:/product/productContent?pcode="+idto.getPcode();
	  }
	  else
	  {
	  String userid=session.getAttribute("userid").toString();
	  
	  int ref=mapper.getRef();
	  
	  idto.setUserid(userid);
	  idto.setRef(ref);
	  
	  mapper.inquiryOk(idto);
	  
      return "redirect:/product/productContent?pcode="+idto.getPcode();
	  }
	}

	@Override
	public String commentClose(InquiryDto idto, HttpServletRequest request) 
	{
		int answer=mapper.answerInquiry(idto);
		if(answer > 0)
		{
		 return "redirect:/product/productContent";
		}
		else
		{
	      return "redirect:/product/productCotnet";	
		}
		  
	}

	@Override
	public String answer(InquiryDto idto, HttpServletRequest request) {

	    InquiryDto original = mapper.getInquiryById(idto.getRef()); 
	    if (original == null) {
	        return "redirect:/product/productContent?pcode=" + idto.getPcode();
	    }

	    if (idto.getAnswer() == null || idto.getAnswer().trim().isEmpty()) {
	        return "redirect:/product/productContent?pcode=" + original.getPcode();
	    }

	    // 답글 내용을 answer 필드에 세팅
	    idto.setAnswer(idto.getAnswer().trim());

	    idto.setRef(original.getRef());
	    idto.setPcode(original.getPcode());
	    idto.setUserid("admin");

	    mapper.answer(idto);

	    return "redirect:/product/productContent?pcode=" + original.getPcode();
	}

	@Override
	public String delComment(int id) 
	{
	  int result=mapper.delComment(id);
	  return result > 0? "1" : "0" ;
	}
}
