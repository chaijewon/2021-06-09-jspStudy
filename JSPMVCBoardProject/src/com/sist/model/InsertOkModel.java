package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sist.dao.*;
public class InsertOkModel implements Model {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try
		{
			// 한글 변환 
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		// 사용자가 보내준 값을 받는다 
		String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
		 
		BoardVO vo=new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		
		// DAO로 전송 
		BoardDAO dao=new BoardDAO();
		dao.boardInsert(vo);
		return "redirect:list.do";//sendRedirect => Spring => => response.sendRedirect("list.do");
	}

}
