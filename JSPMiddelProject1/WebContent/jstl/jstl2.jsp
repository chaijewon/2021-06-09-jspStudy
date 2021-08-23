<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%-- 라이브러리 읽기 (import) --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>일반 자바</h1>
  <%
      for(int i=1;i<=10;i++)
      {
  %>
           <%=i %>&nbsp;
  <%
      }
  %>
  <h1>JSTL 일반 반복문</h1>
  <c:forEach var="i" begin="1" end="10" step="1">
     ${i }&nbsp;
  </c:forEach>
  <h1>자바 for-each구문</h1>
  <%
       ArrayList<String> list=new ArrayList<String>();
	   list.add("홍길동");
	   list.add("심청이");
	   list.add("박문수");
	   list.add("강감찬");
	   list.add("을지문덕");
	   
	   ArrayList<String> sList=new ArrayList<String>();
	   sList.add("남자");
	   sList.add("여자");
	   sList.add("남자");
	   sList.add("남자");
	   sList.add("남자");
  %>
  <%
      int i=1;
      for(String name:list)
      {
  %>
         <%=i%>.<%= name %><br>
  <%
          i++;
      }
  %>
  <h1>JSTL을 이용한 forEach</h1>
  <c:set var="list" value="<%=list %>"/>
  <c:set var="sList" value="<%=sList %>"/>
  <c:forEach var="name" items="${list }" varStatus="s">
     <%-- varStatus: list의 index번호를 읽어 올때 : List가 여러개 일때 동시출력시 많이 사용 --%>
     ${s.index+1}.${name }<br>
  </c:forEach>
  <h1>List가 두개일때 일반자바</h1>
  <%
     for(int j=0;j<list.size();j++)
     {
    	 String name=list.get(j);
    	 String sex=sList.get(j);
  %>
        <%=name %>(<%=sex %>)<br>
  <%
     }
  %>
  <%-- JSTL , EL => 자바코딩을 태그형으로 변경 (Front,Back) --%>
  <h1>List가 두개일때 JSTL</h1>
  <c:forEach var="name" items="${list }" varStatus="s">
    ${name }(${sList[s.index] })<br>
  </c:forEach>
  <h1>자바로 구구단</h1>
  <%
      for(int j=1;j<=9;j++)
      {
  %>
         <%= 5+"*"+j+"="+(5*j) %><br>
  <%
      }
  %>
  <h1>JSTL 구구단</h1>
  <c:forEach var="j" begin="1" end="9" step="1">
    5*${j }=${5*j }<br>
  </c:forEach>
</body>
</html>









