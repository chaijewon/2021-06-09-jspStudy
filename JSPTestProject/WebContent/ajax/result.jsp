<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.movie.*"%>
<%
    try
    {
    	request.setCharacterEncoding("UTF-8");
    }catch(Exception ex){}
    // 자동 처리 => tomcat10 , 아래버전은 인식을 하지 못한다 
    String fd=request.getParameter("fd");
    if(fd==null)
    	fd="all";
    MovieDAO dao=new MovieDAO();
    ArrayList<MovieVO> list=dao.movieFindData(fd);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <%
        for(MovieVO vo:list)
        {
     %>
	      <div class="col-md-3">
		    <div class="thumbnail">
		        <img src="<%=vo.getPoster() %>" alt="Lights" style="width:100%">
		        <div class="caption">
		          <p><%=vo.getTitle() %></p>
		        </div>
		    </div>
		  </div>
	 <%
        }
	 %>
</body>
</html>