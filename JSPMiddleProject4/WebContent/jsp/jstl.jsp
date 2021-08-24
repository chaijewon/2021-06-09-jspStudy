<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
        251 => 사용법
		253 => 데이터 타입
		254 => 기본객체
		256 => 객체 접근
		258 => 수치연산자 
		266 => 객체 메소드 호출
		294 => JSTL종류
		295 => core (295~308)
		310 => redirect
		311 => out
		313 => catch
		325 => 숫자/날짜변환
		==================
		341 => UTF-8변환
		357 => 배포
		==================
       JSTL(태그라이브러리)
       core : 제어문 , 변수선언(request.setAttribute()) , URL , 출력관련 , 예외처리 
         ***1) 제어문 
             <c:if> : 조건문 
             <c:choose> : 선택문 
               <c:when></c:when>
               <c:otherwise></c:otherwise>
             <c:choose>
             <c:forEach> : 반복문
             <c:forTokens> : StringTokenizer
        2) 변수 
           <c:set>
        3) URL 
           <c:redirect> : sendRedirect
        ***4) 출력 관련 
           <c:out> : JQUERY를 연결  ==> EL
        5) 예외처리 
           <c:catch> : try~catch
       fmt : 변환 => Oracle에 존재 => 날짜변환 / 숫자변환 => TO_CHAR()
        1) 숫자변환 
           <fmt:formatNumber> 
           <fmt:formatNumber value="10000" pattern="00,000">
        2) 날짜변환 
           <fmt:formatDate>
           <fmt:formatDate value="${regdate}" pattern="yyyy-MM-dd"> : SimpleDateFormat동일 
                                                       ============ hh:mm:ss
        3) 한글변환 
           <%
               try
               {
                  request.setCharacterEncoding("UTF-8");
               }carch(Exception ex){} => Tomcat10버전에서 자동처리 , 이하버전 (8.5)=> 한글이 깨진다  
           %>
           <fmt:requestEncoding value="UTF-8">
        4) 메세지 => Spring (유효성 검사) => 사용빈도가 거의 없다
       fn
         => String ===================> MVC (모든 데이터를 자바파일에서 제어) => JSP는 출력만 담당
                                             ======================     =============
                                                Back                      Front(확장=> JavaScript)
                                                ==== Back중심 (DAO,MyBatis,장고,스프링) => 개발자 
                                             VueJS,ReactJS,NodeJS => 현재 입사 (Full Stack)
            ${fn:trim("")}
            ${fn:length("")}
            ${fn:substring("")}
            ${fn:replace("")}
            ${fn:indexOf(값)}
            ${fn:lastIndexOf(값)}
       ==================
             사용빈도가 거의 없다
       xml
       sql
       ================== XML(OXM,JAXP,JAXB) => 자바 (Spring)
                          SQL(JDBC,DBCP,ORM) => 자바(MyBatis)
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