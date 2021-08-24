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
	   // 기존의 JSP가 가지고 있는 request에 데이터를 추가해서 전송 => JSP 추가된 데이터를 출력한다 (EL/JSTL,액션)
	   // JAVA/JSP =>  분리 => M(Model:Java)V(View:JSP)
	   request.setAttribute("list", list); // JSP전송 => ${}
	   request.setAttribute("curpage", curpage);
	   request.setAttribute("totalpage", totalpage);
   }
   
   public void movieDetailData(HttpServletRequest request)// request는 JSP가 가지고 있는 request를 받아서 데이터 추가 
   {
	   // <% %>
	   String mno=request.getParameter("mno");
	   MovieDAO dao=new MovieDAO();
	   MovieVO vo=dao.movieDetailData(Integer.parseInt(mno)); // JSP로 전송 (request:JSP)
	   request.setAttribute("vo", vo); // 추가된 데이터를 출력하기 위해서 JSP로 전송하는 객체 
	   
   }
}










