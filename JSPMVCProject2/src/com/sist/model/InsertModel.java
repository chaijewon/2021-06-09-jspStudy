package com.sist.model;

import javax.servlet.http.HttpServletRequest;

public class InsertModel {
	   public void _jspService(HttpServletRequest request)
	   {
		   String msg="<center><h1>데이터 추가</h1></center>";
		   request.setAttribute("msg", msg);
	   }
}
