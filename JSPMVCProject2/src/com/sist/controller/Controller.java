package com.sist.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sist.model.*;
@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1. 사용자가 요청한 사이트 주소를 받는다  
		/*
		 *   http://localhost
		 *   
		 *   /JSPMVCProject2/list.do  => getRequestURI()
		 *   ===============
		 *    request.getContextPath()
		 */
		String cmd=request.getRequestURI();
		cmd=cmd.substring(request.getContextPath().length()+1);
		System.out.println("요청:"+cmd);
		String jsp="";
		switch (cmd) 
		{
		  case  "list.do":
		  {
			  ListModel model=new ListModel();
			  model._jspService(request);
			  jsp="view/list.jsp";
		  }
			  break;
		  case "update.do":
		  {
			  UpdateModel model=new UpdateModel();
			  model._jspService(request);
			  jsp="view/update.jsp";
		  }
			  break;
		  case "delete.do":
		  {
			  DeleteModel model=new DeleteModel();
			  model._jspService(request);
			  jsp="view/delete.jsp";
		  }
			  break;
		  case "insert.do":
		  {
			  InsertModel model=new InsertModel();
			  model._jspService(request);
			  jsp="view/insert.jsp";
		  }
		      break;
		}
		
	}

}













