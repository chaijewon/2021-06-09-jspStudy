<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    session.invalidate();// 전체 삭제 (id=null,name=null)
    response.sendRedirect("../main/main.jsp");
%>