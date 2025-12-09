package com.example.demo.login;

import com.example.demo.dto.MemberDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public interface LoginService {
	public String login(HttpServletRequest request);
	public String loginOk(MemberDto mdto, HttpSession session, HttpServletRequest request, HttpServletResponse response);
	public String logout(HttpSession session);
	public String useridSearch(String name,String email);
	public String pwdSearch(MemberDto mdto);
}
