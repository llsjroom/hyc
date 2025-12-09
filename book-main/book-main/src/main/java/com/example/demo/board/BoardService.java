package com.example.demo.board;

import org.springframework.ui.Model;

public interface BoardService {
  public String noticeList(Model model, int page);
  public String noticeView(int id, Model model);
  public String noticeReadnum(int id);

  public String eventList(Model model, int page);
  public String eventView(int id, Model model);
  public String eventReadnum(int id);
}
