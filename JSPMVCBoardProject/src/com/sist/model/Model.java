package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Model {
  // 기능 처리 메소드 제작 
  public String handleRequest(HttpServletRequest request,HttpServletResponse response);
}
