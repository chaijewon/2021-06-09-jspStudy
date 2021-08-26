package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sist.dao.*;
public class DeleteOkModel implements Model {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String no=request.getParameter("no");
		String pwd=request.getParameter("pwd");
		//String msg="관리자가 삭제한 게시물입니다.";
		BoardDAO dao=new BoardDAO();
		// 처리 => 결과값을 가지고 온다 
		// boolean => 본인 여부 => 비밀번호 체크 ==> 웹 (데이터베이스 : SQL) => 게시판 (CURD) 
		boolean bCheck=dao.boardDelete(Integer.parseInt(no), pwd);
		request.setAttribute("bCheck", bCheck);
		//=> Create(INSERT) Update Read(SELECT) Delete
		return "board/delete_ok.jsp";// 요청에 대한 결과값을 받는 JSP
	}

}
