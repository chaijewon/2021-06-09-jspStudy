<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // session에 저장된 값을 읽어온다 (저장된 경우 (로그인 완료), 저장이 안된 경우(로그인이 안된 상태) : null)
    // session에 저장 => 로그인시에 id,name을 저장 
    String id=(String)session.getAttribute("id"); // 세션에 저장된 값을 읽을때 사용 
    /*
         session과 관련된 메소드 : 서버에 클라이언트의 일부 정보저장 => request는 화면이 변경,새로고침시에 초기화 
                                                         ======== 받은 JSP만 사용이 가능 
                                                                  => request 공유(include,forward)
                                                                                         ======== MVC
         a.jsp(request)  ==========>  b.jsp(request)  
         request는 JSP마다 따로 가지고 있다 , session은 서버에 1개만 존재
         ===========================  ======================
               request는 지역변수  , session은 static 
         ======= 전역변수 (새로고침,화면변경시 저장된 값을 유지 , 모든 JSP에서 사용이 가능)
         
                주요 메소드 
                1) 저장  ================> void setAttribute(String key,Object obj) => Map
                                                           =========== 키 중복을 허용하지 않는다 (덮어쓴다)
                                                                            예) setAttribute("id","admin")
                                            setAttribute("id","hong")  =====> hong (회원 수정)
                                         => session은 브라우저마다 1개씩만 존재 
                2) 값을 읽어온다 =========> Object getAttribute(String key) => key(값을 가지고 온다)
                3) 기간(저장) ====> 기본 (30분) setMaxInactiveInterval(1800) => 1일 (60*60*24)
                                                                  ====== 초단위 
                                                                  ====== 은행 (1분)
                4) 일부만 삭제 ======> 장바구니(임시저장) => removeAttribute("key") 
                5) 전체 삭제   ======> invalidate() => 로그아웃 
                
                ==> 장바구니 => 쿠키 (문자열만 저장) : 최근 방문 , 자동 로그인 , 세션(ArrayList)
    */
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){ // window.onload=function() , $(document).ready(function(){})
	$('#logBtn').click(function(){
		let id=$('#id').val();// <input type=text name=id class="input-sm" size=10 id=id>
		if(id.trim()=="")
		{
			$('#id').focus();
			return;
		}
		let pwd=$('#pwd').val();//<input type=password name=pwd class="input-sm" size=10 id=pwd>
		if(pwd.trim()=="")
		{
			$('#pwd').focus();
			return;
		}
		
		// login.jsp로 id,pwd로 전송 
		$.ajax({
			type:'POST',
			url:'../member/login.jsp',
			data:{"id":id,"pwd":pwd}, //login.jsp?id=hong&pwd=1234
		    success:function(res) // 정상수행시 => 200번일때 처리  ==> res값 login.jsp를 실행한 결과값 (html,text,xml.json)
		    {
		    	let m=res.trim();
		    	if(m=="NOID")
		    	{
		    		alert("아이디가 존재하지 않습니다!!");
		    		$('#id').val("");//입력된 데이터를 지운다 
		    		$('#pwd').val("");
		    		$('#id').focus();
		    	}
		    	else if(m=="NOPWD")
		    	{
		    		alert("비밀번호가 틀립니다!!");
		    		$('#pwd').val("");
		    		$('#pwd').focus();
		    	}
		    	else
		    	{
		    		// main.jsp를 다시 실행
		    		location.href="../main/main.jsp";//sendRedirect()
		    	}
		    		
		    }/*,
		    error:function(e) // 오류발생 => 404,500
		    {
		    	
		    }*/
		})
	})
})
</script>
</head>
<body>
<div class="wrapper row1">
  <header id="header" class="clear"> 
    <!-- ################################################################################################ -->
    <div id="logo" class="fl_left">
      <h1><a href="../main/main.jsp">맛집 & 레시피 추천</a></h1>
    </div>
    <div class="fl_right">
     <%
         if(id==null)
         {
     %>
		      <ul class="inline">
		       <!-- <form method="post" action="../member/login.jsp"> -->
		        <li>ID:<input type=text name=id class="input-sm" size=10 id=id></li>
		        <li>PW:<input type=password name=pwd class="input-sm" size=10 id=pwd></li>
		        <li><input type=button value="로그인" class="btn btn-sm btn-danger" id=logBtn></li>
		       <!-- </form> -->
		      </ul>
      <%
         }
         else
         {
      %>
              <ul class="inline">
               <form method=post action="../member/logout.jsp">
		         <li><%= session.getAttribute("name") %></li>
		         <li>로그인되었습니다!!</li>
		         <li><input type=submit value="로그아웃" class="btn btn-sm btn-primary"></li>
		        </form>
		      </ul>
      <%
         }
      %>
    </div>
    <!-- ################################################################################################ --> 
  </header>
</div>
<!-- ################################################################################################ --> 
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->
<div class="wrapper row2">
  <nav id="mainav" class="clear"> 
    <!-- ################################################################################################ -->
    <ul class="clear">
      <li class="active"><a href="../main/main.jsp">홈</a></li>
      <% 
         if(id==null)
         {
      %>
		      <li><a class="drop" href="#">회원가입</a>
		        <ul>
		          <li><a href="#">아이디찾기</a></li>
		          <li><a href="#">비밀번호찾기</a></li>
		        </ul>
		      </li>
      <%
         }
         else
         {
      %>
             <li><a class="drop" href="#">회원수정</a>
		        <ul>
		          <li><a href="#">회원수정</a></li>
		          <li><a href="#">회원탈퇴</a></li>
		        </ul>
		      </li>
      <%
         }
      %>
      <li><a class="drop" href="#">맛집</a>
        <ul>
          <li><a href="../main/main.jsp?mode=7">지역별맛집</a></li>
          <%
              if(id!=null)
              {
          %>
                 <li><a href="#">맛집예약</a></li>
          <%
              }
          %>
          <li><a href="#">맛집추천</a></li>
        </ul>
      </li>
      <li><a class="drop" href="#">레시피</a>
        <ul>
          <li><a href="#">레시피</a></li>
          <li><a href="#">쉐프</a></li>
        </ul>
      </li>
      <li><a href="#">서울여행</a></li>
      <li><a class="drop" href="#">커뮤니티</a>
        <ul>
          <li><a href="#">자유게시판</a></li>
          <li><a href="#">묻고답하기</a></li>
          <li><a href="../main/main.jsp?mode=2">자료실</a></li>
        </ul>
      </li>
      <%
         if(id!=null)
         {
      %>
      <li><a href="#">마이페이지</a></li>
      <%
         }
      %>
    </ul>
    <!-- ################################################################################################ --> 
  </nav>
</div>
</body>
</html>