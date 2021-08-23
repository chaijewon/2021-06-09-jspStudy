<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>자바에서 코딩</h1>
  <%
      for(int i=1;i<=10;i++)
      {
    	  if(i%2==0)
    	  {
  %>
             <%=i %>&nbsp;
  <%
    	  }
      }
  %>
  <%
      session.setAttribute("id", "admin");
  %>
  <h1>JSTL이용</h1>
  <c:forEach var="i" begin="1" end="10">
    <c:if test="${i%2==0 }">
      ${i }&nbsp;
    </c:if>
  </c:forEach>
  <h1>조건문</h1>
  <c:if test="${sessionScope.id=='admin' }">
    ${id }님 로그인되었습니다
  </c:if>
  <c:if test="${sessionScope.id==null }">
      로그인 하세요
  </c:if>
  <h1>scope사용</h1>
  <%
      request.setAttribute("name","홍길동");
      session.setAttribute("name1","박문수");
      application.setAttribute("name1","심청이");
  %>
  request이름:${name }<br>
  <%-- session이름:${sessionScope.name }<br> --%>
  session이름:${name1 }<br>
  <%-- application이름:${applicationScope.name }<br> --%>
  application이름:${name1 }<br>
</body>
</html>









