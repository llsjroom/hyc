package com.example.demo.regist;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class RegistController {
	@Autowired
	@Qualifier("rs")
	private RegistService service;

	@GetMapping("/regist/registBook")
	public String registBook(Model model)
	{
		return service.registBook(model);
	}
	
	@GetMapping("/regist/getSo")
	 @ResponseBody 
	public ArrayList<SoDto> getSo(@RequestParam("daecode") String daecode)
	{
		return service.getSo(daecode);
	}
	
	@GetMapping("/regist/getPcode")
	public @ResponseBody String getPcode(@RequestParam("pcode") String pcode)
	{
		return service.getPcode(pcode);
	}
	
	@PostMapping("/regist/registBookOk")
	public String registBookOk(ProductDto pdto,
			MultipartHttpServletRequest multi) throws Exception
	{
		return service.registBookOk(pdto,multi);
	}
	
	@GetMapping("/regist/registProduct")
	public String registProduct(Model model)
	{
		return service.registProduct(model);
	}
	
	@PostMapping("/regist/delBook")
	public String delBook(ProductDto pdto)
	{
		return service.delBook(pdto);
	}
	
}
