package com.example.demo.product;

import org.springframework.ui.Model;

import com.example.demo.dto.BaesongDto;
import com.example.demo.dto.GumaeDto;
import com.example.demo.dto.InquiryDto;
import com.example.demo.dto.ReviewDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public interface ProductService {

	public String productList(HttpServletRequest request, Model model);
	public String productContent(HttpServletRequest request,Model model,HttpSession session);
	public String jjimOk(String pcode, HttpSession session);
	public String jjimDel(String pcode, HttpSession session);
	public String addCart(String pcode, int su, HttpSession session, HttpServletRequest request,HttpServletResponse response);
	public String productGumae(HttpServletRequest request, HttpSession session, Model model);
	public String baesongList(HttpSession session, Model model);
	public String baesongAdd(Model model,HttpSession session);
	public String baesongAddOk(BaesongDto bdto, HttpSession session);
	public String baesongDel(int id);
	public String baesongUp(int id, Model model);
	public String baesongUpOk(BaesongDto bdto, HttpSession session);
	public String gumaeOk(GumaeDto gdto, HttpSession session);
    public String jumunContent(String jumuncode,Model model);
	public String reviewDel(ReviewDto rdto);
	public String reviewUpOk(ReviewDto rdto);
	public String inquiryOk(InquiryDto idto, HttpSession session);
	public String commentClose(InquiryDto idto, HttpServletRequest request);
	public String answer(InquiryDto idto,HttpServletRequest request);
	public String delComment(int id);

	
}
