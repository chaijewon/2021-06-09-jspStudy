package com.sist.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sist.model.*;
import java.util.*;

@WebServlet("*.do") // 구분하기 (요청 => 목록 : list.do , 추가: insert.do,수정:update.do) => Controller
/*
 *   클라이언트(사용자) : 손님
 *   Controller : 서빙 
 *   Model : 음식 => com.sist.model => 주방 
 *   
 *   손님 ========> 서빙 =====> 주방에 요청  
 *       음식주문             요청 
 *      <========     <=====
 *      
 *   브라우저 ====> 요청 ====> Controller =====> Model 찾기 ===> Model 수행 ===> Controller ====> 브라우저로 전송
 *   
 *   Controller ==> 메뉴,Model,View => 인식 
 *   
 *   517page 
 *   =======
 *   17장 => 서블릿 실행순서 (506page)
 *          ===========
 *          메모리 할당 (톰캣)
 *          //////////////////////////////////////////////////////////
 *          init(): 호출 ==> 파일 읽기(XML), 클래스 메모리 할당후에 저장 (1번만 호출)
 *          service() : 클라이언트 요청에 대한 처리 => HTML을 브라우저로 전송 => 요청시마다 호출 
 *          destory() : 메모리 해제 
 *          ///////////////////////////////////////// 자동호출 //////////
 *          514page : URL - Pattern 
 *          *.() ==> 프로그래머 마음대로 지정  ==> *.do , *.회사명   ==> *.nhn , *.daum , *.sist => 서블릿을 찾을 수 있게
 *          /Controller  => *.do ...
 *          / => 어떤 확장자가 들어와도 괜찮다 
 *          
 *          ==> web.xml (어노테이션을 이용하고 있다) ===> Spring:web.xml
 *          JAXB / JAXP => Jsoup ==> 한개의 클래스에서 처리 (메소드찾기 => 어노테이션) => 스프링 (40%)
 *          ====
 *          1.8
 *          
 *          => JSP(사용자=요청)  =======> Controller  ========> 해당 클래스를 찾아서 요청 처리  <====> DAO
 *                               .do                          비지니즈로직(Model Calss)
 *             Model클래스 ====> 결과값을 전송  =======> Controller ====> JSP로 전송 (추가된 데이터를 읽어서 화면에 출력)
 *                             ==========                               | 클라이언트 브라우저 읽기
 *                              request : 한번 사용(일반 데이터)
 *                              session : 기간동안 사용 (클라이언트 정보 , 예매정보)
 *                              => setAttribute() : 필요한 데이터를 추가해서 JSP전송  
 *             Controller ===> 전송 할때 사용하는 메소드 
 *                  => 1. JSP를 찾는다
 *                        RequestDispatcher rd=request.getRequestDispatcher(jsp파일명)
 *                           
 *                     2. JSP로 request를 전송 (request에는 요청결과에 대한 데이터가 추가)
 *                        rd.forward(request,response)
 *                     3. 출력에 필요한 데이터를 받은 JSP에 화면 출력 
 *          => Controller중심으로 요청=응답
 *             =============
 *               => 서비스 중간에 유지보수를 할 수 없다 (한번에 고정)
 *               => 자주 수정을 하거나 추가하는 소스코딩을 하면 안된다 => 명령어(메뉴)나 클래스를 추가하면 안된다 
 *                  ==================================== 파일을 이용해서 등록(XML,Properties)
 *                                                                     ====== Spring/Struts(XML)
 *                                                                     ====== Controller를 공개하지 않는다
 *               => 클래스 = 모델 (사용자 요청 => 요청에 한개만 만들어서 수행 ==> 클래스가 많아서 관리하기 어렵다)
 *                  ===== 같은 종류의 요청 ==> 메소드 처리 
 *                                        ========> 찾기 조건이 많아진다 => 찾기를 쉽게 만들고 자동으로 호출이 가능
 *                                                                   ============== 어노테이션 
 */
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String[] menu= {
    		"list.do",
    		"insert.do",
    		"insert_ok.do",
    		"detail.do",
    		"update.do",
    		"update_ok.do",
    		"delete.do",
    		"delete_ok.do",
    		"reply.do",
    		"reply_ok.do",
    		"find.do"
    };
    // 사용자 요청한 내용을 처리 하는 클래스들의 집합 => 비지니스로직 (Model)
    private String[] strCls= {
    		"com.sist.model.ListModel",
    		"com.sist.model.InsertModel",
    		"com.sist.model.InsertOkModel",
    		"com.sist.model.DetailModel",
    		"com.sist.model.UpdateModel",
    		"com.sist.model.UpdateOkModel",
    		"com.sist.model.DeleteModel",
    		"com.sist.model.DeleteOkModel",
    		"com.sist.model.ReplyModel",
    		"com.sist.model.ReplyOkModel",
    		"com.sist.model.FindModel"	
    };
    // ==> 파일에 작성 => XML
    private Map clsMap=new HashMap();
    // <component-scan base-package="com.sist.model">
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		// 메뉴판 => 스프링은 결합성(영향력)이 낮은 프로그램  => 영향력이 낮은 프로그램 작성 => new를 사용하지 않는다 
		// interface , factory-pattern(스프링)
		try
		{
			for(int i=0;i<strCls.length;i++)
			{
				Class clsName=Class.forName(strCls[i]);
				// 클래스에 대한 모든 정보를 가지고 온다 => 메소드,변수 , 생성자 .... (리플렉션)
				Object obj=clsName.getConstructor().newInstance();
				// 읽어온 클래스 정보를 가지고 메모리에 할당 
				System.out.println(obj);
				// Map(Menu판)에 저장 
				clsMap.put(menu[i], obj);
			}
		}catch(Exception ex) {}
		
	}
    //  사용자가 요청시마다 호출되는 메소드 (service() : Get/Post동시에 처리) => GET:doGet(),Post:doPost()
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//1. 520page => URI주소를 받아서 사용자가 어떤 기능을 요청했는지 확인 (HTTP 요청 받음)
		String cmd=request.getRequestURI();
		// ~~/list.do
		/*
		 *   https://localhost/JSPMVCBoardProject/list.do
		 *                    ============================ URI
		 *                    =================== ContextPath
		 *   ~~~/list.do
		 *   ~~~/update.do
		 *   ~~~/find.do    ======> Controller 
		 */
		cmd=cmd.substring(request.getContextPath().length()+1);
		//2. Model을 호출해서 (해당 클래스를 찾는다)=> 기능을 수행하게 만든다 
		Model model=(Model)clsMap.get(cmd);
		//3. 요청후에 => 결과값을 request에 담아준다 
		String jsp=model.handleRequest(request, response);
		//4. JSP로 request를 전송하고 화면에 출력하면 Controller가 화면을 읽어와서 브라우저로 전송 
		//5. 포워딩 / 리다이렉트 
		if(jsp.startsWith("redirect")) // ==> InsertOkModel => sendRedirect()
		{
			response.sendRedirect(jsp.substring(jsp.indexOf(":")+1));
		}
		else
		{
			RequestDispatcher rd=request.getRequestDispatcher(jsp);
			rd.forward(request, response);
		}
		/*
		 *   518 page                              request(요청내용)
		 *   사용자   =========  컨트롤러(Controller)  <=========> Model클래스중에 한개 선택(request에 결과값 채우기)
		 *                                         request(요청내용+응답내용)  => setAttribute()
		 *        1.요청(.do)        |
		 *                          | request(요청내용+응답내용)
		 *                         JSP(응답에 해당되는 화면을 출력)
		 *                          |
		 *                          |
		 *                        메모리에 저장(buffer) ===> 브라우저에 읽어서 화면 출력 
		 */
	}

}








