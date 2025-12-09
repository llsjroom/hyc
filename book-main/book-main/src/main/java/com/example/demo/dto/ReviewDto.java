package com.example.demo.dto;

import lombok.Data;

@Data
public class ReviewDto {
	private int id,gid,star;
	private String userid,pcode,title,content,writeday;
	
	private String userid2;
}
