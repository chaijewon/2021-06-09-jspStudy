<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="com.sist.dao.*,java.io.*" %>
<%--
      업로드 
      데이터베이스에 정보 저장 
      화면이동 => list.jsp
--%>
<%
      try
      {
    	  request.setCharacterEncoding("UTF-8");
      }catch(Exception ex){}
      String path="c:\\download";
      int max=1024*1024*100;
      String enctype="UTF-8";
      
%>
