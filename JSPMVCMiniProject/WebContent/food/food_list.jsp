<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
.row {
   margin: 0px auto;
   width:900px;
}
</style>
</head>
<body></body>
  <div class="container">
    <div class="jumbotron">
      <h1>${cvo.title }</h1>
      <h3>${cvo.subject }</h3>
    </div>
    <hr>
    <div class="row">
      <table class="table">
       <tr>
         <td>
           <c:forEach var="vo" items="${list }">
            <table class="table">
             <tr>
               <td class="text-center" width=30% rowspan="4">
                 <img src="${vo.poster }" style="width:270px;height:200px">
               </td>
               <td><h3>${vo.name }</h3></td>
             </tr>
             <tr>
               <td>${vo.address }</td>
             </tr>
             <tr>
               <td>${vo.tel }</td>
             </tr>
             <tr>
               <td>${vo.type }</td>
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



