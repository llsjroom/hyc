package com.example.demo;

import org.springframework.context.annotation.Configuration;
import org.springframework.lang.NonNull;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class AdminConfig implements WebMvcConfigurer {
  @Override
  public void addInterceptors(@NonNull InterceptorRegistry registry) {
    registry.addInterceptor(new AdminInterceptor())
            .addPathPatterns("/admin/**") // /admin/ 아래 모든 경로
            .addPathPatterns("/regist/**"); // /admin/ 아래 모든 경로
  }
}
