package com.example.demo.main;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dto.ProductDto;

import jakarta.servlet.http.HttpServletRequest;

@Service
@Qualifier("ms")
public class MainServiceImpl implements MainService{
  
	@Autowired
	private MainMapper mapper;

	@Override
	public String main(HttpServletRequest request, Model model)
	{
	  String sword=request.getParameter("sword");
	  String pcode=request.getParameter("pcode");
	  ArrayList<ProductDto> nlist=mapper.newList();  
	  ArrayList<ProductDto> llist=mapper.lowList();  
	  ArrayList<ProductDto> hlist=mapper.highList();
	  
	    model.addAttribute("pcode",pcode);
	    model.addAttribute("sword",sword);
	    model.addAttribute("nlist",nlist);	
	    model.addAttribute("llist",llist);
	    model.addAttribute("hlist",hlist);
	    
		return "/main/main";
	}
}
