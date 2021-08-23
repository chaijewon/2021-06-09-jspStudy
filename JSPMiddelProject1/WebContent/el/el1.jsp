<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.member.*"%>
<%-- 250 ~ 269page EL은 출력 용도 --%>
<%-- core(제어문 , URL, 변수 선언) , fn(String관련)  --%>
<%-- 출력 용도로만 사용  --%>
<%-- MVC(Spring)  <%= 더이상 사용하지 않는다 , ${} %>--%>
<%--
      EL : 표현언어 ==> 화면에 데이터 출력  <%= %> , out.println() 대신 사용하는 출력 형식 
      => 사용법 : ${} => $는 JQuery를 사용시에 충돌 
      => 클라이언트 (브라우저 제어) , 데이터 제어 , 데이터 저장 
         ===================   ========  =========
         HTML/CSS/JavaScript    Java      Oracle
                  ==========
                   => Jquery(라이브러리) => $() , ${} 
                   
      1. 일반 변수 출력이 아니고 , 내장 객체를 출력한다 
         String name="홍길동";
         => ${name} => 출력(X)
            =======
            request에 추가된 값  : request.setAttribute("키",값); => ${requestScope.키} => requestScope는 생략이 가능
                              request.setAttribute("name","홍길동") => ${name}
            session에 추가된 값 : session.setAttribute("키",값) => ${sessionScope.키}
            application에 추가된 값 : application.setAttribute("키",값) => ${applicationScope.키}
            => 우선순위 => request,session,application => 키명이 동일 할때  => 생략이 가능 ${키} 
                      사용자가 보낸값 
            => ${param.키} => getParameter()  (X)
            
            서버에서 데이터 전송 : 파일명?변수=값  ==> request.setAttribute()를 이용해서 => 클라이언트로 전송 
                                       ====================== 여러개를 동시에 보낼수 있다 
        페이지 처리 
         int curpage=1;
         int totalpage=10;
         <a href="list.jsp?page=<%= curpage>1?curpage-1:curpage%>">이전</a>
         <a href="list.jsp?page=<%= curpage<totalpage?curpage+1:curpage%>">다음</a> Model1 
         
         request.setAttribute("curpage",1);  ===> ${} 일반변수가 아니라 => request,session에 첨부된 값을 읽어온다 
         request.setAttribute("totalpage",10);
         <a href="list.jsp?page=${curpage>1?curpage-1:curpage}>이전</a>
         <a href="list.jsp?page=${curpage<totalpage?curpage+1:curpage}">다음</a> Model2(MVC)
         
         
         session.setAttribute("id","hong")
         String id=(String)session.getAttribute("id"); // id=hong
         <%= id %> <%= session.getAttribute("id") %> // hong
         
         ${sessionScope.id} => hong
                        == 변수가 아니라 키명   ==> 254page => requestScope,sessionScope,applicationScope
                        == ===> requestScope,sessionScope,applicationScope 화면 출력 
                        == 나머지는 Model(자바)에서 주로 처리
         
        public class MemberVO
        {
           private int no;
           private String name;
           public void setNo(int no)
           {
               this.no=no;
           }
           public int getNo()
           {
                return no;
           }
           public void setName(String name)
           {
               this.name=name;
           }
           public String getName()
           {
               return name;
           }
        }
        
        => 데이터를 묶어서 전송 (브라우저 : JSP에 값을 전송) , request,session
        MemberVO vo=new MemberVO();
        vo.setNo(1);
        vo.setName("홍길동");
        request.setAttribute("vo",vo);
        ${requestScope.vo.no}
                          == getNo()
        ${requestScope.vo.name} 
                          ==== getName()
                          
        => requestScope는 생략이 가능  ${vo.no} , ${vo.name} ==> 일반적으로 많이 사용하는 형태 
                                  ${vo.getNo()} , ${vo.getName()}
                          
        => 258page 
        연산자 : 
            
 --%>
 <%
     String name="홍길동";//${name}(X)
     request.setAttribute("name",name); //${name}  => request.getAttribute("name")
     session.setAttribute("name",name); //${sessionScope.name} => session.getAttribute("name");
     MemberVO vo=new MemberVO();
     vo.setNo(1);
     vo.setName("심청이");
     request.setAttribute("vo", vo);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   Model1 : <%= name %><br>
   Model2 : ${name }<br>
   ${sessionScope.name }<br>
     회원번호:${vo.no }<br><%-- vo.getNo() 256,257page--%>
     회원이름:${vo.name }<br><%--vo.getName() --%>
    회원번호 : ${vo.getNo() }<br>
    회원이름:${vo.getName()}<br>
</body>
</html>









