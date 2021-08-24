package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
import com.sist.dao.*;
// MV
/*
 *    JSP
 *    <%
 *        String page=request.getParameter("page");
	      if(page==null)
		   page="1";
 *    %>
 */
public class MovieModel {
   public void movieListData(HttpServletRequest request)
   {
	   //1. page전송 
	   String page=request.getParameter("page");
	   if(page==null)
		   page="1";
	   int curpage=Integer.parseInt(page);
	   // DAO
	   MovieDAO dao=new MovieDAO();
	   ArrayList<MovieVO> list=dao.movieListData(curpage);
	   // 총페이지 
	   int totalpage=dao.movieTotalPage();
	   request.setAttribute("list", list); // JSP전송 => ${}
	   request.setAttribute("curpage", curpage);
	   request.setAttribute("totalpage", totalpage);
   }
   public void movieDetailData(HttpServletRequest request)
   {
	   // <% %>
	   String mno=request.getParameter("mno");
	   
	   
   }
}










