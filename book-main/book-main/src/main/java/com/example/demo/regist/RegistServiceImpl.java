package com.example.demo.regist;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
@Qualifier("rs")
public class RegistServiceImpl implements RegistService{

	@Autowired
	private RegistMapper mapper;
	
	@Override
	public String registBook(Model model) 
	{
	  ArrayList<DaeDto> dlist=mapper.getDae();  

	  model.addAttribute("dlist",dlist);
	
	  return "/regist/registBook";
	}

	@Override
	public ArrayList<SoDto> getSo(String daecode)
	{
	  ArrayList<SoDto> slist=mapper.getSo(daecode);
	  return slist;
	}

	@Override
	public String getPcode(String pcode) 
	{
	  int num=mapper.getPcode(pcode);
	  num++;
		
	  String imsi=String.format("%03d", num);
	  return imsi;
	}
	@Override
	public String registBookOk(ProductDto pdto, MultipartHttpServletRequest multi) throws Exception 
	{
		MultipartFile file1=multi.getFile("pimg1");
		MultipartFile file2=multi.getFile("pimg2");
		MultipartFile file3=multi.getFile("pimg3");
		MultipartFile file4=multi.getFile("dimgEx");
		
		String pimg=""; // 상품그림
		String dimg=""; // 상품상세그림
		String sep=",";

		if (file1 != null && !file1.isEmpty()) {
		    pimg += file1.getOriginalFilename();
		}
		if (file2 != null && !file2.isEmpty()) {
		    if (!pimg.isEmpty()) pimg += sep;
		    pimg += file2.getOriginalFilename();
		}
		if (file3 != null && !file3.isEmpty()) {
		    if (!pimg.isEmpty()) pimg += sep;
		    pimg += file3.getOriginalFilename();
		}
		if (file4 != null && !file4.isEmpty()) {
		    dimg += file4.getOriginalFilename();
		}

		// dto에 저장
		pdto.setPimg(pimg);
		pdto.setDimg(dimg);
		// 파일을 복사하기
		String str = new File(".").getCanonicalPath() + "/src/main/resources/static/temp/product";
		
		// 폴더 없으면 생성
		File dir = new File(str);
	    if (!dir.exists()) {
	      dir.mkdirs();
	    }
		
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
		    
		    // 파일4이 있으면
		    if (file4 != null && !file4.isEmpty()) {
			      Path path = Paths.get(str+"/"+file4.getOriginalFilename());
			      Files.copy(file4.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
			    }
		
		mapper.registBookOk(pdto);
		return "redirect:/regist/registProduct";
	}

	@Override
	public String registProduct(Model model) 
	{
		ArrayList<ProductDto> plist=mapper.registProduct();
		model.addAttribute("plist",plist);
		return "/regist/registProduct";
	}

	@Override
	public String delBook(ProductDto pdto) 
	{
	  mapper.delBook(pdto.getPcode());
	  return "redirect:/regist/registProduct";
	}
}