package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import com.sist.controller.*;
// POJO => Spring 2.5이상 => 활성화 
// => 스프링 , 마이바티스 => 어노테이션+XML
public class BoardModel {
   @RequestMapping("board/list.do") // index(구분) => if이 없다  => if(cmd.equals("board/list.do"))
   public String boardList(HttpServletRequest request)
   {
	   request.setAttribute("msg", "게시판 목록 출력");
	   return "../board/list.jsp";
   }
   @RequestMapping("board/insert.do")
   public String boardInsert(HttpServletRequest request)
   {
	   request.setAttribute("msg", "게시판 글쓰기");
	   return "../board/insert.jsp";
   }
   @RequestMapping("board/update.do")
   public String boardUpdate(HttpServletRequest request)
   {
	   request.setAttribute("msg", "게시판 수정하기");
	   return "../board/update.jsp";
   }
   @RequestMapping("board/delete.do")
   public String boardDelete(HttpServletRequest request)
   {
	   request.setAttribute("msg", "게시판 삭제하기");
	   return "../board/delete.jsp";
   }
}
