package com.example.demo.board;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dto.EventDto;
import com.example.demo.dto.NoticeDto;


@Service
@Qualifier("bs")
public class BoardServiceImpl implements BoardService{
  @Autowired
  private BoardMapper mapper;

  // 공지사항
  @Override
  public String noticeList(Model model, int page)
  {
    int pageSize = 5; // 페이지당 게시글 수
    int offset = (page - 1) * pageSize;

    // 페이징된 리스트 가져오기
    ArrayList<NoticeDto> noticeList = mapper.noticeListPaging(offset, pageSize);

    // 전체 게시글 수 가져오기
    int totalCount = mapper.noticeCount();

    // 전체 페이지 수 계산
    int totalPage = (int) Math.ceil((double) totalCount / pageSize);

    // 모델에 데이터 담기
    model.addAttribute("noticeList", noticeList);
    model.addAttribute("currentPage", page);
    model.addAttribute("totalPage", totalPage);

    return "/board/noticeList";
  }

  @Override
  public String noticeView(int id, Model model)
  {
    NoticeDto ndto=mapper.noticeView(id);
    
    // content 줄바꿈
    ndto.setContent(ndto.getContent().replace("\r\n","<br>"));

    // file list로 분리
    String fileStr = ndto.getFile();
    List<String> fileList = new ArrayList<>();

    if (fileStr != null && !fileStr.isBlank()) {
      String[] files = fileStr.split(",");
      for (String f : files) {
        if (!f.isBlank()) {
          fileList.add(f.trim());
        }
      }
    }
    // ndto.setFileList(fileList);

    model.addAttribute("ndto", ndto);
    model.addAttribute("fileList", fileList);
    return "/board/noticeView";
  }

  @Override
  public String noticeReadnum(int id) 
  {
    mapper.noticeReadnum(id);
    return "redirect:/board/noticeView?id="+id;
  }

  // 이벤트
  @Override
  public String eventList(Model model, int page)
  {
    int pageSize = 5; // 페이지당 게시글 수
    int offset = (page - 1) * pageSize;

    // 페이징된 리스트 가져오기
    ArrayList<EventDto> eventList = mapper.eventListPaging(offset, pageSize);

    // 전체 게시글 수 가져오기
    int totalCount = mapper.eventCount();

    // 전체 페이지 수 계산
    int totalPage = (int) Math.ceil((double) totalCount / pageSize);

    // 모델에 데이터 담기
    model.addAttribute("eventList", eventList);
    model.addAttribute("currentPage", page);
    model.addAttribute("totalPage", totalPage);

    return "/board/eventList";
  }

  @Override
  public String eventView(int id, Model model)
  {
    EventDto edto=mapper.eventView(id);
    
    // content 줄바꿈
    edto.setContent(edto.getContent().replace("\r\n","<br>"));

    // file list로 분리
    String fileStr = edto.getFile();
    List<String> fileList = new ArrayList<>();

    if (fileStr != null && !fileStr.isBlank()) {
      String[] files = fileStr.split(",");
      for (String f : files) {
        if (!f.isBlank()) {
          fileList.add(f.trim());
        }
      }
    }
    // ndto.setFileList(fileList);

    model.addAttribute("edto", edto);
    model.addAttribute("fileList", fileList);
    return "/board/eventView";
  }

  @Override
  public String eventReadnum(int id) 
  {
    mapper.eventReadnum(id);
    return "redirect:/board/eventView?id="+id;
  }
}