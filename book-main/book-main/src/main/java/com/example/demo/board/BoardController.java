package com.example.demo.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;


@Controller
public class BoardController {
  @Autowired
  private BoardService service;

  // 공지사항 목록
  @GetMapping("/board/noticeList")
  public String noticeList(Model model, HttpServletRequest request)
  {
    int page = 1;

    // 파라미터에서 page값 가져오기, 예외 발생 시 기본값 1
    try {
      page = Integer.parseInt(request.getParameter("page"));
      if (page < 1) page = 1;
    } catch (Exception e) {
      // do nothing (page remains 1)
    }

    return service.noticeList(model, page);
  }
  
  // 공지사항 상세
  @GetMapping("/board/noticeView")
  public String noticeView(@RequestParam("id") int id, Model model)
  {
    return service.noticeView(id, model);
  }
  
  // 공지사항 조회수
  @GetMapping("/board/noticeReadnum")
  public String noticeReadnum(@RequestParam("id") int id)
  {
    return service.noticeReadnum(id);
  }

  // 이벤트 목록
  @GetMapping("/board/eventList")
  public String eventList(Model model, HttpServletRequest request)
  {
    int page = 1;

    // 파라미터에서 page값 가져오기, 예외 발생 시 기본값 1
    try {
      page = Integer.parseInt(request.getParameter("page"));
      if (page < 1) page = 1;
    } catch (Exception e) {
      // do nothing (page remains 1)
    }

    return service.eventList(model, page);
  }
  
  // 이벤트 상세
  @GetMapping("/board/eventView")
  public String eventView(@RequestParam("id") int id, Model model)
  {
    return service.eventView(id, model);
  }
  
  // 이벤트 조회수
  @GetMapping("/board/eventReadnum")
  public String eventReadnum(@RequestParam("id") int id)
  {
    return service.eventReadnum(id);
  }

  // FAQ
  @GetMapping("/board/faqList")
  public String adminMain()
  {
    return "/board/faqList";
  }

}
