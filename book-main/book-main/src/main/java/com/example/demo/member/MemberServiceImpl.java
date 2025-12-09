package com.example.demo.member;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.util.WebUtils;

import com.example.demo.dto.BaesongDto;
import com.example.demo.dto.CouponDto;
import com.example.demo.dto.InquiryDto;
import com.example.demo.dto.MemberDto;
import com.example.demo.dto.ProductDto;
import com.example.demo.dto.ReviewDto;
import com.example.demo.etc.MyUtils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Service
@Qualifier("ms2")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public String memberInput()
	{
		return "/member/memberInput";
	}

	@Override
	public String memberInputOk(MemberDto mdto) 
	{
		mapper.memberInputOk(mdto);
		return "redirect:/login/login";
	}

	@Override
	public int useridCheck(String userid) 
	{
		return mapper.useridCheck(userid);
	}

	@Override
	public String cartDel(String ids, HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response) 
	{
        if(session.getAttribute("userid") == null)
        {
        	String[] imsi=ids.split(",");  //  상품코드1,상품코드2,상품코드3,
        	
        	Cookie cookie=WebUtils.getCookie(request, "cart");
        	
        	if( !(cookie==null || cookie.getValue().equals("")) ) // 쿠키가 있다면 삭제하기
        	{
        		String[] carts=cookie.getValue().split("/"); // 상품코드1-2  상품코드2-1  상품코드3-3)
        		
        		for(int i=0;i<imsi.length;i++)   // 배열  상품코드1  상품코드2  상품코드3
            	{
            		// 배열에 있는 상품코드에 해당되는 상품을 쿠키변수에서 삭제
        			for(int j=0;j<carts.length;j++)
        			{
        				if(carts[j].indexOf(imsi[i]) != -1) // 삭제할 상품코드가 있는 carts배열의 값을 ""
        				{
        					carts[j]="";
        				}
        			}
            	}
        		
        		// 삭제가 완료된  carts배열을 문자열로 만들기
        		String newPcode="";
        		for(int i=0;i<carts.length;i++)
        		{
        			if(carts[i] != "") // 비어있는 배열은 패스
        			   newPcode=newPcode+carts[i]+"/";
        		}
        		
        		// 쿠키에 저장
        		Cookie newCookie=new Cookie("cart",newPcode);
        		newCookie.setMaxAge(60*60*24);
        		newCookie.setPath("/");
        		
        		response.addCookie(newCookie);
        	}
        	
        	
        }
        else
        {
        	// ids는 한개 이상의 id를 가지고 있다  // 11 , 22 , 33
    		// 로그인 한 경우
    		String[] imsi=ids.split(",");
    		
    		for(int i=0;i<imsi.length;i++)
    		{
    			mapper.cartDel(imsi[i]);
    		}
    		 
        }
		
		
		return "redirect:/member/cartView";
	}

	@Override
	public String cartView(Model model, HttpSession session, HttpServletRequest requset) 
	{
		ArrayList<ProductDto> plist=null;
		
		if(session.getAttribute("userid")==null)
		{
			Cookie cookie=WebUtils.getCookie(requset, "cart");
			
			if(!(cookie==null || cookie.getValue().equals("")))
			{
				plist=new ArrayList<ProductDto>();
				
				String[] pcodes=cookie.getValue().split("/");
				
				for(int i=0;i<pcodes.length;i++)
				{
					String pcode=pcodes[i].substring(0,7);
					int su=Integer.parseInt(pcodes[i].substring(8));
					
					ProductDto pdto=mapper.getProduct(pcode);
					
					String baesongStr=MyUtils.getBaesong(pdto.getBaeday());
					pdto.setBaesongStr(baesongStr);
					
					pdto.setSu(su);
					
					plist.add(pdto);
				}
			}
		}
		else
		{
			String userid=session.getAttribute("userid").toString();
			plist=mapper.cartView(userid);
			
			for(int i=0;i<plist.size();i++)
			{
				ProductDto pdto=plist.get(i);
				
				String baesongStr=MyUtils.getBaesong(pdto.getBaeday());
				
				pdto.setBaesongStr(baesongStr);
			}
		}
		
		model.addAttribute("plist",plist);
		
		return "/member/cartView"; 
	}

	@Override
	public String upSu(int id, String pcode, HttpSession session,HttpServletRequest request,HttpServletResponse response) 
	{
		System.out.println(pcode);
		try
		{
			if(session.getAttribute("userid")==null)
			{
				Cookie cookie=WebUtils.getCookie(request, "cart");
				if( !(cookie==null || cookie.getValue().equals("")) )
			    {
					String[] carts=cookie.getValue().split("/");
					
					for(int i=0;i<carts.length;i++)  //  p01010204001-3
					{
						if(carts[i].indexOf(pcode) != -1)
						{
							int su=Integer.parseInt(carts[i].substring(8));
							su++; // 4
							// 다시 배열에 넣어주기
							carts[i]=carts[i].substring(0,8)+su; //  p01010204001-4

							carts[i]=carts[i].substring(0,8)+su; //  p01010204001-4

						}
				    }
					
					// 배열에 있는 내용을 문자열로 바꾸기
					String newCode="";
					for(int i=0;i<carts.length;i++)
					{
						newCode=newCode+carts[i]+"/";
					}
					
					
					Cookie newCookie=new Cookie("cart",newCode);
					newCookie.setMaxAge(60*60*24);
					newCookie.setPath("/");
					
					response.addCookie(newCookie);
				}
			}
			else
			{
				mapper.upSu(id);				
			}			
			
			return "1";
		}
		catch(Exception e)
		{
			return "0";
		}
	}

	@Override
	public String downSu(int id, String pcode, HttpSession session,HttpServletRequest request,HttpServletResponse response) 
	{
		try
		{
			
			if(session.getAttribute("userid")==null)
			{
				Cookie cookie=WebUtils.getCookie(request, "cart");
				if( !(cookie==null || cookie.getValue().equals("")) )
			    {
					String[] carts=cookie.getValue().split("/");
					
					for(int i=0;i<carts.length;i++)  //  p01010204001-3
					{
						if(carts[i].indexOf(pcode) != -1)
						{
							int su=Integer.parseInt(carts[i].substring(8));
							su--; // 2
							// 다시 배열에 넣어주기
							carts[i]=carts[i].substring(0,8)+su; //  p01010204001-2
						}
						
					}
					
					// 배열에 있는 내용을 문자열로 바꾸기
					String newCode="";
					for(int i=0;i<carts.length;i++)
					{
						newCode=newCode+carts[i]+"/";
					}
					
					
					Cookie newCookie=new Cookie("cart",newCode);
					newCookie.setMaxAge(60*60*24);
					newCookie.setPath("/");
					
					response.addCookie(newCookie);
			    }
			}
			else
			{
				mapper.downSu(id);				
			}		
			
			return "1";
		}
		catch(Exception e)
		{
			return "0";
		}
	}

	@Override
	public String jjimList(HttpSession session, Model model) 
	{
		String userid=session.getAttribute("userid").toString();
		
		ArrayList<ProductDto> plist=mapper.jjimList(userid);
		
		for(int i=0;i<plist.size();i++)
		{
			ProductDto pdto=plist.get(i);
			String baesongStr=MyUtils.getBaesong(pdto.getBaeday());
			pdto.setBaesongStr(baesongStr);
		}
		model.addAttribute("plist",plist);
		return "/member/jjimList";
	}

	@Override
	public String jjimDel(String ids, HttpSession session) 
	{
		String[] imsi=ids.split(",");
		
		for(int i=0;i<imsi.length;i++)
		{
			mapper.jjimDel(imsi[i]);
		}
		return "redirect:/member/jjimList";
	}

	@Override
	public String toCart(String pcode, HttpSession session) 
	{
		try
		{
			String userid=session.getAttribute("userid").toString();
			
			if(mapper.isCart(pcode, userid))
			{
				mapper.upCart(pcode, userid);
			}
			else
			{
				mapper.toCart(pcode, userid);
			}
			
			return "1";
		}
		catch(Exception e)
		{
			return "0";
		}
	}

	@Override
	public String memberInfo(HttpSession session, Model model, int chk) 
	{
		   // 쿠폰정보 읽어오기
  		ArrayList<CouponDto> clist = mapper.getCoupon();

   		for (CouponDto cdto : clist) 
		{
          String scopeStr = "";
          switch(cdto.getScope()) 
		  {
              case "A1": scopeStr = "소설/문학"; break;
              case "B1": scopeStr = "비소설/교양"; break;
              case "C1": scopeStr = "경제/경영"; break;
              case "D1": scopeStr = "과학/기술"; break;
              default: scopeStr = "기타";
          }

          cdto.setScopeStr(scopeStr);  // scopeStr 전용 필드에 세팅
    	}
		
		  model.addAttribute("clist", clist);

		String userid=session.getAttribute("userid").toString();
		BaesongDto bdto=mapper.baeInfo(userid);
		MemberDto mdto=mapper.memberInfo(userid);
		model.addAttribute("bdto",bdto);
		model.addAttribute("mdto",mdto); 
		
		
		if(chk==0)
			return "/member/memberInfo";
		else
			return "/member/memberUpdate";
	}

	@Override
	public String memberUpdateOk(MemberDto mdto, String oldPwd, HttpSession session) 
	{
		String userid=session.getAttribute("userid").toString();
		if(mapper.isPwd(oldPwd, userid))
		{
			mdto.setUserid(userid);
			mapper.memberUpdateOk(mdto);
			return "redirect:/member/memberInfo";
		}
		else
		{
			return "redirect:/member/memberUpdate?err=1";
		}
	}

  @Override
  public String jumunList(HttpSession session, Model model, HttpServletRequest request) 
  {
    String userid=session.getAttribute("userid").toString();

    String start=null, end=null;
    String paramStart=request.getParameter("start");
    String paramEnd=request.getParameter("end");

    ArrayList<HashMap<String, String>> mapAll;
    
    // 검색 날짜가 입력된 경우
    if (paramStart != null && paramEnd != null && !paramStart.isEmpty() && !paramEnd.isEmpty()) {
      start=paramStart;
      end=paramEnd;
      mapAll=mapper.jumunList(userid, start, end);
    }
    // 3,6,12개월 검색이 입력된 경우
    else if (request.getParameter("month") != null) {
      int month = Integer.parseInt(request.getParameter("month"));
      LocalDate today = LocalDate.now();
      LocalDate xday = today.minusMonths(month);

      start = xday.toString();
      end = today.toString();

      mapAll = mapper.jumunList(userid, start, end);
    }
    // 검색 전
    else {
      mapAll = mapper.jumunListRecent(userid);
    }
    
    model.addAttribute("mapAll", mapAll);
    return "/member/jumunList";
  }

	@Override
	public String chgState(int id, int state) 
	{
		try
		{
			mapper.chgState(id, state);
			return "1";
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
			return "0";
		}
	}

	@Override
	public String baesongList(HttpSession session, Model model) 
	{
		String userid=session.getAttribute("userid").toString();
		ArrayList<BaesongDto> blist=mapper.baesongList(userid);
		
		for(int i=0;i<blist.size();i++)
		{
			BaesongDto bdto=blist.get(i);
			String reqStr=MyUtils.getReq(bdto.getReq());
			bdto.setReqStr(reqStr);
		}
		
		model.addAttribute("blist",blist);
		return "/member/baesongList";
	}

	@Override
	public String baesongAdd() 
	{
		return "/member/baesongAdd";
	}

	@Override
	public String baesongAddOk(BaesongDto bdto, HttpSession session) 
	{
		String userid=session.getAttribute("userid").toString();
		bdto.setUserid(userid);
		mapper.baesongAddOk(bdto);
		
		return "/member/baesongAddOk";
	}

	@Override
	public String baesongDel(int id) 
	{
		mapper.baesongDel(id);
		
		return "redirect:/member/baesongList";
	}

	@Override
	public String baesongUp(int id, Model model) 
	{
		BaesongDto bdto=mapper.baesongUp(id);
		model.addAttribute("bdto",bdto);
		
		return "/member/baesongUp";
	}

	@Override
	public String baesongUpOk(BaesongDto bdto, HttpSession session) 
	{
		if(bdto.getGibon()==1)
		{
			String userid=session.getAttribute("userid").toString();
			mapper.setBaesong(userid);
		}
		mapper.baesongUpOk(bdto);
		
		return "/member/baesongUpOk";
	}

	@Override
	public String review(String pcode, int gid, Model model) 
	{
		model.addAttribute("pcode",pcode);
		model.addAttribute("gid",gid);
		
		return "member/review";
	}

	@Override
	public String reviewOk(ReviewDto rdto, HttpSession session) 
	{
		String userid=session.getAttribute("userid").toString();
		rdto.setUserid(userid);
		mapper.reviewOk(rdto); // 새로운 상품평 추가
		
		int len=mapper.getCount(rdto.getPcode());
		
		mapper.setProduct(rdto.getPcode(),len);
		
		mapper.chgGumaeReview(rdto.getGid());
		
		return "redirect:/member/jumunList";
	}

	@Override
	public String reviewList(HttpSession session, Model model) 
	{
		String userid=session.getAttribute("userid").toString();
		ArrayList<HashMap<String,String>> rlist=mapper.reviewList(userid);
		model.addAttribute("rlist",rlist);
		
		return "/member/reviewList";
	}

	@Override
	public String reviewDel(ReviewDto rdto) 
	{
		mapper.reviewDel(rdto.getId());
		
		int len=mapper.getCount(rdto.getPcode());

		mapper.setProduct(rdto.getPcode(), len);

		mapper.setProduct(rdto.getPcode(),len);
		
		mapper.setReview(rdto.getGid());
		
		return "redirect:/member/reviewList";
	}

	@Override
	public String reviewUp(ReviewDto rdto, Model model) 
	{
		rdto=mapper.reviewUp(rdto.getId());
		model.addAttribute("rdto",rdto);
		
		return "/member/reviewUp";
	}

	@Override
	public String reviewUpOk(ReviewDto rdto) 
	{
		mapper.reviewUpOk(rdto);
		
		int len=mapper.getCount(rdto.getPcode());

		mapper.setProduct(rdto.getPcode(), len);

		mapper.setProduct(rdto.getPcode(),len);

		
		return "redirect:/member/reviewList";
	}

	@Override
	public String myInquiry(HttpSession session, Model model) 
	{
		String userid=session.getAttribute("userid").toString();
		ArrayList<InquiryDto> ilist=mapper.myInquiry(userid);
		
		for(int i=0;i<ilist.size();i++)
		{
			String content=ilist.get(i).getContent().replace("\r\n", "<br>");
			String answer=ilist.get(i).getAnswer().replace("\r\n", "<br>");
			ilist.get(i).setContent(content);
			ilist.get(i).setAnswer(answer);					
		}
		model.addAttribute("ilist",ilist);
		
		return "/member/myInquiry";
	}

	@Override
	public String inquiryDel(int ref) 
	{
		mapper.inquiryDel(ref);
		
		return "redirect:/member/myInquiry";
	}

	@Override
	public String inquiryUpOk(InquiryDto idto) 
	{
		mapper.inquiryUpOk(idto);
		
		return "redirect:/member/myInquiry";
	}

	@Override
	public String couponDown2(String ids, String pcode, HttpSession session) 
	{
		String userid=session.getAttribute("userid").toString();
		String[] imsi=ids.split(",");

		for(int i=0;i<imsi.length;i++)
		{
			CouponDto cdto=mapper.coupon(imsi[i]);

			int cate;
			String gigan;
			if(cdto.getAfterDay()==0)
			{
				cate=0;
				gigan=cdto.getGigan();
			}
			else
			{
				cate=1;
				LocalDate today=LocalDate.now();
				LocalDate xday=today.plusDays(cdto.getAfterDay());
				gigan=xday.toString();
			}
			mapper.couponDown2(userid,cdto.getCode(),cdto.getScope(),cate,gigan);
		}

		return "redirect:/member/memberInfo?userid="+userid;		
	}
}

