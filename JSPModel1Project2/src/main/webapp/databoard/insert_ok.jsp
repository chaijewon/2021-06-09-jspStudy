<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.*" %>    
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="com.sist.dao.*,java.io.*" %>
<%--
      업로드 
      데이터베이스에 정보 저장 
      화면이동 => list.jsp
--%>
<%
        // public MultipartRequest(javax.servlet.http.HttpServletRequest request, java.lang.String saveDirectory) throws java.io.IOException;
		try
		{
			  request.setCharacterEncoding("UTF-8");
		}catch(Exception ex){}
		String path="c:\\download";
		int size=1024*1024*100;
		String enctype="UTF-8";
		// 2008 => 버전상의 문제 
		MultipartRequest mr=
				new MultipartRequest(request, path,size,enctype,new DefaultFileRenamePolicy());
		
      // 업로드 종료
      
%>
