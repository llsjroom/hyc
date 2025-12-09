package com.example.demo.main;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;

public interface MainService {
  public String main(HttpServletRequest request,Model model);
}
