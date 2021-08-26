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
     <form method=post action="reply_ok.do">
     <table class="table">
      <tr>
       <th width=20% class="text-right danger">이름</th>
       <td width=80%>
        <input type=text name=name size=20 class="input-sm" required>
        <input type=hidden name=pno value="${no }"><%-- pno(상위 번호) --%>
       </td>
      </tr>
      <tr>
       <th width=20% class="text-right danger">제목</th>
       <td width=80%>
        <input type=text name=subject size=50 class="input-sm" required>
       </td>
      </tr>
      <tr>
       <th width=20% class="text-right danger">내용</th>
       <td width=80%>
        <textarea rows="8" cols="55" name=content required></textarea>
       </td>
      </tr>
      <tr>
       <th width=20% class="text-right danger">비밀번호</th>
       <td width=80%>
        <input type=password name=pwd size=15 class="input-sm" required>
       </td>
      </tr>
      <tr>
       <td colspan="2" class="text-center">
         <input type=submit value="답변" class="btn btn-sm btn-danger">
         <input type=button value="취소" class="btn btn-sm btn-success" 
          onclick="javascript:history.back()">
       </td>
      </tr>
     </table>
     </form>
   </div>
  </div>
</body>
</html>