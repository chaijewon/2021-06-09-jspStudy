package com.sist.controller;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import javax.xml.parsers.*;
import org.w3c.dom.*;

import com.sist.model.Model; 
// 톰캣 (web.xml=> 등록)
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map clsMap=new HashMap(); // 키,값 ==> if을 사용할 필요가 없어진다 (Annotation) => 가독성 
    /*
     *     <init-param>
		      <param-name>contextConfigLocation</param-name>(key)
		      <param-value>C:\jspDev\jspStudy\JSPMVCXMLBaseProject\WebContent\WEB-INF\application.xml</param-value>
		    </init-param>
		    
		    Spring => txt , csv => xml
     */
	public void init(ServletConfig config) throws ServletException {
		// XML에 등록된 클래스를 읽어 온다 ==> XML의 경로가 필요 
		String path=config.getInitParameter("contextConfigLocation");
		System.out.println(path);
		try
		{
			// XML,HTML => 필요한 데이터를 읽어올때 => 파싱 (파서), 오라클 : JDBC (태그안에서 데이터 추출)
			// 라이브러리 => 파싱하는 클래스를 가지고 온다 
			DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();// 객체생성 (싱글턴으로 생성) 
			DocumentBuilder db=dbf.newDocumentBuilder(); // XML의 데이터 추출 
			// XML을 파서해서 메모리에 저장 => DOM (Docuement Object model) => 단점(속도가 늦다),장점(수정,추가,삭제)
			// ** 읽기 전용 : SAX (Simple API for XML) => Spring/MyBatis 
			Document doc=db.parse(new File(path)); // Dcouement doc=Jsoup.connection("url")
			// 1. 테이블명 => 최상위 태그 
			Element root=doc.getDocumentElement(); 
			System.out.println("root="+root.getTagName());//beans
			//bean태그를 모아서 for
			NodeList list=root.getElementsByTagName("bean"); // <bean> 7개
			/*
			 *    <bean id="main.do" class="com.sist.model.MainModel"/>
				  <bean id="movie_real.do" class="com.sist.model.MovieRealModel"/>
				  <bean id="movie_sch.do" class="com.sist.model.MovieSchModel"/>
				  <bean id="movie_box.do" class="com.sist.model.MovieBoxModel"/>
				  <bean id="music_genie.do" class="com.sist.model.MusicGenieModel"/>
				  <bean id="music_melon.do" class="com.sist.model.MusicMelonModel"/>
				  <bean id="music_total.do" class="com.sist.model.MusicTotalModel"/>
			 */
			for(int i=0;i<list.getLength();i++)
			{
				Element bean=(Element)list.item(i); 
				String id=bean.getAttribute("id");
				String cls=bean.getAttribute("class");
				//System.out.println(id+":"+cls);
				// 미리 객체를 생성후에 저장 => service()에 필요시에 사용한다 
				Class clsName=Class.forName(cls);
				Object obj=clsName.getConstructor().newInstance();
				// map에 저장 
				clsMap.put(id,obj);// 미리생성 => 필요시마다 사용이 가능(즉각)
				System.out.println(id+"=>"+obj);
				// JSP요청 + 요청처리 매핑 
			}
		}catch(Exception ex) 
		{
			ex.printStackTrace();
		}
		
	}
    // 사용자의 요청을 받아서 처리 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			//1. 요청 받기 ==> .do
			/*
			 *   main.do
			 */
			String cmd=request.getRequestURI();
			// cmd="/JSPMVCXMLBaseProject/main.do"  ==> /JSPMVCXMLBaseProject ContextPath+1
			cmd=cmd.substring(request.getContextPath().length()+1);
			// Model을 찾는다 
			Model model=(Model)clsMap.get(cmd); 
			String jsp=model.execute(request);
			//jsp => request만 전송 
			RequestDispatcher rd=request.getRequestDispatcher(jsp);
			rd.forward(request, response);
		}catch(Exception ex){ex.printStackTrace();}
	}

}









