<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
    // cno전송 
    String cno=request.getParameter("cno");
    // 출력할 데이터 => DAO
    FoodDAO dao=new FoodDAO();
    CategoryVO vo=dao.foodCategoryInfo(Integer.parseInt(cno));
    ArrayList<FoodVO> list=dao.foodCategoryData(Integer.parseInt(cno));
    // 데이터를 출력하고 실행 => 실행된 결과를 main.jsp에서 읽어서 include한다
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
   <div class="jumbotron">
     <h3 class="text-center"><%=vo.getTitle() %></h3>
     <h5 class="text-center"><%=vo.getSubject() %></h5>
   </div>
   <%
      for(FoodVO fvo:list)
      {
   %>
         <table class="table">
          <tr>
            <td width=30% class="text-center" rowspan="4">
             <a href="../main/main.jsp?mode=6&no=<%=fvo.getNo()%>"><img src="<%=fvo.getPoster() %>" style="width:280px;height:180px"></a>
            </td>
            <td width=70%>
             <h3><a href="../main/main.jsp?mode=6&no=<%=fvo.getNo()%>"><%=fvo.getName() %></a>&nbsp;<span style="color:orange"><%=fvo.getScore() %></span></h3>
            </td>
          </tr>
          <tr>
            <td width=70%><%=fvo.getAddress() %></td>
          </tr>
          <tr>
            <td width=70%><%=fvo.getTel() %></td>
          </tr>
          <tr>
            <td width=70%><%=fvo.getType() %></td>
          </tr>
         </table>
   <%
      }
   %>
  </main>
</div>
</body>
</html>










