package com.example.demo.dto;

import lombok.Data;

@Data
public class ProductDto {
	private int id,price,halin,su,baeprice,baeday;
	private int juk,pansu,review,sales;
	private String pcode,pimg,dimg,title,writeday;
	private String salesDay;
	private double star;
	
	private String baesongStr;
	
	private int ystar, hstar, gstar;
	
	private int wchk;
}
