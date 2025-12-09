package com.example.demo.dto;

import lombok.Data;

@Data
public class MyCouponDto {
	private int id,used,cate;
	private String userid,code,writeday,gigan,scope;
	private String scopeStr;
	
	//coupontable의 halin
	private int halin;

	private int chk;

}
