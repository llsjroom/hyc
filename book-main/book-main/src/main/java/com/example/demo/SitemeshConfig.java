package com.example.demo;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

public class SitemeshConfig extends ConfigurableSiteMeshFilter{

	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder)
	{
    builder.addDecoratorPath("*", "/layout.jsp");
    builder.addDecoratorPath("/admin/*", "/adminLayout.jsp");
    builder.addDecoratorPath("/regist/*", "/adminLayout.jsp");
    
    // 제외할 경우
    //builder.addExcludedPath("경로");
    builder.addExcludedPath("/");
    builder.addExcludedPath("/product/baesongList");
    builder.addExcludedPath("/product/baesongAdd");
    builder.addExcludedPath("/product/baesongUp");
  }
}
