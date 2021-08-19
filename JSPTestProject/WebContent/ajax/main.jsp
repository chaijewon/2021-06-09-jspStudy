<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
   margin-top: 30px;
}
.row{
  margin: 0px auto;
  width:1200px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url:'result.jsp',
		type:'post',
		success:function(res)
		{
			$('.print').html(res);
		}
	})
	$('#btn').click(function(){
		let fd=$('#fd').val();
		if(fd.trim()=="")
		{
			$('#fd').focus();
			return;
		}
		// JSON => 파싱 
		$.ajax({
			url:'result.jsp',
			type:'post',
			data:{"fd":fd}, // result.jsp?fd=값 {"id":"admin","pwd":"1234"}
			success:function(res) // 200 => result.jsp정상수행시에 => res는 result.jsp의 실행 결과(html)
			{
				$('.print').html(res)
			}
		})
	})
})
</script>
</head>
<body>
  <div class="container">
    <div class="row">
     <!-- <form method="post" action="main.jsp"> -->
      Search:<input type=text name=fd size=20 class="input-sm" id="fd">
      <input type=button value="검색" class="btn btn-sm btn-danger" id="btn">
     <!-- </form> -->
    </div>
    <div class="row print" style="margin-top: 20px">
     
    </div>
  </div>
</body>
</html>













