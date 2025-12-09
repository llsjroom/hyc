package com.example.demo.login;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.MemberDto;

@Mapper
public interface LoginMapper {
	public String loginOk(MemberDto mdto);
	public String useridSearch(String name,String email);
	public String pwdSearch(MemberDto mdto);
	public void addCart(String userid, String pcode, int su);
	public void upCart(String userid,String pcode,int su);
	public boolean isCart(String userid,String pcode);
}
