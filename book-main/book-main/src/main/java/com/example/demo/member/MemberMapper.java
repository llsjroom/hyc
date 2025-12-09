package com.example.demo.member;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.ui.Model;

import com.example.demo.dto.BaesongDto;
import com.example.demo.dto.CouponDto;
import com.example.demo.dto.InquiryDto;
import com.example.demo.dto.MemberDto;
import com.example.demo.dto.ProductDto;
import com.example.demo.dto.ReviewDto;

import jakarta.servlet.http.HttpSession;

@Mapper
public interface MemberMapper {
	public void memberInputOk(MemberDto mdot);
	public int useridCheck(String userid);
	public ArrayList<ProductDto> cartView(String userid);
	public void cartDel(String id);
	public ProductDto getProduct(String pcode);
	public void upSu(int id);
	public void downSu(int id);
	public ArrayList<ProductDto> jjimList(String userid);
	public void jjimDel(String id);
	public void toCart(String pcode, String userid);
	public void upCart(String pcode, String userid);
	public boolean isCart(String pcode, String userid);
	public MemberDto memberInfo(String userid);
	public boolean isPwd(String pwd, String userid);
	public void memberUpdateOk(MemberDto mdto);
	public ArrayList<HashMap<String, String>> jumunList(String userid, String start, String end);
  public ArrayList<HashMap<String, String>> jumunListRecent(String userid);
	public void chgState(int id, int state);
	public ArrayList<BaesongDto> baesongList(String userid);
	public void baesongAddOk(BaesongDto bdto);
	public void baesongDel(int id);
	public BaesongDto baesongUp(int id);
	public void setBaesong(String userid);
	public void baesongUpOk(BaesongDto bdto);
	public void reviewOk(ReviewDto rdto);
	public void chgGumaeReview(int id);
	public void chgProductReview(String pcode);
	public int getCount(String pcode);

	public void setProduct(String pcode, int len);
	public ArrayList<HashMap<String,String>> reviewList(String userid);
	public void reviewDel(int id);
	public void setReview(int id);
	public ReviewDto reviewUp(int id);
	public void reviewUpOk(ReviewDto rdto);
	public ArrayList<InquiryDto> myInquiry(String userid);
	public void inquiryDel(int ref);
	public void inquiryUpOk(InquiryDto idto);
	public BaesongDto baeInfo(String userid);
	public void couponDown2(String userid, String code, String scope, int cate, String gigan);
	public CouponDto coupon(String id);
	public ArrayList<CouponDto> getCoupon();
}
