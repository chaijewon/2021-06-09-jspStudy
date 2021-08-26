package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.BoardDAO;
import com.sist.dao.BoardVO;

public class ReplyOkModel implements Model {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		// reply.jsp에서 보내준 데이터를 받는다 
		String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
		String pno=request.getParameter("pno");//<input type=hidden name=no value="1">
		
		// BoardDAO로 전송 ==> 비밀번호를 체크하고 => 맞는 경우에 수정 
		// 메소드는 ==> 리턴형 , 매개변수 (3이상을 초과하지 않는다) ==> 묶어서 한번에 전송 ==> VO
		BoardVO vo=new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		
		BoardDAO dao=new BoardDAO();
		// 답변 처리 ==> DAO에서 처리 
		dao.boardReplyInsert(Integer.parseInt(pno), vo);
		return "redirect:list.do";// 목록으로 이동 
	}

}








