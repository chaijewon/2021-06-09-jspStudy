<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
    String no=request.getParameter("no");
    DataBoardDAO dao=new DataBoardDAO();
    DataBoardVO vo=dao.databoardDetail(Integer.parseInt(no));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper row3">
  <main class="container clear"> 
   <h1 class="text-center">내용보기</h1>
   <table class="table">
     <tr>
       <th width="20%" class="text-center">번호</th>
       <td width=30% class="text-center"><%=vo.getNo() %></td>
       <th width="20%" class="text-center">작성일</th>
       <td width=30% class="text-center"><%=vo.getRegdate().toString() %></td>
     </tr>
     <tr>
       <th width="20%" class="text-center">이름</th>
       <td width=30% class="text-center"><%=vo.getName() %></td>
       <th width="20%" class="text-center">조회수</th>
       <td width=30% class="text-center"><%=vo.getHit() %></td>
     </tr>
     <tr>
       <th width="20%" class="text-center">제목</th>
       <td colspan="3"><%=vo.getSubject() %></td>
     </tr>
     <%
        if(vo.getFilesize()>0) // 파일이 존재하면 
        {
     %>
           <tr>
             <th width="20%" class="text-center">첨부파일</th>
             <td colspan="3"><%=vo.getFilename() %>(<%=vo.getFilesize() %>Bytes)</td>
           </tr>
     <%
        }
     %>
     <tr>
       <td colspan="4" valign="top" height="200"><pre style="white-space: pre-wrap;background-color:white;border:0"><%=vo.getContent() %></pre></td>
     </tr>
     <tr>
       <td colspan="4" class="text-right">
         <a href="#" class="btn btn-xs btn-danger">수정</a>
         <a href="#" class="btn btn-xs btn-info">삭제</a>
         <a href="../main/main.jsp?mode=2" class="btn btn-xs btn-wraning">목록</a>
       </td>
     </tr>
   </table>
  </main>
</div>
</body>
</html>