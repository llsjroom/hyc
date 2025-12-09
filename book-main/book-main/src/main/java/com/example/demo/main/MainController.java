package com.example.demo.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class MainController {
	
  @Autowired
  @Qualifier("ms")
  private MainService service;
	
	
  @GetMapping("/main/main")
  public String main(HttpServletRequest request, Model model)
  {
    return service.main(request,model);
  }
}
