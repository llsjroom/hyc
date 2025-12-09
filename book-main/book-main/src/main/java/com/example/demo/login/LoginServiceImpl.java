package com.example.demo.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.util.WebUtils;

import com.example.demo.dto.MemberDto;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Service
@Qualifier("ls")
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginMapper mapper;

	@Override
	public String login(HttpServletRequest request) 
	{
		request.setAttribute("cart", request.getParameter("cart"));
		return "/login/login";
	}

	@Override
	public String loginOk(MemberDto mdto, HttpSession session
			,HttpServletRequest request,HttpServletResponse response) 
	{
		int state=mdto.getState();
		String name=mapper.loginOk(mdto);
		
		if(name==null)
		{
			return "redirect:/login/login";
		}
		else  // 로그인 성공
		{
			// 세션변수
			session.setAttribute("userid", mdto.getUserid());
			session.setAttribute("name", name);
			session.setAttribute("state", state);
			
		if(mdto.getUserid().equals("admin")) 
		{
		  // 관리자 아이디
		  session.setAttribute("state", 1);
		} 
		else 
		{
		  session.setAttribute("state", 0);
		}
			
			
			// cart쿠키변수에서 값을 읽어온다
			Cookie cookie=WebUtils.getCookie(request, "cart");
			
			if(cookie != null && !cookie.getValue().equals("") ) // 쿠키변수가 존재하면서 값이 ""이 아닐때
			{
				String[] imsi=cookie.getValue().split("/"); // 상품코드1-3/상품코드2-2/
				
				for(int i=0;i<imsi.length;i++)  //   상품코드1-3
				{
					String pcode=imsi[i].substring(0,7);  // 상품코드1
					int su=Integer.parseInt( imsi[i].substring(8) );
					
					if(mapper.isCart(mdto.getUserid(), pcode)) // cart테이블에 존재하는냐
					{
						System.out.println("1");
						mapper.upCart(mdto.getUserid(),pcode,su);
					}
					else
					{
						System.out.println("2");
						mapper.addCart(mdto.getUserid(),pcode,su);
					}
					
				}
		
			}
			
			// cart쿠키변수의 값을 초기화시킨다
			Cookie newCookie=new Cookie("cart","");
			newCookie.setMaxAge(60*60*24); // newCookie.setMaxAge(0); // 바로 쿠키가 없어짐
			newCookie.setPath("/");
			response.addCookie(newCookie);
			
			if(request.getParameter("cart").equals("1"))
				return "redirect:/member/cartView";
			else
				return "redirect:/main/main";
		} 
	}

	@Override
	public String logout(HttpSession session)
	{
		session.invalidate();
		return "redirect:/main/main";
	}

	@Override
	public String useridSearch(String name, String email) 
	{
		String userid=mapper.useridSearch(name,email);
		if(userid==null)
			return "0";
		else
			return userid;
	}

	@Override
	public String pwdSearch(MemberDto mdto) 
	{
		String pwd=mapper.pwdSearch(mdto);
		if(pwd==null)
			return "0";
		else
			return pwd;
	}
}







