package com.sist.model;

import javax.servlet.http.HttpServletRequest;

public class DataModel implements Model{

	@Override
	public String execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		request.setAttribute("msg", "기능 추가");
		request.setAttribute("main_jsp", "../data/data.jsp");
		return "main/main.jsp";
	}

}
