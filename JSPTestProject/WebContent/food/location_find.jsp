<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../food/food.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
// ajax => 실시간 (날씨,증권,달러) => jax => javascript and xml => web2.0 => map , 서제스트 , 리뷰 , 댓글 , 예매 , 예약
$(function(){
	$('.images').css('cursor','pointer');
	$('.images').click(function(){
		let no=$(this).attr("data-value");
		$.ajax({
			type:'GET',
			url:'../food/location_result.jsp',
			data:{"no":no},
			success:function(res)
			{
				$('.print').html(res); // ajax => html(가장 단순한 방법),xml,json(출력할 데이터가 많은 경우),text(비밀번호,아이디 중복체크...)
			}
		})
	})
})
</script>
</head>
<body>
<div class="wrapper row3">
  <main class="container clear"> 
  <div class="row">
   <div id="a">
    <img id="seoul_1" src="../food/map/1111.png">
    <%
       for(int i=1;i<=25;i++)
       {
     %>
         <img id="gu<%=i %>" src="../food/map/gu_<%=i%>_off.png" 
          onmouseover="this.src='../food/map/gu_<%=i%>_on.png'" 
          onmouseout="this.src='../food/map/gu_<%=i%>_off.png'" class="images"
          data-value="<%=i %>"
         >
     <%
       }
     %>
   </div>
  </div>
  <div class="row print">
    
  </div>
  </main>
</div>
</body>
</html>