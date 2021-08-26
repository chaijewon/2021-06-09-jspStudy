package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReplyModel implements Model {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		// reply.do?no=${vo.no }
		// 클라이언트가 보내준 번호읽어 온다 
		String no=request.getParameter("no");
		request.setAttribute("no", no);// 답변 대상 게시물 번호 
		return "board/reply.jsp";
	}

}
