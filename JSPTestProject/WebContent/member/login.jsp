<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
     // header(main) => id,pwd 
     String id=request.getParameter("id");
     String pwd=request.getParameter("pwd");
     // 오라클 연결 => MemberDAO
     MemberDAO dao=new MemberDAO();
     // id,pwd=>result
     String result=dao.isLogin(id, pwd);
     // 1. NOID , 2. NOPWD , 3. OK(name) => 메소드에서 결과값 (2개 => boolean),(3개 => String , int)
     if( !(result.equals("NOID") && result.equals("NOPWD")) )
     {
    	 session.setAttribute("id", id);
    	 session.setAttribute("name", result);
     }
%>
<%=result %>
<%--
     if(result.equals("NOID"))
     {
%>
         <script>
          alert("아이디가 존재하지 않습니다!!");
          history.back();
         </script>
<% 
     }
     else if(result.equals("NOPWD"))
     {
%>
         <script>
          alert("비밀번호가 틀립니다!!");
          history.back();
         </script>
<%     	 
     }
     else
     {
    	 // session에 저장 , main.jsp로 이동 
    	 session.setAttribute("id", id);
    	 session.setAttribute("name", result);
    	 response.sendRedirect("../main/main.jsp");
     }
--%>








