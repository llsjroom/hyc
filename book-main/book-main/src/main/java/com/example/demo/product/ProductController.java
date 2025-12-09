package com.example.demo.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.BaesongDto;
import com.example.demo.dto.GumaeDto;
import com.example.demo.dto.InquiryDto;
import com.example.demo.dto.ReviewDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class ProductController {
	
  @Autowired
  @Qualifier("ps")
  private ProductService service;
	

  @GetMapping("/product/productContent")
  public String productContent(HttpServletRequest request,
		  Model model, HttpSession session)
  {
	  return service.productContent(request,model,session);
  }
  @GetMapping("/product/productList")
  public String productList(HttpServletRequest request,
	      Model model)
  {
	  return service.productList(request,model);  
  }
  @GetMapping("/product/jjimOk")
  public @ResponseBody String jjimOk(@RequestParam("pcode") String pcode,
		  HttpSession session)
  {
	  return service.jjimOk(pcode,session);
  }
  @GetMapping("/product/jjimDel")
  public @ResponseBody String jjimDel(@RequestParam("pcode")String pcode,
		  HttpSession session)
  {
	  return service.jjimDel(pcode,session);
  }
  @GetMapping("product/addCart")
  public @ResponseBody String addCart(@RequestParam("pcode") String pcode,
		  @RequestParam("su") int su,
		  HttpSession session,HttpServletRequest request,HttpServletResponse response)
  {
	  return service.addCart(pcode,su,session,request,response);
  }
  @PostMapping("/product/productGumae")
  public String productGumae(HttpServletRequest request,HttpSession session,Model model)
  {
	  return service.productGumae(request,session,model);
  }
  
  @GetMapping("/product/baesongList")
  public String baesongList(HttpSession session,Model model)
  {
	  return service.baesongList(session,model);
  }
  @GetMapping("/product/baesongAdd")
  public String baesongAdd(Model model,HttpSession session)
  {
	  return service.baesongAdd(model,session);
  }
  @PostMapping("/product/baesongAddOk")
  public String baesongAddOk(BaesongDto bdto,HttpSession session)
  {
	  return service.baesongAddOk(bdto,session);
  }
  @GetMapping("/product/baesongDel")
  public String baesongDel(@RequestParam("id")int id)
  {
	  return service.baesongDel(id);
  }
  @GetMapping("/product/baesongUp")
  public String baesongUp(@RequestParam("id")int id,Model model)
  {
	  return service.baesongUp(id,model);
  }
  @PostMapping("/product/baesongUpOk")
  public String baesongUpOk(BaesongDto bdto,HttpSession session)
  {
	  return service.baesongUpOk(bdto,session);
  }
  @PostMapping("/product/gumaeOk")
  public String gumaeOk(GumaeDto gdto,HttpSession session)
  {
	  return service.gumaeOk(gdto, session);
  }
  @GetMapping("/product/jumunContent")
  public String jumunContent(@RequestParam("jumuncode")String jumuncode,Model model)
  {
	  return service.jumunContent(jumuncode,model);
  }
  @GetMapping("/product/reviewDel")
  public String reviewDel(ReviewDto rdto)
  {
	  return service.reviewDel(rdto);
  }
  @PostMapping("/product/reviewUpOk")
  public String reviewUpOk(ReviewDto rdto)
  {
	  return service.reviewUpOk(rdto);
  }
  @PostMapping("/product/inquiryOk")
  public String inquiryOk(InquiryDto idto,HttpSession session)
  {
	  return service.inquiryOk(idto,session);
  }
  
  @PostMapping("/product/commentClose")
  public @ResponseBody String commentClose(InquiryDto idto,HttpServletRequest request)
  {
	  return service.commentClose(idto,request);
  }
  
  @PostMapping("/product/answer")
  public String answer(InquiryDto idto,HttpServletRequest request)
  {
	  return service.answer(idto, request);
  }
  
  @PostMapping("/product/delComment")
  public @ResponseBody String delComment(@RequestParam("id") int id)
  {
	  return service.delComment(id);
  }
  
}
