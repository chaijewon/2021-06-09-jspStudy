package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.BoardDAO;
import com.sist.dao.BoardVO;

public class UpdateOkModel implements Model {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		// 경우의 수가 있다 : 비밀번호가 틀릴경우 / 비밀번호가 맞는 경우 => sendRedirect를 사용시에는 단지 이동만 할 경우에 사용
		// ============================================= Ajax
		// 1. 사용자가 보내준 값을 받는다 (update.jsp)
		try
		{
			// 한글 처리 
			request.setCharacterEncoding("UTF-8");// 한글이 전송된 경우에 사용 (숫자,알파벳은 상관없다)
			// ==> POST방식으로 전송된 경우에 사용 (POST방식에 대한 => 디코딩)
			// 인코딩 (1byte) ==> 디코딩(2byte)
			// GET => server.xml(63줄 => <Connector URIEncoding="UTF-8">)
		}catch(Exception ex) {}
		String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
		String no=request.getParameter("no");//<input type=hidden name=no value="1">
		
		// BoardDAO로 전송 ==> 비밀번호를 체크하고 => 맞는 경우에 수정 
		// 메소드는 ==> 리턴형 , 매개변수 (3이상을 초과하지 않는다) ==> 묶어서 한번에 전송 ==> VO
		BoardVO vo=new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		vo.setNo(Integer.parseInt(no));
		BoardDAO dao=new BoardDAO();
		// 처리 메소드를 호출 
		boolean bCheck=dao.boardUpdate(vo);
		request.setAttribute("bCheck", bCheck);
		request.setAttribute("no", no); // 게시물번호 => 내용보기  => true (내용보기로 이동)
		// http://localhost/JSPMVCBoardProject/detail.do?no=16
		// ?뒤에 어떤 데이터를 전송하고 있는지 확인 
		return "board/update_ok.jsp";
	}

}














