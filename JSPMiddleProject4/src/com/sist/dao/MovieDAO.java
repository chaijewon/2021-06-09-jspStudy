package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;//DataSource => 오라클에 대한 정보  => 정보를 받아서 연결 
import javax.naming.*;// Context => 찾기 (메모리에 저장) => lookup() => 이름으로 객체의 주소를 찾는 역할 
// MV => 구조 (자바/JSP) 분리  (자바=>JSP로 결과값을 전송 => request.setAttribute() => ${})
// MVC => 
public class MovieDAO {
   private Connection conn;
   private PreparedStatement ps;
   // 미리 객체를 생성해서 저장해 둔 => Connection객체 주소를 가지고 온다  (5/10) => 5개를 미리 만들어서 pool에 저장 (maxIdle), 
   // 인원이 많으면 10개(maxActive) => 톰캣에 의해 생성 (톰캣에 정보 => web.xml(error,서블릿 등록),server.xml(DB설정,파일설정))
   public void getConnection()
   {
	   try
	   {
		   // 메모리를 열기 
		   Context init=new InitialContext(); 
		   // 메모리에 저장된 위치로 접근 
		   Context c=(Context)init.lookup("java://comp//env");
		   DataSource ds=(DataSource)c.lookup("jdbc/oracle");
		   conn=ds.getConnection();
	   }catch(Exception ex) 
	   {
		   ex.printStackTrace();
	   }
   }
   // 사용후에 반드시 반환 => Connection을 재사용 
   public void disConnection()
   {
	   try
	   {
		   if(ps!=null) ps.close();
		   if(conn!=null) conn.close();
	   }catch(Exception ex){}
   }
   // DBCP => Connection과 관련 => 연결하는 시간을 줄여준다 (미리 연결해 놓고 사용자가 그냥 사용) => 보안 (웹서버의 일반화)
   // 416 page
   // 데이터 읽기
   public ArrayList<MovieVO> movieListData(int page)
   {
	   ArrayList<MovieVO> list=new ArrayList<MovieVO>();
	   try
	   {
		   // 미리 생성된 Connection 객체주소 얻어오기 
		   getConnection();
		   String sql="SELECT mno,poster,title,num "
				     +"FROM (SELECT mno,poster,title,rownum as num "
				     +"FROM (SELECT mno,poster,title "
				     +"FROM daum_movie ORDER BY mno ASC)) "
				     +"WHERE num BETWEEN ? AND ?";
		   // SQL문장을 오라클에 전송 => 나중에 ?에 값을 채운다 (PreparedStatement)
		   // SQL과 동시에 데이터를 전송 : Statement , 사용자 정의 함수(프로시저) 호출 : CallableStatement
		   // 오라클 기술면접 : JOIN,SUBQuery, Function VS Procedure , Trigger , Index
		   // DAO VS Service , OOP VS AOP , 동기화(쓰레드) => 충돌시에 처리 방법 (뮤텍스) ==> Spring
		   // 쓰레드 (한개 프로그램에서 여러개의 동작을 구현) => 웹/앱
		   // 면접 => 결론 / 부연 
		   // 예) 오버라이딩 VS 오버로딩  => modify / new 
		   ps=conn.prepareStatement(sql);
		   // ?에 값을 채운다 
		   int rowSize=12;
		   int start=(rowSize*page)-(rowSize-1);
		   int end=rowSize*page;
		   ps.setInt(1, start);
		   ps.setInt(2, end);
		   // 실행결과를 받는다 
		   ResultSet rs=ps.executeQuery();
		   // 메모리 => ArrayList에 저장 
		   while(rs.next())
		   {
			   MovieVO vo=new MovieVO();
			   vo.setMno(rs.getInt(1));
			   vo.setPoster(rs.getString(2));
			   vo.setTitle(rs.getString(3));
			   list.add(vo);
		   }
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();// 반환 
	   }
	   return list;
   }
   
   // 총페이지 구하기 
   public int movieTotalPage()
   {
	   int total=0;
	   try
	   {
		   getConnection();
		   String sql="SELECT CEIL(COUNT(*)/12.0) FROM daum_movie";
		   ps=conn.prepareStatement(sql);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   total=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
	   return total;
   }
   
}












