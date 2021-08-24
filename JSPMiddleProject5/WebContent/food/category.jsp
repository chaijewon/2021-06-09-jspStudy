<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="model" class="com.sist.model.FoodModel"/>
<%--
    Class.forName("패키지명.클래스명") => 메모리 할당
 --%>
<%
    model.categoryData(request);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
   margin-top: 30px;
}
.row{
    margin: 0px auto;
}
h1{
  text-align: center;
}
</style>
</head>
<body>
  <div class="container-fluid">
    <h3>믿고 보는 맛집 리스트</h3>
    <div class="row">
     <%-- varStatus => list의 인덱스 번호 (0) --%>
     <%--
            for(FoodVO vo:list)
                ========= ====
                  var      items  
      --%>
     <c:forEach var="vo" items="${list }" varStatus="s">
       <c:if test="${s.index>=0 && s.index<12}">
         <div class="col-md-3">
		      <div class="thumbnail">
		        <a href="list.jsp?cno=${vo.cno }">
		          <img src="${vo.poster }"  style="width:100%">
		          <div class="caption">
		            <p>${vo.title }</p><%-- 글자가 많아서 화면출력에 문제 발생 --%>
		          </div>
		        </a>
		      </div>
		    </div>
       </c:if>
     </c:forEach>
    </div>
    <h3>지역별 인기 맛집</h3>
    <div class="row">
       <c:forEach var="vo" items="${list }" varStatus="s">
       <c:if test="${s.index>=12 && s.index<18}">
        <div class="col-md-4">
		      <div class="thumbnail">
		        <a href="list.jsp?cno=${vo.cno }">
		          <img src="${vo.poster }"  style="width:100%">
		          <div class="caption">
		            <p>${vo.title }</p><%-- 글자가 많아서 화면출력에 문제 발생 --%>
		          </div>
		        </a>
		      </div>
		    </div>
       </c:if>
     </c:forEach>
    </div>
    <h3>메뉴별 인기 맛집</h3>
    <div class="row">
       <c:forEach var="vo" items="${list }" varStatus="s">
       <c:if test="${s.index>=18 && s.index<30}">
        <div class="col-md-3">
		      <div class="thumbnail">
		        <a href="list.jsp?cno=${vo.cno }">
		          <img src="${vo.poster }"  style="width:100%">
		          <div class="caption">
		            <p>${vo.title }</p><%-- 글자가 많아서 화면출력에 문제 발생 --%>
		          </div>
		        </a>
		      </div>
		    </div>
       </c:if>
     </c:forEach>
    </div>
  </div>
</body>
</html>







