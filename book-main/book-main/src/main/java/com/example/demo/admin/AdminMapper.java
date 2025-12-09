package com.example.demo.admin;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.dto.EventDto;
import com.example.demo.dto.InquiryDto;
import com.example.demo.dto.MemberDto;
import com.example.demo.dto.NoticeDto;
import com.example.demo.dto.OrderDto;
import com.example.demo.lecture.LectureDto;

@Mapper
public interface AdminMapper {
  public ArrayList<NoticeDto> adminNotice();
  public ArrayList<NoticeDto> adminNoticePaging(@Param("offset") int offset, @Param("pageSize") int pageSize);
  public int noticeCount();
  public void noticeRegisterOk(NoticeDto ndto);
  public NoticeDto noticeModify(int id);
  public void noticeModifyOk(NoticeDto ndto);
  public ArrayList<EventDto> adminEvent();
  public ArrayList<EventDto> adminEventPaging(@Param("offset") int offset, @Param("pageSize") int pageSize);
  public int eventCount();
  public void eventRegisterOk(EventDto edto);
  public EventDto eventModify(int id);
  public void eventModifyOk(EventDto edto);
  public ArrayList<OrderDto> getAdminOrder();
  public int chgState(int id,int state);
  public int upMember(String userid,String name,int juk);
  public int delMember(String userid);
  public ArrayList<MemberDto> getMemberList();
  public void delNotice(String id);
  public void delEvent(String id);
  public ArrayList<InquiryDto> adminInquiry();
  public void answer(InquiryDto idto);

  public ArrayList<LectureDto> adminLecture();
  public ArrayList<LectureDto> adminLecturePaging(@Param("offset") int offset, @Param("pageSize") int pageSize);
  public int lectureCount();
  public void lectureRegisterOk(LectureDto ldto);
  public LectureDto lectureModify(int id);
  public void lectureModifyOk(LectureDto ldto);
  public void delLecture(String id);
}
