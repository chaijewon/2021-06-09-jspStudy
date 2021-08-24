<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="model" class="com.sist.model.FoodModel"/>
<%
    model.foodDetailData(request);
%>
<%--
      core태그 , EL은 다르다 
      =======
               제어문,화면 이동  
 --%>
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
    <div class="row">
      <table class="table">
        <tr>
         <c:forTokens items="${vo.poster }" delims="^" var="image">
           <td><img src="${image }" width=100%></td>
         </c:forTokens>
        </tr>
      </table>
      <table class="table">
        <tr>
          <td colspan="2"><h3>${vo.name }&nbsp;<span style="color:orange">${vo.score }</span></h3></td>
        </tr>
        <tr>
         <th width=20% class="success">주소</th>
         <td width=80%>${vo.address }</td>
        </tr>
        <tr>
         <th width=20% class="success">전화</th>
         <td width=80%>${vo.tel }</td>
        </tr>
        <tr>
         <th width=20% class="success">음식종류</th>
         <td width=80%>${vo.type }</td>
        </tr>
        <tr>
         <th width=20% class="success">시간</th>
         <td width=80%>${vo.time }</td>
        </tr>
        <tr>
         <th width=20% class="success">가격대</th>
         <td width=80%>${vo.price }</td>
        </tr>
        <tr>
         <th width=20% class="success">메뉴</th>
         <td width=80%>${vo.menu }</td>
        </tr>
      </table>
    </div>
  </div>
</body>
</html>







