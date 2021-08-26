package com.sist.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import javax.xml.parsers.*;// XML의 데이터 자바에서 읽어 온다 
// 파싱 (데이터 크롤링) => 프레임워크는 라이브러리로 만들어져 있다 (스프링,마이바티스)
import org.w3c.dom.*;

import com.sist.model.Model;
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Map clsMap=new HashMap();
	public void init(ServletConfig config) throws ServletException {
		//1.XML의 경로를 읽는다 
		String path=config.getInitParameter("contextConfigLocation");
		System.out.println(path);
		try
		{
			DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();// 파서기를 생성해 준다 
			DocumentBuilder db=dbf.newDocumentBuilder();// 파서기 
			Document doc=db.parse(new File(path));
			Element beans=doc.getDocumentElement();
			NodeList list=beans.getElementsByTagName("bean");
			for(int i=0;i<list.getLength();i++)
			{
				Element bean=(Element)list.item(i);
				String  id=bean.getAttribute("id");
				String cls=bean.getAttribute("class");
				System.out.println(id+":"+cls);
				
				Class clsName=Class.forName(cls);
				Object obj=clsName.getConstructor().newInstance();
				clsMap.put(id, obj);
			}
			
		}catch(Exception ex) {ex.printStackTrace();}
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 사용자의 요청을 받는다 (사용자 요청 => 브라우저 주소란에 입력된 URL주소)
		String cmd=request.getRequestURI();
		// 2. 요청처리 => 자바로 제작(Model)
		cmd=cmd.substring(request.getContextPath().length()+1);
		System.out.println(cmd);
		// 3. 모델 클래스를 찾아서 요청 처리가 가능하게 만든다 
		Model model=(Model)clsMap.get(cmd);
		// 4. 요청하고 => JSP를 찾아서 => request/session을 전송 
		String jsp=model.handlerRequest(request);
		// 5. jsp로 request를 전송 
		RequestDispatcher rd=request.getRequestDispatcher(jsp);
		rd.forward(request, response);
		
	}

}












