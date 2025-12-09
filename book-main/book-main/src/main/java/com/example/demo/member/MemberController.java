package com.example.demo.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.BaesongDto;
import com.example.demo.dto.InquiryDto;
import com.example.demo.dto.MemberDto;
import com.example.demo.dto.ReviewDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
	@Autowired
	@Qualifier("ms2")
	private MemberService service;
	
	@GetMapping("/member/memberInput")
	public String memberInput()
		{
		return service.memberInput();
	}
	
	@PostMapping("/member/memberInputOk")
	public String memberInputOk(MemberDto mdto)
	{
		return service.memberInputOk(mdto);
	}
	
	@GetMapping("/member/useridCheck") // 비동기방식 요청
	public @ResponseBody int useridCheck(@RequestParam("userid") String userid)
	{
		return service.useridCheck(userid);
	}
	
	@GetMapping("/member/cartView")
	public String cartView(Model model, HttpSession session, HttpServletRequest request)
	{
		return service.cartView(model, session, request);
	}
	
	@GetMapping("/member/cartDel")
	public String cartDel(@RequestParam("ids") String ids,
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response)
	{
		return service.cartDel(ids,session,request,response);
	}
	
	@GetMapping("/member/upSu")
	public @ResponseBody String upSu(@RequestParam("id") int id,
			@RequestParam("pcode") String pcode,
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response)
	{
		return service.upSu(id,pcode,session,request,response);
	}
	
	@GetMapping("/member/downSu")
	public @ResponseBody String downSu(@RequestParam("id") int id,
			@RequestParam("pcode") String pcode,
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response)
	{
		return service.downSu(id,pcode,session,request,response);
	}
	
	@GetMapping("/member/jjimList")
	public String jjimList(HttpSession session, Model model)
	{
		return service.jjimList(session,model);
	}
	
	@GetMapping("/member/jjimDel")
	public String jjimDel(@RequestParam("ids") String ids,
			HttpSession session)
	{
		return service.jjimDel(ids,session);
	}
	
	@GetMapping("/member/toCart")
	public @ResponseBody String toCart(@RequestParam("pcode") String pcode,
			HttpSession session)
	{
		return service.toCart(pcode, session);
	}
	
	@GetMapping("/member/memberInfo")
	public String memberInfo(HttpSession session, Model model)
	{
		return service.memberInfo(session, model, 0);
	}
	
	@GetMapping("/member/memberUpdate")
	public String memberUpdate(HttpSession session, Model model)
	{
		return service.memberInfo(session, model, 1);
	}
	
	@PostMapping("/member/memberUpdateOk")
	public String memberUpdateOk(MemberDto mdto, @RequestParam("oldPwd") String oldPwd,
			HttpSession session)
	{
		return service.memberUpdateOk(mdto,oldPwd,session);
	}
	
	@GetMapping("/member/jumunList")
	public String jumunList(HttpSession session, Model model,
			HttpServletRequest request)
	{
		return service.jumunList(session,model,request);
	}
	
	@GetMapping("/member/chgState")
	public @ResponseBody String chgState(@RequestParam("id") int id,
			@RequestParam("state") int state)
	{
		return service.chgState(id,state);
	}
	
	@GetMapping("/member/baesongList")
	public String baesongList(HttpSession session, Model model)
	{
		return service.baesongList(session,model);
	}
	
	@GetMapping("/member/baesongAdd")
	public String baesongAdd()
	{
		return service.baesongAdd();
	}
	
	@PostMapping("/member/baesongAddOk")
	public String baesongAddOk(BaesongDto bdto,HttpSession session)
	{
		return service.baesongAddOk(bdto,session);
	}
	
	@GetMapping("/member/baesongDel")
	public String baesongDel(@RequestParam("id") int id)
	{
		return service.baesongDel(id);
	}
	
	@GetMapping("/member/baesongUp")
	public String baesongUp(@RequestParam("id") int id, Model model)
	{
		return service.baesongUp(id,model);
	}
	
	@PostMapping("/member/baesongUpOk")
	public String baesongUpOk(BaesongDto bdto,
			HttpSession session)
	{
		return service.baesongUpOk(bdto, session);
	}
	
	@GetMapping("/member/review")
	public String review(@RequestParam("pcode") String pcode,
			@RequestParam("gid") int gid, Model model)
	{
		return service.review(pcode,gid,model);
	}
	
	@PostMapping("/member/reviewOk")
	public String reviewOk(ReviewDto rdto,HttpSession session)
	{
		return service.reviewOk(rdto,session);
	}
	
	@GetMapping("/member/reviewList")
	public String reviewList(HttpSession session, Model model)
	{
		return service.reviewList(session,model);
	}
	
	@GetMapping("/member/reviewDel")
	public String reviewDel(ReviewDto rdto)
	{
		return service.reviewDel(rdto);
	}
	
	@GetMapping("/member/reviewUp")
	public String reviewUp(ReviewDto rdto, Model model)
	{
		return service.reviewUp(rdto,model);
	}
	
	@PostMapping("/member/reviewUpOk")
	public String reviewUpOk(ReviewDto rdto)
	{
		return service.reviewUpOk(rdto);
	}
	
	@GetMapping("/member/myInquiry")
	public String myInquiry(HttpSession session, Model model)
	{
		return service.myInquiry(session,model);
	}
	
	@GetMapping("/member/inquiryDel")
	public String inquiryDel(@RequestParam("ref") int ref)
	{
		return service.inquiryDel(ref);
	}
	
	@PostMapping("/member/inquiryUpOk")
	public String inquiryUpOk(InquiryDto idto)
	{
		return service.inquiryUpOk(idto);
	}

	@GetMapping("/member/couponDown2")
	public String couponDown2(@RequestParam("ids")String ids,
	@RequestParam("pcode")String pcode, HttpSession session)
	{
		return service.couponDown2(ids,pcode,session);
	}
	
}
