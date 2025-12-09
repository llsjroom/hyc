package com.example.demo.admin;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.demo.dto.EventDto;
import com.example.demo.dto.InquiryDto;
import com.example.demo.dto.NoticeDto;
import com.example.demo.lecture.LectureDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface AdminService {
  public String adminNotice(Model model, int page);
  public String noticeRegister();
  public String noticeRegisterOk(NoticeDto ndto, MultipartHttpServletRequest multi) throws Exception;
  public String noticeModify(int id, Model model);
  public String noticeModifyOk(NoticeDto ndto, MultipartHttpServletRequest multi) throws Exception;
  public String adminEvent(Model model, int page);
  public String eventRegister();
  public String eventRegisterOk(EventDto edto, MultipartHttpServletRequest multi) throws Exception;
  public String eventModify(int id, Model model);
  public String eventModifyOk(EventDto edto, MultipartHttpServletRequest multi) throws Exception;
  public String adminOrder(Model model);
  public String chgState(int id,int state);
  public String upMember(HttpServletRequest request);
  public String delMember(String userid);
  public String adminUser(Model model);
  public String delNotice(String ids, HttpSession session);
  public String delEvent(String ids, HttpSession session);
  public String adminInquiry(Model model);
  public String answer(InquiryDto idto);

  public String adminLecture(Model model, int page);
  public String lectureRegister();
  public String lectureRegisterOk(LectureDto ndto, MultipartHttpServletRequest multi) throws Exception;
  public String lectureModify(int id, Model model);
  public String lectureModifyOk(LectureDto ndto, MultipartHttpServletRequest multi) throws Exception;
  public String delLecture(String ids, HttpSession session);
}
