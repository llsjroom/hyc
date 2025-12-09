package com.example.demo.regist;

import java.util.ArrayList;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface RegistService {

	String registBook(Model model);
	ArrayList<SoDto> getSo(String daecode);
	public String getPcode(String pcode);
	String registBookOk(ProductDto pdto, MultipartHttpServletRequest multi) throws Exception;
	String registProduct(Model model);
	String delBook(ProductDto dto);
}
