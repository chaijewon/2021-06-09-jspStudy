<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    int no=6;
    String colors="red,blue,green,black,yellow"; 
%>
<c:set var="no" value="<%=no %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%-- 다중 조건문 사용시  --%>
  <c:choose>
   <c:when test="${no==1 }">★</c:when>
   <c:when test="${no==2 }">★★</c:when>
   <c:when test="${no==3 }">★★★</c:when>
   <c:when test="${no==4 }">★★★★</c:when>
   <c:when test="${no==5 }">★★★★★</c:when>
   <c:otherwise>없음</c:otherwise><%-- default , else --%>
  </c:choose>
  <h1>자바 이용</h1>
  <%
     StringTokenizer st=new StringTokenizer(colors,",");
     while(st.hasMoreTokens())
     {
  %>
         <%= st.nextToken() %><br>
  <%
     }
  %>
  <h1>JSTL이용</h1>
</body>
</html>