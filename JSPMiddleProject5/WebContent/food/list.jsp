<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="model" class="com.sist.model.FoodModel"/>
<%
    model.foodListData(request);
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
   <div class="row">
     <table class="table">
      <tr>
       <td>
         <c:forEach var="vo" items="${list }">
           <table class="table">
            <tr>
             <td width=35% class="text-center" rowspan="4">
               <a href="detail.jsp?no=${vo.no }"><img src="${vo.poster }" width="100%"></a>
             </td>
             <td width=65%><h3><a href="detail.jsp?no=${vo.no }">${vo.name }</a>&nbsp;<span style="color:orange">${vo.score }</span></h3></td>
            </tr>
            <tr>
              <td width=65%>주소:${vo.address }</td>
            </tr>
            <tr>
              <td width=65%>전화번호:${vo.tel }</td>
            </tr>
            <tr>
              <td width=65%>음식종류:${vo.type }</td>
            </tr>
           </table>
         </c:forEach>
       </td>
      </tr>
     </table>
     
   </div>
  </div>
</body>
</html>








