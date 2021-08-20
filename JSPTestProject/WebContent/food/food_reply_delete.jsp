<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
    String no=request.getParameter("no");
    String fno=request.getParameter("fno");
    // DAO연동 
    FoodDAO dao=new FoodDAO();
    dao.foodReplyDelete(Integer.parseInt(no));
    // 이동 (댓글이 있었던 위치 이동)
    response.sendRedirect("../main/main.jsp?mode=6&no="+fno);
%>