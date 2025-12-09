package com.example.demo.lecture;

import java.time.LocalTime;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class LectureDto {
  
  private int id;
  private String title;
  private String limg;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date sday;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date eday;
  private int max;
  private int price01;
  private int price02;
  
  private String time;

  // 1회차=14:00, 2회차=17:00
  private List<LocalTime> lectureTime;
}
