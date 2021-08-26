package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import com.sist.dao.*;
/*
 *   list.jsp
 *   <%
 *       
 *   %>
 */
public class ListModel implements Model {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		BoardDAO dao=new BoardDAO();
		List<BoardVO> list=dao.boardListData(curpage);
		int totalpage=dao.boardTotalPage();
		String msg="관리자가 삭제한 게시물입니다.";
		// 데이터 목록 , 현재페이지 , 총페이지 
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("msg", msg);
		return "board/list.jsp";//jsp => Model에서 넘겨준 request에 담긴 데이터를 출력만 한다 (view)
	}

}







