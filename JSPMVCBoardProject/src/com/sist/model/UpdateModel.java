package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sist.dao.*;
// Controller(고정) ==> 
/*
 *   소스 코딩 
 *   jsp => link 걸기 (<a href=".do"></a>) : 사용자 요청 
 *   Model클래스를 찾아서 => 사용자가 보내준 값을 받는다 
 *   DAO에서 데이터베이스 처리 
 *   Model에서 DAO에서 결과값을 얻어 온다 
 *   jsp에 결과값 출력 
 */
public class UpdateModel implements Model {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String no=request.getParameter("no");
		BoardDAO dao=new BoardDAO();
		BoardVO vo=dao.boardUpdateData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		return "board/update.jsp";
	}

}
