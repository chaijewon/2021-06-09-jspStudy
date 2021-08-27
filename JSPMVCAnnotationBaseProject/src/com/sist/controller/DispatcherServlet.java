package com.sist.controller;

import java.io.*;
import java.lang.reflect.Method;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    List<String> clsList=new ArrayList<String>();// XML
    // 한번수행 
	public void init(ServletConfig config) throws ServletException {
		clsList.add("com.sist.model.BoardModel");
	}
	// 요청시마다 수행 => 쓰레드 함수 
	/*
	 *   class Execute implements Runable
	 *   {
	 *       public static void main(String[] arg)
	 *       {
	 *           init();
	 *           new Thread(this).start()
	 *       }
	 *       public void run()
	 *       {
	 *          while(true)
	 *          {
	 *             service()
	 *          }
	 *       }
	 *   }
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
				String cmd=request.getRequestURI();
				cmd=cmd.substring(request.getContextPath().length()+1);
				System.out.println("cmd="+cmd);
				for(String cls:clsList)
				{
					Class clsName=Class.forName(cls); // 클래스 정보 (생성자,멤버변수,메소드)
					Object obj=clsName.getDeclaredConstructor().newInstance();// new BoardModel()
					// 이미 자바 만들어져 있고 => 컴파일이 종료 => .class (메소드) => 소스코딩을 할 수 없다 
					// 메소드 찾기 (클래스 찾기) Map(클래스 => 저장)
					Method[] methods=clsName.getDeclaredMethods();
					for(Method m:methods)
					{
						RequestMapping rm=(RequestMapping)m.getAnnotation(RequestMapping.class);
					    if(rm.value().equals(cmd))
					    {
					    	String jsp=(String)m.invoke(obj, request);
					    	// 이동 
					    	RequestDispatcher rd=request.getRequestDispatcher(jsp);
					    	rd.forward(request, response);
					    	return;
					    }
					}
				}
		}catch(Exception ex) {}
	}

}











