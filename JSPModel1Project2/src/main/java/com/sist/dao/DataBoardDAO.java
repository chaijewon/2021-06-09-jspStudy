package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.db.*; // DBCP를 은닉화 => DataBaseConnectionPool(연결):웹 프로그램의 기본
// JDBC => DBCP => ORM(DBCP가 포함) 
//                 => MyBatis/Hibernate/JPA
//         getConnection(),disConnection()
// setHeader() , sendRedirect() , <jsp:setProperty> , session , <jsp:include>
public class DataBoardDAO {
   private Connection conn;
   private PreparedStatement ps;
   private DBCreate db=new DBCreate();
   // 목록 출력
   public ArrayList<DataBoardVO> databoardListData(int page)
   {
	   ArrayList<DataBoardVO> list=new ArrayList<DataBoardVO>();
	   try
	   {
		   //1.연결
		   conn=db.getConnection();
		   //2.SQL
		   String sql="SELECT no,subject,name,regdate,hit,num "
				     +"FROM (SELECT no,subject,name,regdate,hit,rownum as num "
				     +"FROM (SELECT no,subject,name,regdate,hit "
				     +"FROM databoard ORDER BY no DESC)) "
				     +"WHERE num BETWEEN ? AND ?";
		   //3. 문장 전송(오라클)
		   ps=conn.prepareStatement(sql);
		   //4. ?에 값을 채운다 
		   int rowSize=10;
		   int start=(rowSize*page)-(rowSize-1); // 1, 11 , 21
		   int end=rowSize*page;// 10,20,30
		   
		   ps.setInt(1, start);
		   ps.setInt(2, end);
		   // 5. 실행요청=>결과값 받기
		   ResultSet rs=ps.executeQuery();
		   // 6. 메모리에 저장된 데이터 => ArrayList에 담는다  => 브라우저에서 출력시에 블러온다 
		   while(rs.next())
		   {
			   DataBoardVO vo=new DataBoardVO();
			   vo.setNo(rs.getInt(1));
			   vo.setSubject(rs.getString(2));
			   vo.setName(rs.getString(3));
			   vo.setRegdate(rs.getDate(4));
			   vo.setHit(rs.getInt(5));
			   list.add(vo);
		   }
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   db.disConnection(conn, ps);
	   }
	   return list;
   }
   // 총페이지 
   public int databoardTotalPage()
   {
	   int total=0;
	   try
	   {
		   conn=db.getConnection();
		   String sql="SELECT CEIL(COUNT(*)/10.0) FROM databoard";
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
		   db.disConnection(conn, ps);
	   }
	   return total;
   }
   // 데이터 추가  => 업로드
   // 상세보기     => 다운로드 (response.setHeader()) => io
}











