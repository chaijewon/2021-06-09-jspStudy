<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--
    try
    {
    	request.setCharacterEncoding("UTF-8");
    }catch(Exception ex){}
--%>
<fmt:requestEncoding value="UTF-8"/>
<%--
       ${requestScope.name}  => <%= request.getAttribute("name") %>
         ============= 생략이 가능 ${name}
       ${sseesionScope.id}   => <%= session.getAttribute("id") %>
         ============= 생략이 가능 ${id}
       ${applicationScope.email} => <%= application.getAttribute("email") %>
       ${param.id} => <%= request.getParameter("id")%>
       
       ==> 데이터를 request,session,application에 기존에 사용자가 보낸 데이터외의 필요한 데이터를 추가 
           
                                                           ========== 오라클에서 데이터읽기
                                        요청(영화 번호 1번을 보여달라)
       ==> 클라이언트  ========================> 서버  <======> 오리클 연결후 데이터 읽기
                      request(영화번호=1)        request(오리클 연결후 데이터 읽기,영화번호) ==> setAttribute()
       ==> request.setAttribute() ==> request.getAttribute() => ${requestScope.키}
           session.setAttribute() ==> session.getAttribute() => ${sessionScope.키}
           
 --%>
<%
    Date date=new Date();
%>
<c:set var="date" value="<%=date %>"/>
<%--
     request.setAttribute("date",date);
     => JSP안에서 자바코딩을 하지 않는다  => EL/JSTL ==> M(Java)/V(JSP) => JSP는 출력만 담당
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>입력된 값을 받는다</h1>
  <c:out value="${param.name }"/><%-- <c:~> 형식(xml) = 반드시 태그가 열리면 닫는다 --%>
  <%--
     <c:out value=""></c:out>
     <c:out value=""/>
   --%>
  <br>
  <%= request.getParameter("name") %> <br>
  오늘 날짜: <fmt:formatDate value="${date }" pattern="yyyy-MM-dd hh:mm:ss"/><br>
  <%= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(date) %>
 숫자변환 : <fmt:formatNumber value="10000" pattern="$00,000"/>
 <%-- TO_CHAR('','yyyy-mm-dd hh24:mi:ss') --%>
 <%-- TO_CHAR(10000,'$99,999') --%>
 <%-- JSP의 모든 코딩 => 자바없이 태그만 이용하는 프로그램 제작 (퍼블리셔,프론트) --%>
</body>
</html>









