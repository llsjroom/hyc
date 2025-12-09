package com.example.demo.regist;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RegistMapper {
	public ArrayList<DaeDto> getDae();
	public ArrayList<SoDto> getSo(String daecode);
	public int getPcode(String pcode);
	public ArrayList<ProductDto> productList();
	public void registBookOk(ProductDto pdto);
	public ArrayList<ProductDto> registProduct();
	public void delBook(String pocde);
	
}
