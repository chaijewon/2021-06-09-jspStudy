package com.sist.model;

import javax.servlet.http.HttpServletRequest;

public class DeleteModel {
	   public void _jspService(HttpServletRequest request)
	   {
		   String msg="<center><h1>삭제 하기</h1></center>";
		   request.setAttribute("msg", msg);
	   }
}
