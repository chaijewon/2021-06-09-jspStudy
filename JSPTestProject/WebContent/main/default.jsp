<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
     FoodDAO dao=new FoodDAO();
     ArrayList<CategoryVO> list=dao.foodCategoryListData();
     
     // 쿠키 읽기 
     Cookie[] cookies=request.getCookies();
     ArrayList<FoodVO> fList=new ArrayList<FoodVO>();
     if(cookies!=null && cookies.length>0)
     {
    	 for(int i=0;i<cookies.length;i++)
    	 {
    		 // getName() => 키이름 , getValue() => 값을 가지고 온다 
    		 // Cookie cookie=new Cookie("f"+no,no);
    		 // no => f1,f2,... 같은 맛집을 클릭시 => 제거 (키 중복이면 덮어 쓴다)
    		 if(cookies[i].getName().startsWith("f"))
    		 {
    			 cookies[i].setPath("/");
    			 String no=cookies[i].getValue();
    			 FoodVO vo=dao.foodDetailData(Integer.parseInt(no));
    			 fList.add(vo);
    		 }
    	 }
     }
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
    <div>
     <a href="../food/cookie_delete.jsp" class="btn btn-sm btn-primary">쿠키삭제</a>
    </div>
    <div style="height:20px"></div>
    <!-- ################################################################################################ -->
    <div>
        <%
            int j=0;
            if(fList!=null && fList.size()>0)
            {
               for(int i=fList.size()-1;i>=0;i--)
               {
            	 FoodVO fvo=fList.get(i);
            	 if(j>9) break;
        %>
               <img style="width:100px;height:100px" class="radius-10" src=<%=fvo.getPoster().substring(0,fvo.getPoster().indexOf("^")) %> title="<%=fvo.getName()%>">
        <%
                  j++;
               }
            }
        %>
    </div>
    <!-- ################################################################################################ --> 
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
</body>
</html>