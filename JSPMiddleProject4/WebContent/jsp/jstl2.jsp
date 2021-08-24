<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="str" value="Hello JSP EL,JSTL => Function"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>출력(334page)</h1>
문자갯수 출력:${fn:length(str) }<br> <%-- 화면 => 글자가 많아서 줄일 경우 (...) --%>
대문자변환 :${fn:toUpperCase(str) }<br>
소문자변환 :${fn:toLowerCase(str) }<br>
문자 자르기:${fn:substring(str,0,5) }<br> 
문자 찾기 : ${fn:indexOf(str,'l') }<br>
<%--문자 찾기 : ${fn:lastIndexOf(str,'l') }<br>--%>
원래데이터:${str}<br>
좌우공백제거:${fn:trim(str) }<br>
시작값:${fn:startsWith(str," He") }<br> <%-- true/false (<c:if>) --%>
끝값:${fn:endsWith(str,"!! ")}<br> <%-- true/false (<c:if>) --%>
포함 여부 : ${fn:contains(str,'ll') }<br>
글자 자르기 :${fn:substring(str,0,fn:length(str)>10?10:fn:length(str)) += '...'}
<%-- 자바에서 처리후에 데이터만 전송 --%>
</body>
</html>




