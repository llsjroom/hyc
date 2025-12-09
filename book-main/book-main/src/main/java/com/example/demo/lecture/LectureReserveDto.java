package com.example.demo.lecture;

import java.time.LocalDate;

import lombok.Data;

@Data
public class LectureReserveDto {
  
  private int id;
  private int lecture_id;
  private String userid;
  private String date;
  private String time;
  private int people;
  private int book;
  private LocalDate saveday;
  private String code;

  private int total;
}
