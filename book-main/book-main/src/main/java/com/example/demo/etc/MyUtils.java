package com.example.demo.etc;

import java.time.LocalDate;

import com.example.demo.dto.ProductDto;

public class MyUtils {
	
	
	public static String getBaesong(int baeday)
	{
		// 오늘날짜 생성
		LocalDate today=LocalDate.now();
		
		LocalDate xday=today.plusDays(baeday);
		
		int imsi=xday.getDayOfWeek().getValue();
		String yoil="";
		switch(imsi)
		{
			case 1: yoil="월"; break;
			case 2: yoil="화"; break;
			case 3: yoil="수"; break;
			case 4: yoil="목"; break;
			case 5: yoil="금"; break;
			case 6: yoil="토"; break;
			case 7: yoil="일"; break;
		}
		
		int m=xday.getMonthValue();
		int d=xday.getDayOfMonth();
		
		String str="";
		if(baeday==1)
		{
			str="내일("+yoil+") 도착예정";
		}
		else if(baeday==2)
			 {
				str="모레("+yoil+") 도착예정";
			 }
			 else
			 	{
				 	str=m+"월 "+d+"일("+yoil+") 도착예정";
			 	}
		
		return str;
		
	}
	
	public static void setStars(ProductDto pdto)
	{
		double star=pdto.getStar();
		
		int ystar=0,hstar=0,gstar=0;
		
		ystar=(int)star;
		
		double imsi=star-ystar;
		
		if(imsi<0.3)
		{
			hstar=0;
		}
		else if(imsi>=0.3 && imsi<0.75)
			 {
				hstar=-1;
			 }
			 else
			 	{
				 	ystar++;
			 	}
		
		gstar=5-(ystar+hstar);
		
		pdto.setYstar(ystar);
		pdto.setHstar(hstar);
		pdto.setGstar(gstar);
	}
	
	public static String getReq(int req)
	{
		String reqStr="";
		switch(req)
		{
			case 0: reqStr="문 앞"; break;
			case 1: reqStr="직접 받고 부재시 문 앞"; break;
			case 2: reqStr="경비실"; break;
			case 3: reqStr="택배함"; break;
			case 4: reqStr="기 타"; break;
		}
		return reqStr;
	}
}
