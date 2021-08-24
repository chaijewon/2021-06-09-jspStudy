<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*,java.util.*"%>
<jsp:useBean id="model" class="com.sist.model.FoodModel"></jsp:useBean>
<%
     //System.out.println("JSP:request="+request);
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
    width:960px;
}
h1{
  text-align: center;
}
</style>
</head>
<body>
  <div class="container">
    <h3>믿고 보는 맛집 리스트</h3>
    <div class="row">
     
    </div>
    <h3>지역별 인기 맛집</h3>
    <div class="row">
    
    </div>
    <h3>메뉴별 인기 맛집</h3>
    <div class="row">
    
    </div>
  </div>
</body>
</html>







