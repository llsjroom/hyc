package com.example.demo.member;

import com.example.demo.dto.BaesongDto;
import com.example.demo.dto.InquiryDto;
import com.example.demo.dto.MemberDto;
import com.example.demo.dto.ReviewDto;

import org.springframework.ui.Model;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public interface MemberService {
	public String memberInput();
	public String memberInputOk(MemberDto mdto);
	public int useridCheck(String userid);
	public String cartView(Model model, HttpSession session, HttpServletRequest request);
	public String cartDel(String ids, HttpSession session, HttpServletRequest request, HttpServletResponse response);
	public String upSu(int id, String pcode, HttpSession session, HttpServletRequest request, HttpServletResponse response);
	public String downSu(int id, String pcode, HttpSession session, HttpServletRequest request, HttpServletResponse response);
	public String jjimList(HttpSession session,Model model);
	public String jjimDel(String ids, HttpSession session);
	public String toCart(String pcode, HttpSession sessiono);
	public String memberInfo(HttpSession session, Model model, int chk);
	public String memberUpdateOk(MemberDto mdto,String oldPwd,HttpSession session);
	public String jumunList(HttpSession session,Model model,HttpServletRequest request);
	public String chgState(int id, int state);
	public String baesongList(HttpSession session, Model model);
	public String baesongAdd();
	public String baesongAddOk(BaesongDto bdto,HttpSession session);
	public String baesongDel(int id);
	public String baesongUp(int id, Model model);
	public String baesongUpOk(BaesongDto bdto,HttpSession session);
	public String review(String pcode, int gid, Model model);
	public String reviewOk(ReviewDto rdto,HttpSession session);
	public String reviewList(HttpSession session, Model model);
	public String reviewDel(ReviewDto rdto);
	public String reviewUp(ReviewDto rdto, Model model);
	public String reviewUpOk(ReviewDto rdto);
	public String myInquiry(HttpSession session, Model model);
	public String inquiryDel(int ref);
	public String inquiryUpOk(InquiryDto idto);
	public String couponDown2(String ids, String pcode, HttpSession session);
	

}
