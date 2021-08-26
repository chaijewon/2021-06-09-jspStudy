<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
    .do ==> 갯수만큼 Model클래스를 만든다 
 --%>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="main.do">MVCPattern</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="main.do">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">영화<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="movie_real.do">현재상영영화</a></li>
          <li><a href="movie_sch.do">개봉예정영화</a></li>
          <li><a href="movie_box.do">박스오피스</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">음악<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="music_genie.do">지니뮤직</a></li>
          <li><a href="music_melon.do">멜론뮤직</a></li>
          <li><a href="music_total.do">혼합뮤직</a></li>
        </ul>
      </li>
    </ul>
  </div>
</nav>
</body>
</html>