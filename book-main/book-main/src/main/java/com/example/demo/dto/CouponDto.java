package com.example.demo.dto;

import lombok.Data;

@Data
public class CouponDto {
    private int id,halin,afterDay,state;
	private String scope,gigan,code,writeday,dae;
	
	// scope별 이룸
	private String scopeStr;


}
