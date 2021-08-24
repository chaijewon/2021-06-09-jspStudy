<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<jsp:useBean id="model" class="com.sist.model.MovieModel"></jsp:useBean>
<%
     model.movieDetailData(request);// vo를 request를 통해서 받아 온다 
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
    width:800px;
}
h1{
  text-align: center;
}
</style>
</head>
<body>
  <div class="container">
    <h1>&lt;${vo.title }&gt; 상세보기</h1>
    <div class="row">
     <%--
       title,regdate,genre,nation,grade,time,score,showuser,poster 
     --%>
     <table class="table">
      <tr>
        <td colspan="4" class="text-center">
         <img src="${vo.poster }" width="750" height="300">
        </td>
      </tr>
      <tr>
        <th class="text-center danger" width=20%>장르</th>
        <td class="text-center" width=30%>${vo.genre }</td>
        <th class="text-center danger" width=20%>국가</th>
        <td class="text-center" width=30%>${vo.nation }</td>
      </tr>
      <tr>
        <th class="text-center danger" width=20%>등급</th>
        <td class="text-center" width=30%>${vo.score }</td>
        <th class="text-center danger" width=20%>시간</th>
        <td class="text-center" width=30%>${vo.time }</td>
      </tr>
      <tr>
        <th class="text-center danger" width=20%>평점</th>
        <td class="text-center" width=30%>${vo.score }</td>
        <th class="text-center danger" width=20%>누적관객</th>
        <td class="text-center" width=30%>${vo.showUser }</td>
      </tr>
      <tr>
        <td colspan="4" class="text-right">
          <a href="list.jsp" class="btn btn-sm btn-primary">목록</a>
        </td>
      </tr>
     </table>
    </div>
  </div>
</body>
</html>








