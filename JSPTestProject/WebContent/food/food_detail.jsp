<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,java.util.*"%>
<%
    // session읽기 => id,name 입력 => 댓글 
    String id=(String)session.getAttribute("id");
    String no=request.getParameter("no");
    // no에 해당되는 데이터를 오라클에서 가지고 온다 
    FoodDAO dao=new FoodDAO();
    FoodVO vo=dao.foodDetailData(Integer.parseInt(no));
    String ss=vo.getAddress();
    ss=ss.substring(ss.indexOf(" ")+1);
    String sss=ss.substring(0,ss.indexOf(" "));
    /*
          강원도 
          ss="강릉시 옥가로 50 지번 강원도 강릉시 옥천동 219-11" => 구,시
        		  서울특별시 마포구 서강로9길 60 지번 서울시 마포구 창전동 5-138
    */
    ArrayList<FoodVO> list=dao.foodLocationData(sss);
    // 댓글 읽기
    ArrayList<ReplyVO> rList=dao.foodReplyListData(Integer.parseInt(no));// no:맛집번호
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['리뷰', '상태'],
          ['맛있다',     <%= vo.getGood()%>],
          ['괜찮다',      <%= vo.getSoso()%>],
          ['별로',  <%= vo.getBad()%>]
        ]);

        var options = {
          title: '리뷰 현황',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
    </script>
</head>
<body>
<div class="wrapper row3">
  <main class="container clear"> 
    <div class="row">
      <table class="table">
        <tr>
          <%
              StringTokenizer st=new StringTokenizer(vo.getPoster(),"^");
              while(st.hasMoreTokens())
              {
          %>
                 <td class="text-center">
                  <img src="<%=st.nextToken() %>" width=100% class="img-rounded">
                 </td>
          <%
              }
          %>
        </tr>
      </table>
    </div>
    <div class="row">
	    <div class="col-sm-8">
	      <table class="table">
	        <tr>
	         <td colspan="2">
	          <h3><%=vo.getName() %>&nbsp;<span style="color:orange"><%=vo.getScore() %></span></h3>
	         </td>
	        </tr>
	        <tr>
	          <td width=15%><span style="color:#999">주소</span></td>
	          <td width=75%>
	            <%
	                  String addr=vo.getAddress();
	                  String f=addr.substring(0,addr.lastIndexOf("지"));
	                  String s=addr.substring(addr.lastIndexOf("지"));
	            %>
	            <%=f %><br>
	            <sub><%=s %></sub>
	          </td>
	        </tr>
	        <tr>
	          <td width=15%><span style="color:#999">전화</span></td>
	          <td width=75%><%=vo.getTel() %></td>
	        </tr>
	        <tr>
	          <td width=15%><span style="color:#999">음식종류</span></td>
	          <td width=75%><%=vo.getType() %></td>
	        </tr>
	        <tr>
	          <td width=15%><span style="color:#999">가격대</span></td>
	          <td width=75%><%=vo.getPrice() %></td>
	        </tr>
	        <%
	           if(!vo.getParking().equals("no"))
	           {
	        %>
	        <tr>
	          <td width=15%><span style="color:#999">주차</span></td>
	          <td width=75%><%=vo.getParking() %></td>
	        </tr>
	        <%
	           }
	        %>
	        <%
	           if(!vo.getTime().equals("no"))
	           {
	        %>
	        <tr>
	          <td width=15%><span style="color:#999">영업시간</span></td>
	          <td width=75%><%=vo.getTime() %></td>
	        </tr>
	        <%
	           }
	        %>
	        <%
	           if(!vo.getMenu().equals("no"))
	           {
	        %>
	        <tr>
	          <td width=15%><span style="color:#999">메뉴</span></td>
	          <td width=75%>
	             <ul>
	               <%
	                   st=new StringTokenizer(vo.getMenu(),"원");
	                   while(st.hasMoreTokens())
	                   {
	               %>
	                      <li><%=st.nextToken() %>원</li>
	               <%
	                   }
	               %>
	             </ul>
	          </td>
	        </tr>
	        <%
	           }
	        %>
	      </table>
	      <table class="table">
	        <tr>
	         <td>
	          <div id="piechart_3d" style="width: 600px; height: 100px;"></div>
	         </td>
	        </tr>
	      </table>
	      <hr>
	      <div id="comments">
	        <h2>댓글</h2>
	        <ul>
	         <%
	             if(rList!=null && rList.size()>0)
	             {
	            	 for(ReplyVO rvo:rList)
	            	 {
	         %>
			          <li>
			            <article>
			              <header>
			                <%
			                   if(id.equals(rvo.getId()))// 댓글을 쓴사람일 경우 
			                   {
			                %>
					                <figure class="avatar inline">
					                  <input type=button value="수정" class="btn btn-xs btn-danger">
					                  <a href="../food/food_reply_delete.jsp?no=<%=rvo.getNo() %>&fno=<%=no %>" class="btn btn-xs btn-success" style="color:black">삭제</a>
					                </figure>
			                <%
			                   }
			                %>
			                <address>
			                By <span style="color:blue"><%=rvo.getName() %></span>
			                </address>
			                <span>(<%=rvo.getDbday() %>)</span>
			              </header>
			              <div class="comcont">
			                <p><%=rvo.getMsg() %></p>
			              </div>
			            </article>
			          </li>
			          <li>
			            <table class="table">
					        <tr>
					          <td>
					           <form method=post action="../food/reply_insert.jsp">
					            <input type=hidden name=fno value="<%=no%>">
					            <textarea rows="3" cols="70" name="msg" style="float:left"></textarea>
					            <input type=submit value="댓글쓰기" style="float:left;height:67px;background-color:blue;color:white">
					           </form>
					          </td>
					        </tr>
					      </table>
			          </li>
	          <%
	            	 }
	             }
	          %>
	          </ul>
          </div>
	      <%
	         if(id!=null)
	         {
	      %>
	      <table class="table">
	        <tr>
	          <td>
	           <form method=post action="../food/reply_insert.jsp">
	            <input type=hidden name=fno value="<%=no%>">
	            <textarea rows="3" cols="70" name="msg" style="float:left"></textarea>
	            <input type=submit value="댓글쓰기" style="float:left;height:67px;background-color:blue;color:white">
	           </form>
	          </td>
	        </tr>
	      </table>
	      <%
	         }
	      %>
	    </div>
	    <div class="col-sm-4">
	      <h3 style="color:orange">주변 인기 식당</h3>
	      <%
	         for(FoodVO fvo:list)
	         {
	      %>
	           <table class="table">
	             <tr>
	               <td class="text-center" width=30% rowspan="4">
	                <img src="<%= fvo.getPoster().substring(0,fvo.getPoster().indexOf("^")) %>" width=100%>
	               </td>
	               <td width="70%"><%=fvo.getName() %></td>
	             </tr>
	             <tr>
	               <td width=70%>음식종류:<%=fvo.getType() %></td>
	             </tr>
	             <tr>
	               <td width=70%>위치:<%=sss %></td>
	             </tr>
	             <tr>
	               <td width=70%>가격대:<%=fvo.getPrice() %></td>
	             </tr>
	           </table>
	      <%
	         }
	      %>
	    </div>
    </div>
  </main>
</div>
</body>
</html>