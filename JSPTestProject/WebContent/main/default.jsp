<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
     FoodDAO dao=new FoodDAO();
     ArrayList<CategoryVO> list=dao.foodCategoryListData();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper row3">
  <div id="slider" class="clear"> 
    <!-- ################################################################################################ -->
    <div class="flexslider basicslider">
      <ul class="slides">
        <li><a href="#"><img class="radius-10" src="../gravity/images/demo/slides/d2.jpg" alt="" style="width:978px; height:400px"></a></li>
        <li><a href="#"><img class="radius-10" src="../gravity/images/demo/slides/d3.jpg" alt="" style="width:978px; height:400px"></a></li>
        <li><a href="#"><img class="radius-10" src="../gravity/images/demo/slides/d1.jpg" alt="" style="width:978px; height:400px"></a></li>
      </ul>
    </div>
    <!-- ################################################################################################ --> 
  </div>
</div>
<!-- ################################################################################################ --> 
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <main class="container clear"> 
    <!-- main body --> 
    <!-- ################################################################################################ -->
    <ul class="nospace group btmspace-80">
      <li class="one_third first">
        <article class="service"><i class="icon fa fa-hospital-o"></i>
          <h6 class="heading"><a href="#">서울관광의 모든 것</a></h6>
          <p>다양한 서울 여행 정보를 만나보세요. 서울의 명소, 맛집, 카페, 호텔, 축제, 공연, 에디터 추천 여행</p>
          <footer><a href="#">Read More &raquo;</a></footer>
        </article>
      </li>
      <li class="one_third">
        <article class="service"><i class="icon fa fa-ambulance"></i>
          <h6 class="heading"><a href="#">홍대 맛집 인기 검색순위</a></h6>
          <p>솔직하고 거짓없는 리뷰로 나만의 맛집을 쉽고 빠르게 찾아보세요!</p>
          <footer><a href="#">Read More &raquo;</a></footer>
        </article>
      </li>
      <li class="one_third">
        <article class="service"><i class="icon fa fa-h-square"></i>
          <h6 class="heading"><a href="#">간식부터 한끼식사까지</a></h6>
          <p>10분안에 완성! 간식부터 한끼식사까지~ 초간단요리 많은 시간 필요</p>
          <footer><a href="#">Read More &raquo;</a></footer>
        </article>
      </li>
    </ul>
    <!-- ################################################################################################ -->
    <h2 class="sectiontitle">믿고 보는 맛집 리스트</h2>
    <!-- ################################################################################################ -->
    <div class="flexslider carousel basiccarousel btmspace-80">
      <ul class="slides">
       <%
          for(int i=0;i<12;i++)
          {
        	  CategoryVO vo=list.get(i);
       %>
        <li>
          <figure><img class="radius-10 btmspace-10" src="<%=vo.getPoster() %>" title="<%=vo.getSubject()%>">
            <figcaption><a href="../main/main.jsp?mode=5&cno=<%=vo.getCno()%>"><%=vo.getTitle() %></a></figcaption>
          </figure>
        </li>
        <%
          }
        %>
      </ul>
    </div>
    <h2 class="sectiontitle">지역별 인기 맛집</h2>
    <!-- ################################################################################################ -->
    <div class="flexslider carousel basiccarousel btmspace-80">
      <ul class="slides">
        <%
          for(int i=12;i<18;i++)
          {
        	  CategoryVO vo=list.get(i);
       %>
        <li>
          <figure><img class="radius-10 btmspace-10" src="<%=vo.getPoster() %>" title="<%=vo.getSubject()%>">
            <figcaption><a href="../main/main.jsp?mode=5&cno=<%=vo.getCno()%>"><%=vo.getTitle() %></a></figcaption>
          </figure>
        </li>
        <%
          }
        %>
      </ul>
    </div>
    <h2 class="sectiontitle">메뉴별 인기 맛집</h2>
    <!-- ################################################################################################ -->
    <div class="flexslider carousel basiccarousel btmspace-80">
      <ul class="slides">
        <%
          for(int i=18;i<30;i++)
          {
        	  CategoryVO vo=list.get(i);
       %>
        <li>
          <figure><img class="radius-10 btmspace-10" src="<%=vo.getPoster() %>" title="<%=vo.getSubject()%>">
            <figcaption><a href="../main/main.jsp?mode=5&cno=<%=vo.getCno()%>"><%=vo.getTitle() %></a></figcaption>
          </figure>
        </li>
        <%
           // mode => 화면 을 변경(include파일 지정) => main.jsp에서 지정 
           // 다른 변수 => jsp자체에서 처리 
          }
        %>
      </ul>
    </div>
    <!-- ################################################################################################ -->
    <h2 class="sectiontitle">최신 방문 맛집</h2>
    <!-- ################################################################################################ -->
    <div>
        <img class="radius-10" src="../gravity/images/demo/100x100.gif" alt="">
        <img class="radius-10" src="../gravity/images/demo/100x100.gif" alt="">
        <img class="radius-10" src="../gravity/images/demo/100x100.gif" alt="">
        <img class="radius-10" src="../gravity/images/demo/100x100.gif" alt="">
        <img class="radius-10" src="../gravity/images/demo/100x100.gif" alt=""> 
        <img class="radius-10" src="../gravity/images/demo/100x100.gif" alt="">
        <img class="radius-10" src="../gravity/images/demo/100x100.gif" alt="">
        <img class="radius-10" src="../gravity/images/demo/100x100.gif" alt="">
        <img class="radius-10" src="../gravity/images/demo/100x100.gif" alt="">
    </div>
    <!-- ################################################################################################ --> 
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
</body>
</html>