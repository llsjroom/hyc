package com.example.demo;

import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AdminInterceptor implements HandlerInterceptor {
  
  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

    HttpSession session = request.getSession(false);

    if (session == null || !"admin".equals(session.getAttribute("userid"))) {
        response.sendRedirect("/main/main"); // 메인 페이지로 리다이렉트
        return false;
    }

    return true; // admin으로 로그인 했을 때만
  }
}
