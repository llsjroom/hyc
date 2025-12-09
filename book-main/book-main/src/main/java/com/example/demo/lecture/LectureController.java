package com.example.demo.lecture;

import java.time.LocalDate;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class LectureController {
  
  @Autowired
  private LectureService service;

  @GetMapping("/lecture")
  public String lectureMain(Model model, HttpServletRequest request) 
  {
    int page = 1;

    // 파라미터에서 page값 가져오기, 예외 발생 시 기본값 1
    try {
      page = Integer.parseInt(request.getParameter("page"));
      if (page < 1) page = 1;
    } catch (Exception e) {
      // do nothing (page remains 1)
    }

    return service.lectureMain(model, page);
  }

  // @GetMapping("/lecture/lectureList")
  // public String lectureList() 
  // {
  //   return "/lecture/lectureList";
  // }

  @GetMapping("/lecture/reserve")
  public String reserve(@RequestParam("id") int id, Model model, HttpServletRequest request) 
  {
    int totalMax = service.getTotalMaxPeople();       // 전체 예약 가능 인원
    int reserved = service.getTotalReservedPeople();  // 현재 예약된 인원
    
    model.addAttribute("totalMax", totalMax);
    model.addAttribute("reserved", reserved);

    return service.reserve(id, model, request);
  }
  @PostMapping("/lecture/reserveOk")
  public String reserveOk(LectureReserveDto lrdto,HttpSession session)
  {
    // 예약번호 생성 (예: UUID)
    lrdto.setCode(UUID.randomUUID().toString());

    // 저장 날짜
    lrdto.setSaveday(LocalDate.now());

    return service.reserveOk(lrdto,session);
  }

  @GetMapping("/lecture/reserveDone")
  public String reserveDone() 
  {
    return "/lecture/reserveDone";
  }
  
  @GetMapping("/lecture/lectureList")
  public String lectureList() 
  {
    return "/lecture/lectureList";
  }
}
