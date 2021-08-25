<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    response.sendRedirect("list.do"); // Controller => 해당 Model클래스 찾는다 => 수행된 결과를 request를 통해서 JSP전송
%>