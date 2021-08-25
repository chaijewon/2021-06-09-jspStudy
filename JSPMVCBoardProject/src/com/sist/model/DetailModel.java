package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sist.dao.*;
/*
 *   클라이언트 (브라우저) ========= Controller <========> Model <=======> DAO
 *            .do                     | request
 *                                   JSP
 *     detail.do  ====== Controller호출 (service()) =====> Model을 불러온다 , 
 *                                              Model=> handlerRequest(request에 값을 담아준다)
 *     
 */
public class DetailModel implements Model {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		// 사용자 보내준 게시물 번호를 받는다 
		String no=request.getParameter("no");
		// 게시물 번호에 해당되는 데이터를 오라클로부터 읽어 온다 => BoardDAO
		BoardDAO dao=new BoardDAO();
		// 결과값을 가지고 온다 
		BoardVO vo=dao.boardDetailData(Integer.parseInt(no));
		request.setAttribute("vo", vo);// detail.jsp로 결과값을 보내준다 ==> 화면만 읽어온다 => Controller (forward())
		return "board/detail.jsp";
	}

}
