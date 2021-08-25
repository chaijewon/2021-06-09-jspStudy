package com.sist.model;

import javax.servlet.http.HttpServletRequest;

public class ListModel {
   public void _jspService(HttpServletRequest request)
   {
	   String msg="<center><h1>게시판 목록</h1></center>";
	   request.setAttribute("msg", msg);
   }
}
