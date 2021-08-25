<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    width:700px;
}
#main_title{
  margin: 0px auto;
}
</style>
</head>
<body>
  <div class="container">
   <div class="row">
     <img src="board/board.png" width=700 height=100 id="main_title">
     <table class="table">
       <tr>
        <th width=20% class="text-center danger">번호</th>
        <td width=30% class="text-center">${vo.no }</td>
        <th width=20% class="text-center danger">작성일</th>
        <td width=30% class="text-center">${vo.regdate }</td>
       </tr>
       <tr>
        <th width=20% class="text-center danger">이름</th>
        <td width=30% class="text-center">${vo.name }</td>
        <th width=20% class="text-center danger">조회수</th>
        <td width=30% class="text-center">${vo.hit }</td>
       </tr>
       <tr>
        <th width=20% class="text-center danger">제목</th>
        <td colspan="3">${vo.subject }</td>
       </tr>
       <tr>
         <td colspan="4" valign="top" height=200 class="text-left">
          <pre style="white-space: pre-wrap;background-color: white;border:none">${vo.content }</pre>
         </td>
       </tr>
       <tr>
         <td colspan="4" class="text-right">
           <a href="#" class="btn btn-xs btn-danger">답변</a>
           <a href="update.do?no=${vo.no }" class="btn btn-xs btn-success">수정</a>
           <a href="#" class="btn btn-xs btn-primary">삭제</a>
           <a href="list.do" class="btn btn-xs btn-info">목록</a>
         </td>
       </tr>
     </table>
   </div>
  </div>
</body>
</html>


