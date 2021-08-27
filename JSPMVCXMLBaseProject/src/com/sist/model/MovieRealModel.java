package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
import com.sist.dao.*;
public class MovieRealModel implements Model{

	@Override
	public String execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		MovieDAO dao=new MovieDAO();
		List<MovieVO> list=dao.movieListData(1); // 현재 상영영화 1, 개봉영화 2, 박스오피스 3
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../movie/real.jsp"); // list출력 
		return "main/main.jsp"; // real.jsp => include
	}

}
