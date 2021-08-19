<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
              쿠키 : 클라이언트 저장소에 저장 
       ========================
              생성  Cookie c=new Cookie(String key,String value) => 값을 저장할때 반드시 문자열로 저장 
                               =========== 반드시 알파벳으로 시작 , key는 중복할 수 없다 (같은 맛집을 클릭시 => 덮어쓴다)
        기간설정 : setMaxAge(초) => 60*60*24 (1일)
        저장위치 : setPath("/")
        클라이언트로 전송 : addCookie(cookie명지정)
        쿠키 삭제  : setMaxAge(0)
 --%>
<%
     Cookie[] cookies=request.getCookies(); // 클라이언트에 저장된 전체 쿠키를 읽어 온다 
     for(int i=0;i<cookies.length;i++)
     {
    	 if(cookies[i].getName().startsWith("f")) // 키가 f로 시작한 모든 쿠키 
    	 {
    		 cookies[i].setPath("/");
    		 cookies[i].setMaxAge(0); // 삭제
    		 response.addCookie(cookies[i]);// 클라언트로 전송 
    	 }
     }
     
     response.sendRedirect("../main/main.jsp"); // main페이지로 이동 
%>