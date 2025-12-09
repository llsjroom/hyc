package com.example.demo.admin;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.demo.dto.EventDto;
import com.example.demo.dto.InquiryDto;
import com.example.demo.dto.MemberDto;
import com.example.demo.dto.NoticeDto;
import com.example.demo.dto.OrderDto;
import com.example.demo.lecture.LectureDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
@Qualifier("as")
public class AdminServiceImpl implements AdminService{
  @Autowired
  private AdminMapper mapper;

  // 공지사항 목록
  @Override
  public String adminNotice(Model model, int page)
  {
    int pageSize = 5; // 페이지당 게시글 수
    int offset = (page - 1) * pageSize;

    // 페이징된 리스트 가져오기
    ArrayList<NoticeDto> noticeList = mapper.adminNoticePaging(offset, pageSize);

    // 전체 게시글 수 가져오기
    int totalCount = mapper.noticeCount();

    // 전체 페이지 수 계산
    int totalPage = (int) Math.ceil((double) totalCount / pageSize);

    // 모델에 데이터 담기
    model.addAttribute("noticeList", noticeList);
    model.addAttribute("currentPage", page);
    model.addAttribute("totalPage", totalPage);
    return "/admin/adminNotice";
  }

  // 공지사항 등록
  @Override
  public String noticeRegister() 
  {
    return "/admin/noticeRegister";
  }

  @Override
  public String noticeRegisterOk(NoticeDto ndto, MultipartHttpServletRequest multi) throws Exception 
  {
    // 파일목록
    MultipartFile file1=multi.getFile("file1");
    MultipartFile file2=multi.getFile("file2");
    MultipartFile file3=multi.getFile("file3");
    
    // 저장할 파일들 이름
    String file="";
    
    // 파일 등록 유무 체크
    if (file1 != null && !file1.isEmpty()) {
      file += file1.getOriginalFilename();
    } 
    else {
      file += "";
    }

    // 파일 등록 유무 체크
    if (file2 != null && !file2.isEmpty()) {
      file += "," + file2.getOriginalFilename();
    } 
    else {
      file += "";
    }
    
    // 파일 등록 유무 체크
    if (file3 != null && !file3.isEmpty()) {
      file += "," + file3.getOriginalFilename();
    } 
    else {
      file += "";
    }
    
    // dto에 저장
    ndto.setFile(file);
    
    // 파일을 복사하기 >> target\classes 안에 폴더 경로 만들어두기
    // String str=ResourceUtils.getFile("classpath:static/temp/notice").toString();
    // 파일 저장 경로: C:\Users\EZEN 디렉토리 아래
    // String str = System.getProperty("user.home") + "/Documents/Project/book/src/main/resources/static/temp/notice";
    // 파일 저장 경로: 프로젝트 Root 아래
    String str = new File(".").getCanonicalPath() + "/src/main/resources/static/temp/notice";

    // 폴더 없으면 생성
    File dir = new File(str);
    if (!dir.exists()) {
      dir.mkdirs();
    }
    
    // 파일1이 있으면
    if (file1 != null && !file1.isEmpty()) {
      Path path=Paths.get(str+"/"+file1.getOriginalFilename());
      Files.copy(file1.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
    }
    
    // 파일2이 있으면
    if (file2 != null && !file2.isEmpty()) {
      Path path = Paths.get(str + "/" + file2.getOriginalFilename());
      Files.copy(file2.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
    }
    
    // 파일3이 있으면
    if (file3 != null && !file3.isEmpty()) {
      Path path = Paths.get(str+"/"+file3.getOriginalFilename());
      Files.copy(file3.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
    }
    
    mapper.noticeRegisterOk(ndto);
    
    return "redirect:/admin/adminNotice";
  }

  // 공지사항 수정
  @Override
  public String noticeModify(int id, Model model)
  {
    NoticeDto ndto=mapper.noticeModify(id);

    // file 문자열을 리스트로 분리
    List<String> fileList = new ArrayList<>();
    if (ndto.getFile() != null && !ndto.getFile().trim().isEmpty()) {
      fileList = Arrays.stream(ndto.getFile().split(","))
                        .map(String::trim)
                        .filter(f -> !f.isEmpty())
                        .collect(Collectors.toList());
    }

    model.addAttribute("ndto", ndto);
    model.addAttribute("fileList", fileList);
    return "/admin/noticeModify";
  }

  @Override
  public String noticeModifyOk(NoticeDto ndto, MultipartHttpServletRequest multi) throws Exception {
    // 1. 기존 파일 목록 가져오기
    String[] fileOriArray = multi.getParameterValues("fileOri"); 
    List<String> fileListOri = new ArrayList<>();
    if (fileOriArray != null) {
        fileListOri = Arrays.stream(fileOriArray)
                            .map(String::trim)
                            .filter(f -> !f.isEmpty())
                            .collect(Collectors.toList());
    }

    // 2. 새로 업로드된 파일 처리
    List<String> fileListNew = new ArrayList<>();
    String savePath = new File(".").getCanonicalPath() + "/src/main/resources/static/temp/notice";

    for (int i = 1; i <= 3; i++) {
      MultipartFile file = multi.getFile("file" + i);
      if (file != null && !file.isEmpty()) {
        String fileName = file.getOriginalFilename();

        // 서버에 파일 저장
        File saveFile = new File(savePath, fileName);
        file.transferTo(saveFile);

        fileListNew.add(fileName);
      }
    }

    // 3. 기존 + 새로 추가 파일 합치기
    List<String> fileListAll = new ArrayList<>(fileListOri);
    fileListAll.addAll(fileListNew);

    // 4. DB 업데이트
    ndto.setFile(String.join(",", fileListAll));
    mapper.noticeModifyOk(ndto);

    return "redirect:/board/noticeView?id=" + ndto.getId();
  }

  // 이벤트 목록
  @Override
  public String adminEvent(Model model, int page)
  {
    int pageSize = 5; // 페이지당 게시글 수
    int offset = (page - 1) * pageSize;

    // 페이징된 리스트 가져오기
    ArrayList<EventDto> eventList = mapper.adminEventPaging(offset, pageSize);

    // 전체 게시글 수 가져오기
    int totalCount = mapper.eventCount();

    // 전체 페이지 수 계산
    int totalPage = (int) Math.ceil((double) totalCount / pageSize);

    // 모델에 데이터 담기
    model.addAttribute("eventList", eventList);
    model.addAttribute("currentPage", page);
    model.addAttribute("totalPage", totalPage);
    return "/admin/adminEvent";
  }

  // 공지사항 등록
  @Override
  public String eventRegister() 
  {
    return "/admin/eventRegister";
  }

  @Override
  public String eventRegisterOk(EventDto edto, MultipartHttpServletRequest multi) throws Exception 
  {
    // 파일목록
    MultipartFile file1=multi.getFile("file1");
    MultipartFile file2=multi.getFile("file2");
    MultipartFile file3=multi.getFile("file3");
    
    // 저장할 파일들 이름
    String file="";
    
    // 파일 등록 유무 체크
    if (file1 != null && !file1.isEmpty()) {
      file += file1.getOriginalFilename();
    } 
    else {
      file += "";
    }

    // 파일 등록 유무 체크
    if (file2 != null && !file2.isEmpty()) {
      file += "," + file2.getOriginalFilename();
    } 
    else {
      file += "";
    }
    
    // 파일 등록 유무 체크
    if (file3 != null && !file3.isEmpty()) {
      file += "," + file3.getOriginalFilename();
    } 
    else {
      file += "";
    }
    
    // dto에 저장
    edto.setFile(file);
    
    // 파일 저장 경로: 프로젝트 Root 아래
    String str = new File(".").getCanonicalPath() + "/src/main/resources/static/temp/event";

    // 폴더 없으면 생성
    File dir = new File(str);
    if (!dir.exists()) {
      dir.mkdirs();
    }
    
    // 파일1이 있으면
    if (file1 != null && !file1.isEmpty()) {
      Path path=Paths.get(str+"/"+file1.getOriginalFilename());
      Files.copy(file1.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
    }
    
    // 파일2이 있으면
    if (file2 != null && !file2.isEmpty()) {
      Path path = Paths.get(str + "/" + file2.getOriginalFilename());
      Files.copy(file2.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
    }
    
    // 파일3이 있으면
    if (file3 != null && !file3.isEmpty()) {
      Path path = Paths.get(str+"/"+file3.getOriginalFilename());
      Files.copy(file3.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
    }
    
    mapper.eventRegisterOk(edto);
    
    return "redirect:/admin/adminEvent";
  }

  // 공지사항 수정
  @Override
  public String eventModify(int id, Model model)
  {
    EventDto edto=mapper.eventModify(id);

    // file 문자열을 리스트로 분리
    List<String> fileList = new ArrayList<>();
    if (edto.getFile() != null && !edto.getFile().trim().isEmpty()) {
      fileList = Arrays.stream(edto.getFile().split(","))
                        .map(String::trim)
                        .filter(f -> !f.isEmpty())
                        .collect(Collectors.toList());
    }

    model.addAttribute("edto", edto);
    model.addAttribute("fileList", fileList);
    return "/admin/eventModify";
  }

  @Override
  public String eventModifyOk(EventDto edto, MultipartHttpServletRequest multi) throws Exception {
    // 1. 기존 파일 목록 가져오기
    String[] fileOriArray = multi.getParameterValues("fileOri"); 
    List<String> fileListOri = new ArrayList<>();
    if (fileOriArray != null) {
        fileListOri = Arrays.stream(fileOriArray)
                            .map(String::trim)
                            .filter(f -> !f.isEmpty())
                            .collect(Collectors.toList());
    }

    // 2. 새로 업로드된 파일 처리
    List<String> fileListNew = new ArrayList<>();
    String savePath = new File(".").getCanonicalPath() + "/src/main/resources/static/temp/event";

    for (int i = 1; i <= 3; i++) {
      MultipartFile file = multi.getFile("file" + i);
      if (file != null && !file.isEmpty()) {
        String fileName = file.getOriginalFilename();

        // 서버에 파일 저장
        File saveFile = new File(savePath, fileName);
        file.transferTo(saveFile);

        fileListNew.add(fileName);
      }
    }

    // 3. 기존 + 새로 추가 파일 합치기
    List<String> fileListAll = new ArrayList<>(fileListOri);
    fileListAll.addAll(fileListNew);

    // 4. DB 업데이트
    edto.setFile(String.join(",", fileListAll));
    mapper.eventModifyOk(edto);

    return "redirect:/board/eventView?id=" + edto.getId();
  }

  @Override
  public String adminOrder(Model model) 
  {
    ArrayList<OrderDto> glist=mapper.getAdminOrder();
    model.addAttribute("glist",glist);
    return "/admin/adminOrder";
  }

  @Override
  public String chgState(int id, int state) 
  {
    try
    {
    int result=mapper.chgState(id,state);
    return result > 0 ? "1" : "0"; // DB에서 변경되었는지 true => "1" 반환 false "0" if,else가능
    }
    catch(Exception e)
    {
      e.printStackTrace();
      return "0";
    }
  }

  @Override
  public String upMember(HttpServletRequest request) 
  {
    String userid=request.getParameter("userid");
    String name=request.getParameter("name");
    
    // 적립금 가져오기
    int juk=0;
    String jukStr=request.getParameter("juk");
    if(jukStr != null && !jukStr.isEmpty())
    {
      juk=Integer.parseInt(jukStr);
    }
    
    int result=mapper.upMember(userid,name,juk);
    return result > 0? "1" : "0";
  }
  @Override
  public String delMember(String userid) 
  {
    int result=mapper.delMember(userid);
    return result > 0? "1" : "0"; 
  }

  @Override
  public String adminUser(Model model) 
  {
    ArrayList<MemberDto> mlist=mapper.getMemberList();
    model.addAttribute("mlist",mlist);
    return "/admin/adminUser";
  }

  @Override
  public String delNotice(String ids, HttpSession session) 
  {
    String[] imsi=ids.split(",");
    for(int i=0;i<imsi.length;i++)
    {
      mapper.delNotice(imsi[i]);
    }
    return "redirect:/admin/adminNotice";
  }

  @Override
  public String delEvent(String ids, HttpSession session) 
  {
    String[] imsi=ids.split(",");
    for(int i=0;i<imsi.length;i++)
    {
      mapper.delEvent(imsi[i]);
    }
    return "redirect:/admin/adminEvent";
  }

  @Override
  public String adminInquiry(Model model) 
  {
    ArrayList<InquiryDto> ilist=mapper.adminInquiry();
    model.addAttribute("ilist",ilist);
    return "/admin/adminInquiry";
  }

  @Override
  public String answer(InquiryDto idto) 
  {
    mapper.answer(idto);
    return "redirect:/admin/adminInquiry	";
  }

  // 작가와의만남 목록
  @Override
  public String adminLecture(Model model, int page)
  {
    int pageSize = 5; // 페이지당 게시글 수
    int offset = (page - 1) * pageSize;

    // 페이징된 리스트 가져오기
    ArrayList<LectureDto> lectureList = mapper.adminLecturePaging(offset, pageSize);

    // 전체 게시글 수 가져오기
    int totalCount = mapper.lectureCount();

    // 전체 페이지 수 계산
    int totalPage = (int) Math.ceil((double) totalCount / pageSize);

    // 모델에 데이터 담기
    model.addAttribute("lectureList", lectureList);
    model.addAttribute("currentPage", page);
    model.addAttribute("totalPage", totalPage);

    return "/admin/adminLecture";
  }

  // 작가와의만남 등록
  @Override
  public String lectureRegister() 
  {
    return "/admin/lectureRegister";
  }

  @Override
  public String lectureRegisterOk(LectureDto ldto, MultipartHttpServletRequest multi) throws Exception 
  {
    // 파일 1개만 처리
    MultipartFile file = multi.getFile("file1");

    String fileName = "";
    if (file != null && !file.isEmpty()) {
      fileName = file.getOriginalFilename();
    }

    // dto에 저장
    ldto.setLimg(fileName);

    // 파일 저장 경로: 프로젝트 Root 아래
    String str = new File(".").getCanonicalPath() + "/src/main/resources/static/temp/lecture";

    // 폴더 없으면 생성
    File dir = new File(str);
    if (!dir.exists()) {
      dir.mkdirs();
    }

    // 파일 저장
    if (file != null && !file.isEmpty()) {
      Path path = Paths.get(str + "/" + fileName);
      Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
    }

    // 날짜 파라미터 처리
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String sdayStr = multi.getParameter("sday");
    String edayStr = multi.getParameter("eday");

    if (sdayStr != null && !sdayStr.isEmpty()) {
      ldto.setSday(sdf.parse(sdayStr));
    }

    if (edayStr != null && !edayStr.isEmpty()) {
      ldto.setEday(sdf.parse(edayStr));
    }

    mapper.lectureRegisterOk(ldto);

    return "redirect:/admin/adminLecture";
  }

  // 작가와의만남 수정
  @Override
  public String lectureModify(int id, Model model)
  {
    LectureDto ldto = mapper.lectureModify(id);

    // 파일 1개만 처리
    List<String> fileList = new ArrayList<>();
    if (ldto.getLimg() != null && !ldto.getLimg().trim().isEmpty()) {
      fileList.add(ldto.getLimg().trim());
    }

    model.addAttribute("ldto", ldto);
    model.addAttribute("fileList", fileList);
    return "/admin/lectureModify";
  }

  @Override
  public String lectureModifyOk(LectureDto ldto, MultipartHttpServletRequest multi) throws Exception {
      // 기존 파일명 가져오기
      String[] fileOriArray = multi.getParameterValues("fileOri"); 
      String fileOri = (fileOriArray != null && fileOriArray.length > 0) ? fileOriArray[0] : "";

      // 새로 업로드된 파일
      MultipartFile file = multi.getFile("file1");
      String savePath = new File(".").getCanonicalPath() + "/src/main/resources/static/temp/lecture";

      String fileName = fileOri; // 기본값: 기존 파일 유지

      if (file != null && !file.isEmpty()) {
          // 기존 파일 삭제
          if (fileOri != null && !fileOri.isEmpty()) {
              File oldFile = new File(savePath, fileOri);
              if (oldFile.exists()) {
                  oldFile.delete();
              }
          }

          // 새 파일 저장
          fileName = file.getOriginalFilename();
          File saveFile = new File(savePath, fileName);
          file.transferTo(saveFile);
      }

      // DB에는 항상 파일 1개만 저장
      ldto.setLimg(fileName);

      String time = multi.getParameter("time");
      if (time != null && !time.isEmpty()) {
        ldto.setTime(time);
      }
      
      mapper.lectureModifyOk(ldto);

      return "redirect:/admin/adminLecture";
  }

  @Override
  public String delLecture(String ids, HttpSession session) 
  {
    String[] imsi=ids.split(",");
    for(int i=0;i<imsi.length;i++)
    {
      mapper.delLecture(imsi[i]);
    }
    return "redirect:/admin/adminLecture";
  }

}