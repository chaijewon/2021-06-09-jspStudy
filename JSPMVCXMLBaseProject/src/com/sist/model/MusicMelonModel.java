package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
import com.sist.dao.*;
public class MusicMelonModel implements Model{

	@Override
	public String execute(HttpServletRequest request) {
		MusicDAO dao=new MusicDAO();
		List<MusicVO> list=dao.musicListData("melon_cjw");
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../music/melon.jsp");
		return "main/main.jsp";//메뉴/footer
	}

}
