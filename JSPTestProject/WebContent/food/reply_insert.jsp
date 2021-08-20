<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
    try
    {
    	request.setCharacterEncoding("UTF-8");
    }catch(Exception ex){}
    String fno=request.getParameter("fno");
    String msg=request.getParameter("msg");
    // id,name => session 
    String id=(String)session.getAttribute("id");
    String name=(String)session.getAttribute("name");
    ReplyVO vo=new ReplyVO();
    vo.setFno(Integer.parseInt(fno));
    vo.setId(id);
    vo.setName(name);
    vo.setMsg(msg);
    
    FoodDAO dao=new FoodDAO();
    dao.foodReplyInsert(vo);
    // 이동 => food_detail로 이동 
    response.sendRedirect("../main/main.jsp?mode=6&no="+fno);
%>
