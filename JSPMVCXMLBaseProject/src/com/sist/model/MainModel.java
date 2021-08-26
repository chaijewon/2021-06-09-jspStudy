package com.sist.model;

import javax.servlet.http.HttpServletRequest;

public class MainModel implements Model{

	@Override
	public String execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return "main/main.jsp";
	}

}
