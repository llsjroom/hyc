package com.example.demo.lecture;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Service
public class LectureService {
  
  @Autowired
  private LectureMapper mapper;

  public String lectureMain(Model model, int page) {
    int pageSize = 5; // 페이지당 게시글 수
    int offset = (page - 1) * pageSize;

    // 페이징된 리스트 가져오기
    ArrayList<LectureDto> lectureList = mapper.lectureMainPaging(offset, pageSize);

    // 전체 게시글 수 가져오기
    int totalCount = mapper.lectureCount();

    // 전체 페이지 수 계산
    int totalPage = (int) Math.ceil((double) totalCount / pageSize);

    // 모델에 데이터 담기
    model.addAttribute("lectureList", lectureList);
    model.addAttribute("currentPage", page);
    model.addAttribute("totalPage", totalPage);

    return "/lecture/lectureMain";
  }

  public String reserve(int id, Model model, HttpServletRequest request)
  {
    LectureDto ldto=mapper.reserve(id);
    
    // file list로 분리
    String fileStr = ldto.getLimg();
    List<String> fileList = new ArrayList<>();

    // if (fileStr != null && !fileStr.isBlank()) {
    //   String[] files = fileStr.split(",");
    //   for (String f : files) {
    //     if (!f.isBlank()) {
    //       fileList.add(f.trim());
    //     }
    //   }
    // }
    // ndto.setFileList(fileList);
    fileList.add(fileStr.trim());

    // 달력
    int year,month;

    if(request.getParameter("year")==null) {
      LocalDate today=LocalDate.now();
      
      //오늘기준으로 1일의 날짜객체
      year=today.getYear();
      month=today.getMonthValue();
    }
    else {
      year=Integer.parseInt(request.getParameter("year"));
      month=Integer.parseInt(request.getParameter("month"));
      
      if(month==0)
      {
        year=year-1;
        month=12;
      }
      
      if(month==13)
      {
        year=year+1;
        month=1;
      }
    }

    LocalDate xday=LocalDate.of(year, month, 1);
    
    int days=xday.getDayOfWeek().getValue(); // 1~7 (7은 일요일)
    if(days==7)
      days=0;
    
    int fullDay=xday.lengthOfMonth();
    
    int week= (int)Math.ceil( (days+fullDay)/7.0 );
    
    model.addAttribute("days",days);
    model.addAttribute("fullDay",fullDay);
    model.addAttribute("week",week);
    model.addAttribute("year",year);
    model.addAttribute("month",month);
    
    // 오늘날짜를 뷰에 전달
    model.addAttribute("today",LocalDate.now().getDayOfMonth());
    

    model.addAttribute("ldto", ldto);
    model.addAttribute("fileList", fileList);
    
    return "/lecture/reserve";
  }

  public int getTotalMaxPeople() {
    return mapper.getTotalMaxPeople();
  }

  public int getTotalReservedPeople() {
    return mapper.getTotalReservedPeople();
  }

  public String reserveOk(LectureReserveDto lrdto, HttpSession session) 
  {
    mapper.reserveOk(lrdto);
    return "redirect:/lecture/reserveDone?code=" + lrdto.getCode();
  }
}
