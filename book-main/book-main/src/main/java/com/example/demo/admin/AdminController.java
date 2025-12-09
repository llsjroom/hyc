package com.example.demo.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.demo.dto.EventDto;
import com.example.demo.dto.InquiryDto;
import com.example.demo.dto.NoticeDto;
import com.example.demo.lecture.LectureDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
  @Autowired
  private AdminService service;

  @GetMapping("/admin/{chk}")
	public String admin(@PathVariable int chk, HttpSession session,Model model,HttpServletRequest request)
	{
		if(session.getAttribute("userid")!=null && session.getAttribute("userid").equals("admin"))
		{
			String str="";
			switch(chk)
			{
        case 10: str=this.adminUser(model); break;
        // case 20: str="redirect:/regist/registProduct"; break;
        // case 21: str="redirect:/regist/registBook"; break;
				case 30: str=this.adminOrder(model); break;
				case 40: str=this.adminNotice(model, request); break;
        case 41: str=this.noticeRegister(session); break;
        case 42: str=this.adminEvent(model, request); break;
        case 43: str=this.eventRegister(session); break;
        case 44: str=this.adminLecture(model, request); break;
        case 45: str=this.lectureRegister(session); break;
        case 50: str=this.adminInquiry(model); break;
			}
	 
			return str;
		}
		else
			return "redirect:/main/main";
	}

  @GetMapping("/admin/adminMain")
  public String adminMain()
  {
    return "/admin/adminMain";
  }
  
  // 공지사항 목록
  @GetMapping("/admin/adminNotice")
  public String adminNotice(Model model, HttpServletRequest request)
  {
    int page = 1;

    // 파라미터에서 page값 가져오기, 예외 발생 시 기본값 1
    try {
      page = Integer.parseInt(request.getParameter("page"));
      if (page < 1) page = 1;
    } catch (Exception e) {
      // do nothing (page remains 1)
    }

    return service.adminNotice(model, page);
  }

  // 공지사항 등록
  @GetMapping("/admin/noticeRegister")
  public String noticeRegister(HttpSession session)
  {   
    return service.noticeRegister();
  }
  @PostMapping("/admin/noticeRegisterOk")
   public String noticeRegisterOk(NoticeDto ndto,HttpSession session,MultipartHttpServletRequest multi) throws Exception
  {
    return service.noticeRegisterOk(ndto,multi);
  }

  // 공지사항 수정
  @GetMapping("/admin/noticeModify")
  public String noticeModify(@RequestParam("id") int id, Model model, HttpSession session)
  {
    return service.noticeModify(id, model);
  }
  @PostMapping("/admin/noticeModifyOk")
  public String noticeModifyOk(NoticeDto ndto, MultipartHttpServletRequest multi) throws Exception 
  {
    return service.noticeModifyOk(ndto, multi);
  }

  // 이벤트 목록
  @GetMapping("/admin/adminEvent")
  public String adminEvent(Model model, HttpServletRequest request)
  {
    int page = 1;

    // 파라미터에서 page값 가져오기, 예외 발생 시 기본값 1
    try {
      page = Integer.parseInt(request.getParameter("page"));
      if (page < 1) page = 1;
    } catch (Exception e) {
      // do nothing (page remains 1)
    }

    return service.adminEvent(model, page);
  }

  // 이벤트 등록
  @GetMapping("/admin/eventRegister")
  public String eventRegister(HttpSession session)
  {   
    return service.eventRegister();
  }
  @PostMapping("/admin/eventRegisterOk")
   public String eventRegisterOk(EventDto edto,HttpSession session,MultipartHttpServletRequest multi) throws Exception
  {
    return service.eventRegisterOk(edto,multi);
  }

  // 이벤트 수정
  @GetMapping("/admin/eventModify")
  public String eventModify(@RequestParam("id") int id, Model model, HttpSession session)
  {
    return service.eventModify(id, model);
  }
  @PostMapping("/admin/eventModifyOk")
  public String eventModifyOk(EventDto edto, MultipartHttpServletRequest multi) throws Exception 
  {
    return service.eventModifyOk(edto, multi);
  }
  
  @GetMapping("/admin/adminOrder")
  public String adminOrder(Model model)
  {
    return service.adminOrder(model);
  }
  
  @GetMapping("/admin/chgState")
  public @ResponseBody String chgState(@RequestParam("id")int id,@RequestParam("state") int state)
  {
    return service.chgState(id,state);
  }
  
  @GetMapping("/admin/adminUser")
  public String adminUser(Model model)
  {
    return service.adminUser(model);
  }
  
  @GetMapping("/admin/upMember")
  public @ResponseBody String upMember(HttpServletRequest request)
  {
    return service.upMember(request);
  }
  
  @GetMapping("/admin/delMember")
  public @ResponseBody String delMember(@RequestParam("userid")String userid)
  {
    return service.delMember(userid);
  }
  
  @GetMapping("/admin/delNotice")
  public String delNotice(@RequestParam("ids") String ids, HttpSession session)
  {
    return service.delNotice(ids,session);
  }
  @GetMapping("/admin/delEvent")
  public String delEvent(@RequestParam("ids") String ids, HttpSession session)
  {
    return service.delEvent(ids,session);
  }
  
  @GetMapping("/admin/adminInquiry")
  public String adminInquiry(Model model)
  {
	  return service.adminInquiry(model);
  }
  
  @GetMapping("admin/answer")
  public String answer(InquiryDto idto)
  {
	  return service.answer(idto);
  }

  // 작가와의만남 목록
  @GetMapping("/admin/adminLecture")
  public String adminLecture(Model model, HttpServletRequest request)
  {
    int page = 1;

    // 파라미터에서 page값 가져오기, 예외 발생 시 기본값 1
    try {
      page = Integer.parseInt(request.getParameter("page"));
      if (page < 1) page = 1;
    } catch (Exception e) {
      // do nothing (page remains 1)
    }

    return service.adminLecture(model, page);
  }

  // 작가와의만남 등록
  @GetMapping("/admin/lectureRegister")
  public String lectureRegister(HttpSession session)
  {   
    return service.lectureRegister();
  }
  @PostMapping("/admin/lectureRegisterOk")
   public String lectureRegisterOk(LectureDto ldto,HttpSession session,MultipartHttpServletRequest multi) throws Exception
  {
    return service.lectureRegisterOk(ldto,multi);
  }

  // 작가와의만남 수정
  @GetMapping("/admin/lectureModify")
  public String lectureModify(@RequestParam("id") int id, Model model, HttpSession session)
  {
    return service.lectureModify(id, model);
  }
  @PostMapping("/admin/lectureModifyOk")
  public String lectureModifyOk(LectureDto ldto, MultipartHttpServletRequest multi) throws Exception 
  {
    return service.lectureModifyOk(ldto, multi);
  }
  @GetMapping("/admin/delLecture")
  public String delLecture(@RequestParam("ids") String ids, HttpSession session)
  {
    return service.delLecture(ids,session);
  }
}
