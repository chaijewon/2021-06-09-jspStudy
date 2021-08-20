<%@page import="com.sist.dao.FoodDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    try
    {
    	request.setCharacterEncoding("UTF-8");
    }catch(Exception ex){}
    String no=request.getParameter("no");
    String fno=request.getParameter("fno");
    String msg=request.getParameter("msg");
    
    // DAO연결 
    FoodDAO dao=new FoodDAO();
    dao.foodReplyUpdate(Integer.parseInt(no), msg);
    // 이동 
    response.sendRedirect("../main/main.jsp?mode=6&no="+fno);
    
%>