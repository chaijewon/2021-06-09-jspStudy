package com.sist.controller;

public class MovieModel {
  @RequestMapping("movie_list.do")
  public void movieList()
  {
	  System.out.println("영화 목록 출력");
  }
  @RequestMapping("movie_detail.do")
  public void movieDetail()
  {
	  System.out.println("영화 상세 보기");
  }
  @RequestMapping("movie_reserve.do")
  public void movieReserve()
  {
	  System.out.println("영화 예매하기");
  }
}
