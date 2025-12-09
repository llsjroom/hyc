package com.example.demo.product;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.BaesongDto;
import com.example.demo.dto.GumaeDto;
import com.example.demo.dto.InquiryDto;
import com.example.demo.dto.MemberDto;
import com.example.demo.dto.MyCouponDto;
import com.example.demo.dto.ProductDto;
import com.example.demo.dto.ReviewDto;

@Mapper
public interface ProductMapper {
	public ArrayList<ProductDto> productList(String str, String orderStr, int index, int chk);
    public int getChong(String str, int chk);
    public String getSo(String so,String daecode);
    public String getDae(String dae);
    
    public ProductDto productContent(String pcode);
    public int isOk(String pcode,String userid);
    public ArrayList<ReviewDto> getReview(String pcode);
    public ArrayList<InquiryDto> getInquiry(String pcode);
    public void jjimOk(String pcode,String userid);
    public void jjimDel(String pcode,String userid);
    public void addCart(String pcode, int su,String userid);
    public boolean isCart(String userid, String pcode);
    public void upCart(int su,String userid,String pcode);
    
    public MemberDto getMember(String userid);
    public BaesongDto getGibon(String userid);
	public void baesongAddOk(BaesongDto bdto);
	public void baesongDel(int id);
	public BaesongDto baesongUp(int id);
	public void setGibon(String string);
	public int getJumunCode(String jumuncode);
	public void gumaeOk(GumaeDto gdto);
	public void minusJuk(int juk, String userid);
	public ArrayList<GumaeDto> jumunContent(String jumuncode);
	public void baesongUpOk(BaesongDto bdto);
	public ArrayList<BaesongDto> baesongList(String userid);
	
	public void reviewUpOk(ReviewDto rdto);
	public void reviewDel(int id);
	public int getCount(String pcode);
	public void chgProduct(int len,String pcode);
	public void chgReview(int id);
	public int getRef();
	public void inquiryOk(InquiryDto idto);
	public int answerInquiry(InquiryDto idto);
	
	public void answer(InquiryDto idto);
	public InquiryDto getInquiryById(int id);
	
	public int delComment(int id);
	public int answerInquiryCount(int ref);
	public boolean chkBae(String userid);
	public ArrayList<MyCouponDto> gumaeCoupon(String userid);

	
}
