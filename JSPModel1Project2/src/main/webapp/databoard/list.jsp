<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,java.util.*"%>
<%
    // page를 받는다  => 링크 (경로)
    String strPage=request.getParameter("page");
    /*
          request(사용자 보내준 데이터를 묶어서 전송(요청정보)) => 요청정보를 전체를 톰캣이 한번에 묶어서 넘겨준다 
          =======
           JSP마다 request를 따로 가지고 있다 
           =============================
             JSP와 JSP가 request를 공유 => include / forward
           main.jsp?mode=1&page=1
                    ====== ======
                    mode는 main.jsp에서만 사용 => mode에 따라서 화면 변경 
                    page => databoard/list.jsp에서 사용 
           *** include가 된 상태 => 항상 main.jsp룰 호출한다      
    */
    if(strPage==null)
    	strPage="1";
    
    int curpage=Integer.parseInt(strPage);
    // 현재 페이지 
    // 현재 페이지에 해당되는 데이터 읽기 
    DataBoardDAO dao=new DataBoardDAO();
    ArrayList<DataBoardVO> list=dao.databoardListData(curpage);
    int totalpage=dao.databoardTotalPage();
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
   <h1 class="text-center">자료실</h1>
   <table class="table">
    <tr>
     <td>
       <a href="../main/main.jsp?mode=3" class="btn btn-sm btn-primary">새글</a>
     </td>
    </tr>
   </table>
   <div style="height:450px">
   <table class="table">
     <tr>
      <th width=10% class="text-center">번호</th>
      <th width=45% class="text-center">제목</th>
      <th width=15% class="text-center">이름</th>
      <th width=20% class="text-center">작성일</th>
      <th width=10% class="text-center">조회수</th>
     </tr>
     <%
        for(DataBoardVO vo:list)
        {
     %>
           <tr>
		      <td width=10% class="text-center"><%=vo.getNo() %></td>
		      <td width=45%><%=vo.getSubject() %></td>
		      <td width=15% class="text-center"><%=vo.getName() %></td>
		      <td width=20% class="text-center"><%=vo.getRegdate().toString() %></td>
		      <td width=10% class="text-center"><%=vo.getHit() %></td>
		     </tr>
     <%
        }
     %>
     <tr>
       <td colspan="5" class="text-center">
         <a href="../main/main.jsp?mode=2&page=<%= curpage>1?curpage-1:curpage %>" class="btn btn-sm btn-primary">이전</a>
         <%=curpage %> page / <%=totalpage %> pages
         <a href="../main/main.jsp?mode=2&page=<%= curpage<totalpage?curpage+1:curpage %>" class="btn btn-sm btn-primary">다음</a>
       </td>
     </tr>
   </table>
   </div>
  </main>
 </div>
</body>
</html>






