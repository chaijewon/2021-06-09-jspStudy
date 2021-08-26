package com.sist.model;

import javax.servlet.http.HttpServletRequest;

public class MemberDetailModel implements Model{

	@Override
	public String handlerRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		request.setAttribute("msg", "회원상세보기");
		return "view/detail.jsp";
	}

}
