package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
import com.sist.dao.*;
public class MusicTotalModel implements Model{

	@Override
	public String execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		MusicDAO dao=new MusicDAO();
		List<MusicVO> list=dao.musicTotalData();
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../music/total.jsp");
		return "main/main.jsp";
	}

}

