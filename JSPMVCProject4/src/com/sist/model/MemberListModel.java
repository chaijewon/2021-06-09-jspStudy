package com.sist.model;

import javax.servlet.http.HttpServletRequest;

public class MemberListModel implements Model{

	@Override
	public String handlerRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		request.setAttribute("msg", "회원 목록");
		return "view/list.jsp";
	}

}
