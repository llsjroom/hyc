package com.example.demo.etc;

public class Nalja {
	public static void main(String[] args) {
		
		double star=3.76;
		
		int ystar=0,hstar=0,gstar=0;
		
		ystar=(int)star;
		
		double imsi=star-ystar;
		
		if(imsi<0.3)
		{
			hstar=0;
		}
		else if(imsi>=0.3 && imsi<0.75)
			 {
				hstar=1;
			 }
			 else
			 	{
				 	ystar++;
			 	}
		
		gstar=5-(ystar+hstar);
		
		System.out.println(ystar+" "+hstar+" "+gstar);
	}
}
