<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper row3">
  <main class="container clear"> 
   <h1 class="text-center">자료실 등록</h1>
   <form method=post action="../databoard/insert_ok.jsp" enctype="multipart/form-data">
   <%--
         enctype="multipart/form-data" : 파일업로드에 사용되는 프로토콜 
         기본은 post
         일반 게시판에서 사용시는 enctype="multipart/form-data" 사용할 수 없다 
         => 자료실 , 후기게시판 , 겔러리
    --%>
   <%--
       <input> , <textarea> , <select>
    --%>
   <table class="table">
    <tr>
      <th width="15%" class="text-center">이름</th>
      <td width="85%"><input type=text name=name size=15 class="input-sm"></td>
    </tr>
    <tr>
      <th width="15%" class="text-center">제목</th>
      <td width="85%"><input type=text name=subject size=55 class="input-sm"></td>
    </tr>
    <tr>
      <th width="15%" class="text-center">내용</th>
      <td width="85%"><textarea rows="8" cols="60" name=content></textarea></td>
    </tr>
    <tr>
      <th width="15%" class="text-center">첨부파일</th>
      <td width="85%"><input type=file size=20 name=upload class="input-sm"></td>
    </tr>
    <tr>
      <th width="15%" class="text-center">비밀번호</th>
      <td width="85%"><input type=password name=pwd size=10 class="input-sm"></td>
    </tr>
    <tr>
      <td colspan="2" class="text-center">
        <input type=submit class="btn btn-sm btn-danger" value="글쓰기">
        <input type=button class="btn btn-sm btn-success" value="취소"
          onclick="javascript:history.back()"
        >
      </td>
    </tr>
   </table>
   </form>
   </main>
</div>
</body>
</html>











