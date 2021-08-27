package com.sist.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 *    XML 파싱  : HandlerMapping
 *    클래스 관리 : WebApplicationContext
 *    패키지에 있는 모든 자바파일 => List FileConfig
 */
import java.util.*;
import javax.xml.parsers.*;
import org.w3c.dom.*;
/*
 *     public class BoardDAO
 *     {
 *         private static BoardDAO dao;
 *         public static BoardDAO newInstance()
 *         {
 *            if(dao==null)
 *                 dao=new BoarDAO();
 *                 
 *            return dao;
 *         }
 *     }
 *     
 *     BoardDAO dao=BoardDAO.newInstance();  ==> BoardDAO dao=new BoardDAO(); dao=> 주소가 남아있다 (메모리 누수)
 *     ====================================
 */
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    // 클래스 목록 저장 
	/*
	 *   1. 싱글턴 패턴 
	 *   2. Factory패턴 
	 *   3. Overserver 패턴 
	 *   4. MVC패턴 
	 *   ------------------- 어뎁터 , ... (스프링 => 8개) => GOF (23개)
	 */
	private List<String> clsList=new ArrayList<String>();
	public void init(ServletConfig config) throws ServletException {
		try
		{
			//1. XML의 경로 => web.xml에 등록 (클래스명은 xml파일 등록)
			String path=config.getInitParameter("contextConfigLocation");
			//2. XML 파싱 
			DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();// 싱글턴 (메모리 생성 한번만 수행)
			// newInstance() , getInstance()
			//3. 파싱기 생성
			DocumentBuilder db=dbf.newDocumentBuilder();
			//4. XML을 파싱후 저장 
			Document doc=db.parse(new File(path));
			//5. 계층 구조 => 루트태그 <beans>
			Element root=doc.getDocumentElement();
			//6. 같은 이름의 태그를 묶어서 처리 
			NodeList list=root.getElementsByTagName("bean");
			/*
			 *   <beans>
			 *     <bean class=""/>
			 *     <bean class=""/>
			 *     <bean class=""/>
			 *     <bean class=""/>
			 *     <bean class=""/>
			 *   </beans>
			 */
			for(int i=0;i<list.getLength();i++)
			{
				Element bean=(Element)list.item(i); // 저장된 태그를 가지고 온다 
				String cls=bean.getAttribute("class");
				clsList.add(cls);
			}
		}catch(Exception ex){}
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			//1. 사용자 요청 URI을 받는다 
			// http://localhost/JSPMVCAnnoXMLBaseProject/main/main.do , board/list.do
			String cmd=request.getRequestURI();
			cmd=cmd.substring(request.getContextPath().length()+1);
			// Model클래스가 가지고 있는 메소드를 찾아서 => 수행 
			// 2. Model 클래스 가지고 온다 
			for(String modelClass:clsList)
			{
				//3. 클래스 정보 읽기 
				Class clsName=Class.forName(modelClass);
				//4. 메모리 할당 
				Object obj=clsName.getDeclaredConstructor().newInstance();
				//5. 메소드를 찾아서 호출 
				Method[] methods=clsName.getDeclaredMethods();
				// method위에 있는 어노테이션을 읽어서 => 사용자가 보내준 cmd
				for(Method m:methods)
				{
					// 메소드 위에서 => 어노테이션 
					RequestMapping rm=(RequestMapping)m.getAnnotation(RequestMapping.class);
					if(rm.value().equals(cmd))
					{
						// 메소드 호출 => 요청 처리 
						String jsp=(String)m.invoke(obj, request,response);
						// 요청 처리된 결과를 JSP로 보낸다 
						if(jsp.startsWith("redirect"))
						{
							// return "redirect:list.do" => request를 JSP로 전송하지 않는다 
							response.sendRedirect(jsp.substring(jsp.indexOf(":")+1));
						}
						else
						{
							// forward => request를 JSP로 전송 => 출력  
							RequestDispatcher rd=request.getRequestDispatcher(jsp);
							rd.forward(request, response);
						}
						return;
					}
				}
			}
		}catch(Exception ex){}
	}

}










