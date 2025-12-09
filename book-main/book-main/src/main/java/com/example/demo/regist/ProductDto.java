package com.example.demo.regist;

import lombok.Data;

@Data
public class ProductDto {
	private Integer id,price,halin,su,baeprice,baeday;
	private Integer juk,pansu,review,sales;
	private String pcode,pimg,dimg,title,writeday;
	private String salesDay;
	private double star;
	private String baesongStr;
	private Integer ystar,hstar,gstar;
	private Integer wchk;

}
