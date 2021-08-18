<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.*" %>    
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="com.sist.dao.*,java.io.*" %>
<%--
      업로드 
      데이터베이스에 정보 저장 
      화면이동 => list.jsp
--%>
<%
        // public MultipartRequest(javax.servlet.http.HttpServletRequest request, java.lang.String saveDirectory) throws java.io.IOException;
		try
		{
			  request.setCharacterEncoding("UTF-8");
		}catch(Exception ex){}
		String path="c:\\download"; // 업로드된 파일 저장위치
		int size=1024*1024*100;// 업로드할 수 있는 파일 크기 (100메가)
		String enctype="UTF-8";// 한글 파일명 
		// 2008 => 버전상의 문제 
		MultipartRequest mr=
				new MultipartRequest(request, path,size,enctype,new DefaultFileRenamePolicy());
		// new DefaultFileRenamePolicy() => 파일명을 변경 
	    // a.jpg => a.jpg(a1.jpg) a2.jpg , a3.jpg ....
		String name=mr.getParameter("name");
		String subject=mr.getParameter("subject");
		String content=mr.getParameter("content");
		String pwd=mr.getParameter("pwd");
		String filename=mr.getOriginalFileName("upload");
		
		DataBoardVO vo=new DataBoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		if(filename==null)
		{
			// 업로드가 없는 상태
			vo.setFilename("");
			vo.setFilesize(0);
		}
		else
		{
			// 업로드가 된 상태
			File file=new File("c:\\download\\"+filename);
			vo.setFilename(filename);
			vo.setFilesize((int)file.length()); // file크기 long
		}
      // 업로드 종료
      // 오라클에 전송 
      DataBoardDAO dao=new DataBoardDAO();
      dao.databoardInsert(vo);
      // 화면 이동 
      response.sendRedirect("../main/main.jsp?mode=2");// databoard/list.jsp이동 
      
%>









