<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    //1. 페이지 받기 (사용자의 요청값을 받는다)  => 이전  다음
    String strPage=request.getParameter("page");
    if(strPage==null)
    	strPage="1";
    int curpage=Integer.parseInt(strPage);// 현재 페이지 
    // 현재 페이지에 해당되는 데이터를 가지고 온다 
    MusicDAO dao=new MusicDAO();
    ArrayList<MusicVO> list=dao.musicListData(curpage);
    // 총페이지
    int totalpage=dao.musicTotalPage();
%>
<%-- request에 값을 첨부 ${}
     ${request.getAttribute(),session.getAttribute()}
 --%>
<c:set var="list" value="<%=list %>"/>
<c:set var="curpage" value="<%=curpage %>"/>
<c:set var="totalpage" value="<%=totalpage %>"/>
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
h1{
   text-align: center;
}
</style>
</head>
<body>
  <div class="container">
    <h1>지니뮤직 Top200</h1>
    <div class="row">
      <table class="table">
        <tr class="danger">
          <th class="text-center">순위</th>
          <th class="text-center">등폭</th>
          <th class="text-center"></th>
          <th class="text-center">곡명</th>
          <th class="text-center">가수명</th>
        </tr>
        <c:forEach var="vo" items="${list }">
          <tr>
            <td class="text-center">${vo.no }</td>
            <td class="text-center">
              <c:choose>
                <c:when test="${vo.state=='상승' }"><font color="blue">▲</font>&nbsp;${vo.idcrement }</c:when>
                <c:when test="${vo.state=='하강' }"><font color="red">▼</font>&nbsp;${vo.idcrement }</c:when>
                <c:otherwise><font color="gray">-</font></c:otherwise>
              </c:choose>
            </td>
            <td class="text-center">
              <img src="${vo.poster }" width=35 height=35>
            </td>
            <td>${vo.title }</td>
            <td>${vo.singer }<br><sup>${vo.album }</sup></td>
          </tr>
        </c:forEach>
      </table>
      <table class="table">
        <tr>
          <td class="text-center">
            <a href="list.jsp?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-danger">이전</a>
             ${curpage } page / ${totalpage } pages
            <a href="list.jsp?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-info">다음</a>
          </td>
        </tr>
      </table>
    </div>
  </div>
</body>
</html>





