<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function postFind()
{
	new daum.Postcode({
		oncomplete:function(data){
			$('#post').val(data.zonecode);
			$('#addr').val(data.address)
		}
	}).open();
}
</script>
</head>
<body>
<div class="wrapper row3">
  <main class="container clear">
   <table class="table">
    <tr>
      <th width=15%>우편번호</th>
      <td width=85% class="inline">
        <input type=text id="post" size=7 class="input-sm">
        <input type=button value="우편번호검색" id="btn" onclick="postFind()">
      </td>
    </tr>
    <tr>
      <th width=15%>주소</th>
      <td width=85%>
       <input type=text id="addr" size=35 class="input-sm">
      </td>
    </tr>
   </table>
  </main>
</div>
</body>
</html>