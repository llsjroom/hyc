package com.example.demo.dto;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class EventDto {
  private int id;
  private String title;
  private String content;
  private String cimg;
  private LocalDateTime startday;
  private LocalDateTime endday;
  private String writeday;
  private boolean status;
  private int readnum;
  private String file;
}
