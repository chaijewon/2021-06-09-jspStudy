<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper row1">
  <header id="header" class="clear"> 
    <!-- ################################################################################################ -->
    <div id="logo" class="fl_left">
      <h1><a href="../main/main.jsp">맛집 & 레시피 추천</a></h1>
    </div>
    <div class="fl_right">
      <ul class="inline">
        <li>ID:<input type=text name=id class="input-sm" size=10></li>
        <li>PW:<input type=password name=pwd class="input-sm" size=10></li>
        <li><input type=submit value="로그인" class="btn btn-sm btn-danger"></li>
      </ul>
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
      <li><a class="drop" href="#">회원가입</a>
        <ul>
          <li><a href="#">아이디찾기</a></li>
          <li><a href="#">비밀번호찾기</a></li>
        </ul>
      </li>
      <li><a class="drop" href="#">맛집</a>
        <ul>
          <li><a href="#">지역별맛집</a></li>
          <li><a href="#">맛집예약</a></li>
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
      <li><a href="#">마이페이지</a></li>
    </ul>
    <!-- ################################################################################################ --> 
  </nav>
</div>
</body>
</html>