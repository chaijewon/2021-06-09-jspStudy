<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,java.util.*"%>
<%
     String no=request.getParameter("no");
     String[] guList_1 = { "전체", "강서구", "양천구", "구로구", "마포구", "영등포구", "금천구",
	    "은평구", "서대문구", "동작구", "관악구", "종로구", "중구", "용산구", "서초구", "강북구",
	    "성북구", "도봉구", "동대문구", "성동구", "강남구", "노원구", "중랑구", "광진구", "송파구",
	    "강동구" };
     FoodDAO dao=new FoodDAO();
     ArrayList<FoodVO> list=dao.locationData(guList_1[Integer.parseInt(no)]);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
    for(FoodVO vo:list)
    {
 %>
  <div class="col-md-3">
    <div class="thumbnail">
      <a href="../main/main.jsp?mode=6&no=<%=vo.getNo()%>">
        <img src="<%= vo.getPoster().substring(0,vo.getPoster().indexOf("^")) %>" alt="Lights" style="width:100%">
        <div class="caption">
          <p><%=vo.getName() %></p>
        </div>
      </a>
    </div>
  </div>
<%
    }
%>
</body>
</html>