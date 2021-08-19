<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // main.jsp : 화면 제어 (container) => 모든 실행파일은 main.jsp로 이동 
    /*
         mode=1 => default.jsp 
         mode=2 => databoard/list.jsp
         mode=3 => databoard/insert.jsp
         mode=4 => databoard/detail.jsp
    */
    String mode=request.getParameter("mode");
    if(mode==null)
    	mode="1";
    int index=Integer.parseInt(mode);
    String main_jsp="";
    // include되는 파일만 지정 => 화면 출력하는 JSP만 설정 => insert_ok.jsp(X) , _ok.jsp
    switch(index)
    {
    case 1:
    	main_jsp="default.jsp";
    	break;
    case 2:
    	main_jsp="../databoard/list.jsp";
    	break;
    case 3:
    	main_jsp="../databoard/insert.jsp";
    	break;
    	// ..은 CD => 폴더 변경
    case 4:
    	main_jsp="../databoard/detail.jsp";
    	break;
    case 5:
    	main_jsp="../food/food_category_list.jsp";
    	break;
    case 6:
    	main_jsp="../food/food_detail.jsp";
    	break;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../gravity/layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body id="top">
  <jsp:include page="header.jsp"></jsp:include>
  <jsp:include page="<%=main_jsp %>"></jsp:include>
  <jsp:include page="footer.jsp"></jsp:include>
  <script src="../gravity/layout/scripts/jquery.min.js"></script> 
  <script src="../gravity/layout/scripts/jquery.backtotop.js"></script> 
  <script src="../gravity/layout/scripts/jquery.mobilemenu.js"></script> 
  <script src="../gravity/layout/scripts/jquery.flexslider-min.js"></script>
</body>
</html>