<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%--
     JSTL : JavaStandard Tag Lib
     => 태그 형식으로 자바 라이브러이를 제작 (JSP코딩) => 실무 
     JSTL 
     ==== 
       1. core(기본) => http://java.sun.com/jsp/jstl/core (import)
           => 제어문
               ==> XML로 설정 (문법이 복잡하다 : 대소문자 구분을 한다 , 속성값을 설정할 경우에 반드시 "",'',
                                   닫는 태그가 명확하다, 계층구조)
                   XML => MyBatis , Spring , 코틀린 => XML기반 
                          ========================
                           XML의 단점 : 사용자 정의만 존재 (지정된 태그가 없다)
                           MyBatis => 자체 XML을 구현 => 오라클 셋팅 , SQL셋팅
                           Spring  => 자체 XML을 구현 => AOP, DB셋팅 , 클래스 등록 
                           Kotlin  => 자체 XML을 구현  ==> XML태그 / 속성  , 안드로이드 화면 셋팅 
                                   예)
                        <c:forEach>
                          <c:if>
                        </c:forEach>
                          </c:if>  ===> 오류가 발생 
                          
                        <c:forEach>
                          <c:if>
                          </c:if>
                        </c:forEach>
                          
               1) 조건문
                  <c:if test="조건">
                        ====
                  </c:if> => if(조건){}   ==> 단점 : <c:else>(X) => 단일조건문만 처리가 가능 
               2) 선택문 => 다중 조건문도 사용이 가능  ==> test속성 : 조건을 설정
                  <c:choose>
                    <c:when test="조건">처리</c:when>
                    <c:when test="조건">처리</c:when>
                    <c:when test="조건">처리</c:when>
                    <c:otherwise>default 처리 <c:otherwise>
                  </c:choose>
               3) 반복문 
                  = 일반 for문
                    <c:forEach var="i" begin="" end="" step="">
                               ======= ======== ====== =======
                                                              변수       초기값         마지막값   증가  ===> step은 증가만 가능하다 (감소는 없다)
                                                                 step="1"일 경우에는 생략이 가능 
                                                 end => 포함한다    end="10"   i<=10
                        for처리 
                    </c:forEach>
                    1~10까지 출력 (do~while,while => 없다)
                    <c:forEach var="i" begin="1" end="10" step="1">
                      ${i} <%= %>(X) var => request.setAttribute("i",값)
                    </c:forEach>
                  = forEach문 
                                  배열 , List를 출력할 때 사용 
                    ArrayList<String> ArrayList<MovieVO> ArrayList<BoardVO>
                    <c:forEach var="vo" items="list"> for(MemberVO vo:list)
                             String vo
                             MovieVO vo
                             BoardVO vo
                    </c:forEach>
                  = StringTokenizer
                    
                    <c:forTokens var="color" items="1,2,3,4,5" delims="">
                                             ======== =========
                                                                                         데이터     구분문자 
                                                                                        
                    예)  <c:forTokens var="color" items="red,blue,black,yellow,green" delims=",">
                    color=red , color=blue ..... 
                    color=> st.nextToken()  var은 자동지정변수 => 문자,숫자 
                    ${color}
               </c:forTokens>
           => 변수 선언 
               <c:set var="date" value="<%=new Date()%>"/>
                 Date date=new Date()(X)
                 request.setAttribute("date",new Date())  ==> ${date}
           => 화면 출력 
               <c:out value=""> => ${} ,$() <%= %>
               ================
                  Jquery에서 자바데이터 출력시에 사용 
           => URL
              <c:redirect url=""> => response.sendRedirect()
       2. fmt (변환) => http://java.sun.com/jsp/jstl/fmt (import)
              <fmt:formatDate> <fmt:formatNumber>
              ================ ==================
              SimpleDateFormat   String.format()
       3. fn (메소드:String,Collection) => http://java.sun.com/jsp/jstl/functions (import)
              fn:
              request.setAttribute("data","Hello JSTL!!")
              fn:length(data)
              fn:substring(data,1,5)
              fn:trim(data)
              fn:replace(data,'H','K')
       4. xml,sql => 사용하지 않는다
          === ===
          OXM ORM ==> 자바로 코딩 
 --%>
<%
    String name="박문수";
    // 지금부터는 최대한으로 JSP안에 자바 사용하지 않는다 ==> MVC 
%>
<c:set var="name" value="<%=name %>"/>
<!-- 한개만 저장이 가능하다 : 여러개 저장 = 배열 , 클래스 , 컬렉션 -->
<!--  var:키 ,value:값 -->
<!--  request.setAttribute("name",name) : <c:set/> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
이름:${name }
</body>
</html>







