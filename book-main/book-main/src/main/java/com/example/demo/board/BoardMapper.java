package com.example.demo.board;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.dto.EventDto;
import com.example.demo.dto.NoticeDto;

@Mapper
  public interface BoardMapper {
  public ArrayList<NoticeDto> noticeList();
  public ArrayList<NoticeDto> noticeListPaging(@Param("offset") int offset, @Param("pageSize") int pageSize);
  public int noticeCount();
  public NoticeDto noticeView(int id);
  public void noticeReadnum(int id);

  public ArrayList<EventDto> eventList();
  public ArrayList<EventDto> eventListPaging(@Param("offset") int offset, @Param("pageSize") int pageSize);
  public int eventCount();
  public EventDto eventView(int id);
  public void eventReadnum(int id);
}
