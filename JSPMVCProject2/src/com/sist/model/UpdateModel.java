package com.sist.model;

import javax.servlet.http.HttpServletRequest;

public class UpdateModel {
	   public void _jspService(HttpServletRequest request)
	   {
		   String msg="<center><h1>수정 하기</h1></center>";
		   request.setAttribute("msg", msg);
	   }
}
