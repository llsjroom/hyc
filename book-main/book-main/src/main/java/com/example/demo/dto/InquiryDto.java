package com.example.demo.dto;

import lombok.Data;

@Data
public class InquiryDto {
	private int id, ref, qna;
	private String userid,content,pcode,writeday;
	
	// 상품명
	private String title;
	
	// 답변
	private String answer;
	private boolean chkAnswer;
	
}
