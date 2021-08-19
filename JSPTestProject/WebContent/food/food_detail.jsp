<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
    String no=request.getParameter("no");
    // no에 해당되는 데이터를 오라클에서 가지고 온다 
    FoodDAO dao=new FoodDAO();
    FoodVO vo=dao.foodDetailData(Integer.parseInt(no));
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
    <div class="row">
      <table class="table">
        <tr>
          <%
              StringTokenizer st=new StringTokenizer(vo.getPoster(),"^");
              while(st.hasMoreTokens())
              {
          %>
                 <td class="text-center">
                  <img src="<%=st.nextToken() %>" width=100% class="img-rounded">
                 </td>
          <%
              }
          %>
        </tr>
      </table>
    </div>
    <div class="row">
	    <div class="col-sm-8">
	      <table class="table">
	        <tr>
	         <td colspan="2">
	          <h3><%=vo.getName() %>&nbsp;<span style="color:orange"><%=vo.getScore() %></span></h3>
	         </td>
	        </tr>
	      </table>
	    </div>
	    <div class="col-sm-4">
	    
	    </div>
    </div>
  </main>
</div>
</body>
</html>