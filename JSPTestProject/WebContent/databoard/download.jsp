<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.net.*,java.io.*"%>
<%
    // 파일명 받기 
    // <a href="../databoard/download.jsp?fn=<%=vo.getFilename()">
    // GET => server.xml 등록 ( <Connector URIEncoding="UTF-8">)
    String fn=request.getParameter("fn");
    try
    {
    	File file=new File("c:\\download\\"+fn);
    	response.setContentLength((int)file.length()); // 파일 크기
    	response.setHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(fn, "UTF-8"));
    	// 서버로 부터                                                        다운로드창을 띄어라 
    	// 다운로드 
    	
    	BufferedInputStream bis=new BufferedInputStream(new FileInputStream(file));
    	// 서버에 존재하는 파일 읽기
    	BufferedOutputStream bos=new BufferedOutputStream(response.getOutputStream());
    	// 클라이언트에 파일을 전송 
    	int i=0;
    	byte[] buffer=new byte[1024];
    	while((i=bis.read(buffer,0,1024))!=-1) // 파일이 끝날때까지 읽어라 
    	{
    		bos.write(buffer, 0, i);
    	}
    	bis.close();
    	bos.close();
    	out.clear();// out객체 => 메모리에 HTML => 파일 쓰기
    	out=pageContext.pushBody();
    }catch(Exception ex){}
%>









