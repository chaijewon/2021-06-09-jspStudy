<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
     // 데이터 => no 
     String no=request.getParameter("no");
     // 쿠키 생성 
     Cookie cookie=new Cookie("f"+no,no); // 쿠키는 저장=> 항상 문자열로만 저장이 가능 ,세션은 => Object로 저장이 가능 (서버)
     cookie.setPath("/");
     // 저장 기간 설정 
     cookie.setMaxAge(60*60*24); // 초단위 
     // 클라이언트로 전송 
     response.addCookie(cookie); // 한개의 JSP는 response를 한번만 사용이 가능 
     // 클라이언트로 전송이 가능 => cookie , HTML
     // 화면 이동 => 상세보기로 이동 
     response.sendRedirect("../main/main.jsp?mode=6&no="+no);
%>