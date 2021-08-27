<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row{
   margin: 0px auto;
   width:900px;
}
h1{
    text-align: center;
}
</style>
</head>
<body>
   <div class="container">
    <h1>개봉 예정 영화</h1>
    <div class="row">
      <table class="table">
        <tr class="success">
          <th class="text-center"></th>
          <th class="text-center">영화명</th>
          <th class="text-center">장르</th>
          <th class="text-center">등급</th>
        </tr>
        <c:forEach var="vo" items="${list }">
          <tr>
            <td class="text-center">
              <img src="${vo.poster }" width=30 height="30">
            </td>
            <td>${vo.title }</td>
            <td>${vo.genre }</td>
            <td>${vo.grade }</td>
          </tr>
        </c:forEach>
      </table>
    </div>
   </div>
</body>
</html>