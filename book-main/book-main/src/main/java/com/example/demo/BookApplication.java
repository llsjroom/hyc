package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class BookApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(BookApplication.class, args);
	}
	
	@Override
  protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
      return builder.sources(BookApplication.class);
  }

	@Bean
	public FilterRegistrationBean<SitemeshConfig> sitemeshbean()
	{
		FilterRegistrationBean<SitemeshConfig> bean=new FilterRegistrationBean<SitemeshConfig>();
		bean.setFilter(new SitemeshConfig());
		return bean;
	}
	
}