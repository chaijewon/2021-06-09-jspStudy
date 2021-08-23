<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>자바를 이용한 구구단</h1>
   <table width=600 border=1 bordercolor=black>
    <tr>
      <%
         for(int i=2;i<=9;i++)
         {
      %>
           <th><%= i+"단" %></th>
      <%
         }
      %>
    </tr>
   <%
        for(int i=1;i<=9;i++)
        {
   %>
            <tr>
   <%
        	for(int j=2;j<=9;j++)
        	{
   %>
               <td align=center><%= j+"*"+i+"="+(i*j) %></td>
   <%
        	}
   %>
          </tr>
   <%
   
        }
   %>
   </table>
   <h1>JSTL을 이용한 구구단</h1>
   <table width=600 border=1 bordercolor=black>
    <tr>
      <%-- step="1" 생략이 가능  --%>
      <c:forEach var="i" begin="2" end="9"> 
        <th>${i }단</th>
      </c:forEach>
    </tr>
    <c:forEach var="i" begin="1" end="9">
      <tr>
        <c:forEach var="j" begin="2" end="9">
          <td align=center>${ j += "*" += i += "=" += (j*i) }</td>
        </c:forEach>
      </tr>
    
    </c:forEach>
   </table>
</body>
</html>








