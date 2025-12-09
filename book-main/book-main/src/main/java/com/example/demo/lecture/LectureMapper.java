package com.example.demo.lecture;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface LectureMapper {
  public ArrayList<LectureDto> lectureMain();
  public ArrayList<LectureDto> lectureMainPaging(@Param("offset") int offset, @Param("pageSize") int pageSize);
  public int lectureCount();
  public LectureDto reserve(int id);
  public void reserveOk(LectureReserveDto lrdto);
  public int getTotalMaxPeople();
  public int getTotalReservedPeople();

  
}
