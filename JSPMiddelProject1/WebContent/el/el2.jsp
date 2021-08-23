<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      출력형식 / 연산처리 => 일반 JSP (MVC=> 자바처리 JSP에서 하지 않는다) 자바/JSP(출력전용으로만 사용)
   ======
       연산자
       => 산술연산자 
           + , - , * , / , %
           =
            => 순수하게 산술연산만 가능 => (자바에서는 문자열 결합 사용) 
                           문자열 결합시 => += 
            => NULL일경우에는 자동으로 0값으로 인식 
            => "10"+"20" => 30 => 자동으로 Integer.parseInt() 처리 
               "10"+="20" => 1020
            => / 
               = 0으로 나눌 수 없다 
               = 정수/정수는 실수 
               = / 대신 div사용이 가능 
            => % 
               = % 대신 mod사용이 가능 
       => 비교연산자 => 결과값은 true/false 
                  ==  => eq  ==> ${10==9} ${10 eq 9}
                  !=  => ne  ==> ${10!=9} ${10 ne 9}
                  <   => lt  ==> ${10<9}  ${10 lt 9}
                  >   => gt  ==> ${10 > 9} ${10 gt 9}
                  <=  => le  ==> ${10 le 9} ${10<=9}
                  >=  => ge  ==> ${10 ge 9} ${10>=9}  ===> 조건문에서 주로 사용 
                  ===> <c:if test="${10 ge 9}"> <% if(조건문) %> => X
       => 논리연산자 => 결과값은 true/false 
                  && => and 
                  || => or
       =============================== ****** 문자열비교  => String name="홍길동"; 
                                       name.equals("홍길동") (자바)
                                       ${ name == '홍길동' } => == (비교연산자를 이용한다)
       => 삼항연산자  =>  조건 ? 값1:값2 ==> 조건 true=> 값1 , 조건 false=> 값2
       => Empty => ${empty 값}  => null , "" => true 
          String name="";   ==>  ${empty name} ==> true
          String name;      ==>  ${empty name} ==> true
                   데이터베이스에 값이 없는 경우/ 값이 있는 경우   ==> ${ name=="" }, ${name==null}
          +=: 문자열 결합 연산자 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<<%-- h1>산술연산자 처리</h1>
연산시에 null일 경우에 자동으로 0으로 처리
10+20 => ${10+20 },${"10"+"20" }<br>
10+null=> ${10+null }<br> 
"10"+"20" => ${"10" += "20" }<br>
10/3 => ${10/3 }, ${10 div 3 }<br>정수/정수=실수
10%3 => ${10%3 }, ${10 mod 3 }<br>
<h1>비교연산자 (true/false):문자열도 비교연산자를 이용한다</h1>
10==9 => ${10==9 }<br>
<%
    String name="홍길동";
    request.setAttribute("n", name);
%>
이름이 홍길동이냐? => ${ n == '홍길동' } , ${ n == "홍길동" } , ${n eq '홍길동' } --%> <%-- 모든 변수(변수명이 아니라 키명이다 --%>
<%--
       <c:if test="${name=="홍길동"}">(X)  <c:if test="${name=='홍길동'}">(O)
 --%>
<%-- <br>
10!=9 => ${ 10 != 9 }, ${10 ne 9 } <br>
10<9 => ${ 10< 9 }, ${ 10 lt 9 }<br>
10>9 => ${ 10>9 }, ${ 10 gt 9 }<br>
10<=9 => ${ 10<= 9 }, ${ 10 le 9 }<br>
10>=9 => ${ 10>= 9 }, ${ 10 ge 9 }<br> 프로그램 개발자 : <=,>= , 오라클,Front : le,ge
<h1>논리연산자 (and : && , or : || , not : !")</h1>
10==9 && 10!=9 => ${ 10==9 && 10!=9 },${ 10==9 and 10!=9 }<br>
10==9 || 10!=9 => ${ 10==9 || 10!=9 },${ 10==9 or 10!=9 }<br>
10==9 && 10!=9 => ${ !(10==9 && 10!=9) },${ not (10==9 and 10!=9) }<br>
<h1>empty 연산자</h1>
<%
    String dept="";
    String job=null;
    request.setAttribute("dept", dept);
    request.setAttribute("job", job);
%>
${ empty dept },${empty job }, ${empty n } --%>
<%--
      empty dept ==> null,"" (true)
      n => 값이 있는 경우 (false)
      => ${ dept==null} ${job==""}  , ${n!=""}  261page
 --%>
</body>
</html>









