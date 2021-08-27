package com.sist.controller;

public class BoardModel {
	@RequestMapping("list.do")
	public void boardList()
	{
		System.out.println("게시판 목록");
	}
	
	@RequestMapping("insert.do")
	public void boardInsert()
	{
		System.out.println("게시판 글쓰기");
	}
	
	@RequestMapping("update.do")
	public void boardUpdate()
	{
		System.out.println("게시판 수정하기");
	}
	
	@RequestMapping("delete.do")
	public void boardDelete()
	{
		System.out.println("게시판 삭제하기");
	}
	
	@RequestMapping("find.do")
	public void boardFind()
	{
		System.out.println("게시판 찾기");
	}
}
