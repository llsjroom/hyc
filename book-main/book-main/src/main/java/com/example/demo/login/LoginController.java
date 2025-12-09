package com.example.demo.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.service.annotation.GetExchange;

import com.example.demo.dto.MemberDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {
	@Autowired
	@Qualifier("ls")
	private LoginService service;
	
	@GetExchange("/login/login")
	public String login(HttpServletRequest request,HttpSession session)
	{
		return service.login(request);
	}
	
	@PostMapping("/login/loginOk")
	public String loginOk(MemberDto mdto,
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response)
	{
		return service.loginOk(mdto, session, request, response);
	}
	
	@GetMapping("/login/logout")
	public String logout(HttpSession session)
	{
		return service.logout(session);
	}
	
	@GetMapping("/login/useridSearch")
	public @ResponseBody String useridSearch(@RequestParam("name") String name,
			@RequestParam("email") String email)
	{
		return service.useridSearch(name,email);
	}
	
	@GetMapping("/login/pwdSearch")
	public @ResponseBody String pwdSearch(MemberDto mdto)
	{
		return service.pwdSearch(mdto);
	}

	
}
