<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:useBean id="model" class="com.sist.model.MovieModel"></jsp:useBean>
<%--
       MovieModel model=new MovieModel() => useBean => 클래스 메모리 할당 => 태그로 변경
 --%>
<%
     model.movieListData(request); // Controller제작 => JSP/Servlet(자바형식:스프링)
     // request를 넘겨주고 => 결과값을 담아 달라 => request는 Call by Reference
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
    width:960px;
}
h1{
  text-align: center;
}
</style>
</head>
<body>
  <div class="container">
    <h1>다음 영화목록</h1>
    <div class="row">
      <c:forEach var="vo" items="${list }">
          <div class="col-md-3">
		      <div class="thumbnail">
		        <a href="detail.jsp?mno=${vo.mno }">
		          <img src="${vo.poster }"  style="width:100%">
		          <div class="caption">
		            <p>${fn:substring(vo.title,0,12) }</p><%-- 글자가 많아서 화면출력에 문제 발생 --%>
		          </div>
		        </a>
		      </div>
		    </div>
      </c:forEach>
    </div>
    <div class="row">
      <div class="text-center">
       <a href="list.jsp?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-danger">이전</a>
       ${curpage } page / ${totalpage } pages
       <a href="list.jsp?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-success">다음</a>
      </div>
    </div>
  </div>
  
</body>
</html>