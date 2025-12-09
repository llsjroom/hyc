package com.example.demo.dto;

import lombok.Data;

@Data
public class NoticeDto {
  private int id,readnum;
  private String title;
  private String content;
  private String writeday;
  private String file;
}
