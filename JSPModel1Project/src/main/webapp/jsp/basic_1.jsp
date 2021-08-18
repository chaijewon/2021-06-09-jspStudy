<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      JSP (Java Server Page) : 서버에서 실행되는 자바 파일 
          => 클래스를 톰캣에서 제작 (자바가 들어가 있는 코드 => 컴파일(클래스) => 바이트코드 변환(.class) => 실행 => HTML만 출력)
          => jsp => class변경 => a.jsp 
             public class a_jsp extends HttpServlet
             {
                 ==================================
                  <%!  %> : class영역에 들어간다  ===> 메소드 , 전역변수 
                 
                 ==================================
                 public void _jspInit()
                 {
                 }
                 public void _jspDestory()
                 {
                 }
                 // 사용자 요청시에 브라우저에 출력할 내용 => 프로그래머가 담당 
                 public void _jspService(HttpServletRequest request,HttpServletResponse response)
                 {
                     ServletContext application;
                     JspWriter out;
                     HttpSession session;
                     PageContext pageContext;
                     Exception exception;
                     Object page=this;
                     ServletConfig config; ===> 내장객체 
                     ================================================
                       JSP코딩 <%  %>
                       <%= %> ==> out.println()
                       *** out.write() => 생략 HTML => 소스코딩을 쉽게할 수 있게 만들기 위해서 
                       out.write("<!DOCTYPE html>");
                     
                     ================================================
                 }
             }
      1) 실행 과정 
         브라우저 : 사용자 (클라이언트 영역) 
         요청 받을때 사용 : 웹서버 (아파치(Java),IIS(ASP,ASP,Net))
                        ===== 톰캣안에 테스트용 웹서버 기능 (단점: 30명이 동시접속시 서버 종료)
         웹서버는 JAVA를 변역하지 못한다 : 요청받아서 => 응답만 한다 
         =========================
         톰캣(WAS) => 웹 애플리케이션 서버(JSP번역기) : 톰캣/제우스 
         
         사용자 요청 =====================> 웹서버(아파치,IIS) ===> 톰캣(JSP=>Java변경=>컴파일=>실행=>메모리(HTML)
              브라우저요청 => 맨마지막에 파일명       =====
              /a.jsp
         톰캣에서 메모리에 저장한 HTML을 브라우저에서 읽어서 출력 
      2) 자바/HTML => 스크립트 
         분리 (자바영역 / HTML영역) 
         자바분리 
          <%! %> : 클래스 영역에 설정 = 선언식 (메소드,전역변수) => 사용빈도가 낮다
          <% %>  : _jspService() : 브라우저에 전송 : 일반 자바 코딩 ==> 스크립트릿
          <%= %> : out.println() : 데이터를 HTML에 출력할 경우에 사용 
          =======================================================> MVC/Spring 사용하지 않는다 
      3) 지시자 (page,include,taglib(***)) 스프링:MVC(자바/HTML=>JSP) => JSP시작코드라 MVC에 존재 
         <%@ 지시자명 속성=값 속성=값 .... %>
         page => JSP에 대한 정보 
              = 속성 
              1. contentType ==> 브라우저에 전송할때 어떤 타입설정 => text/html(HTML),text/xml(XML),text/plain(JSON)
              2. errorPage 
              3. import 
         include => JSP안에 특정위치에 다른 JSP를 추가하는 경우에 사용 
                 => <%@ include file="" %> => file은 반드시 파일명 저장 (고정) => 정적
                 => <jsp:include page=""> => 동적 (수시로 파일명 변경이 가능)
                 
                 include => JSP+JSP = 컴파일
                            =======
                            자바+자바  =====> <%@ include %>
                         => JSP 컴파일 + JSP 컴파일 
                            HTML+HTML ====> <jsp:include>
         taglib : 자바 문법을 => tag로 변경 ==> 11장(EL)/12장(JSTL)
                  ======= 연산자,제어문 , 메소드 
                  <%@ taglib prefix="c" uri=""%> core : URL관련,제어문
                    <c:forEach> <c:if> <c:choose> <c:forTokens> <c:redirect> <c:import>
                  <%@ taglib prefix="fmt" uri=""%> format : 날짜 , 숫자 변환
                    <fmt:formatDate> <fmt:formatNumber>
                  <%@ taglib prefix="fn" uri=""%> function : String , Collection 
                    fn:substring() fn:trim()
                  ==> 사용자 정의로 제작해서 사용 
      4) 기본객체(내장객체) => 자바와 관련 웹프로그램 (항상)
         = request
            = getParameter()
            = getParamterValues()
            = setCharecterEncoding() => EUC-KR,UTF-8(호환성)
            = getCookies() , getSession()
            = setAttribute() , getAttribute()
            = getRequestURL(),getRequestURI(),getContextPath()
         = response
            = setHeader()
            = sendRedirect()
         = session
            = setAttribute()
            = getAttribute()
            = removeAttribute()
            = invalidate()
         = application
            = getInitParameter() : web.xml
            = getRealPath()
         = pageContext
            = pushBody () : 객체를 초기화 => 다운로드시에만 사용
         = cookie
            = addCookie()
            = setMaxAge()
            = getCookies()
      5) 액션태그
        = <jsp:include> : JSP안에 다른 JSP추가 : 조립식 => tiles 
        = <jsp:useBean> : 클래스 메모리 할당
        = <jsp:setProperty> : setXxx()에 값을 채우는 경우 
      =============
      6) EL 
      7) JSTL
      8) MVC
      9) 추가 => setAttribute() (데이터베이스에 데이터를 추가해서 => JSP => 출력)
      10) 14장 => 데이터베이스 (DBCP , Transcation , JOIN)
      ================================================================== 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>