package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
/*
 *   DBCP (DataBase Connection Pool)
 *   Pool => 저장 장소  =>: Connection객체를 저장(생성후에 저장)  => 미리 연결을 시킨후 메모리 저장 (풀) 
 *           => 내장 객체와 동일 
 *              request=new HttpServletRequest() => request, response 
 *   => 커넥션의 객체가 일정하기 때문에 관리하기 쉽다  (5~10)
 *   
 *   getConnection() => Connection생성 => 메모리에서 해제하지 않는다 => 메모리 누수현상 
 *     
 */
public class MusicDAO {
    private Connection conn;
    private PreparedStatement ps;
    // 보안 => server.xml은 관리자만 접근이 가능 => 보안  => 일반적으로 웹개발에서 가장 많이 쓰이는 기술 => DBCP
    // MyBatis => 일반DB(JDBC) , DBCP 
    // 미리 생성된 Connection 객체 얻어오기 
    public void getConnection()
    {
    	try
    	{
    		Context init=new InitialContext();//JNDI => 초기화 
    		// Java Naming Directory Interface => 탐색기 형식 
    		
    		Context c=(Context)init.lookup("java://comp//env");//lookup => 이름으로 객체의 주소를 찾아 온다 
    		// c드라이브 
    		DataSource ds=(DataSource)c.lookup("jdbc/oracle");
    		
    		conn=ds.getConnection();
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    }
    // Connection사용후에 반환 한다 => POOL안에 첨부 
    /*
     *      List => 이름 / 객체 / true/false
     *      ===============================================
     *       jdbc/oracle new Connection(): 오라클과 연결  true => 반환 false
     *       jdbc/oracle new Connection() false
     *       jdbc/oracle new Connection() false
     *       jdbc/oracle new Connection() false
     *       jdbc/oracle new Connection() false
     *      ===============================================
     */
    public void disConnection()
    {
    	try
    	{
    		if(ps!=null) ps.close();
    		if(conn!=null) conn.close();
    	}catch(Exception ex) {}
    }
    // SQL => 기능 (변경사항이 없다)
    public ArrayList<MusicVO> musicListData(int page)
    {
    	ArrayList<MusicVO> list=new ArrayList<MusicVO>();// 한페이지당 20개 
    	try
    	{
    		// 1. 미리 생성해 둔 Connection의 주소를 얻어 온다 
    		getConnection();
    		// 2. SQL문장 전송 
    		String sql="SELECT no,poster,singer,title,album,idcrement,state,num "
    				  +"FROM (SELECT no,poster,singer,title,album,idcrement,state,rownum as num "
    				  +"FROM (SELECT no,poster,singer,title,album,idcrement,state "
    				  +"FROM genie_cjw ORDER BY no ASC)) "
    				  +"WHERE num BETWEEN ? AND ?";//인라인뷰 (페이징 기법)
    		int rowSize=20;
    		int start=(rowSize*page)-(rowSize-1); // 1 , 21 , 41 ....
    		int end=rowSize*page; // 20,40,60....
    		
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1, start);
    		ps.setInt(2, end);
    		
    		// 3. 실행
    		ResultSet rs=ps.executeQuery();
    		while(rs.next())
    		{
    			MusicVO vo=new MusicVO();
    			vo.setNo(rs.getInt(1));
    			vo.setPoster(rs.getString(2));
    			vo.setSinger(rs.getString(3));
    			vo.setTitle(rs.getString(4));
    			vo.setAlbum(rs.getString(5));
    			vo.setIdcrement(rs.getInt(6));
    			vo.setState(rs.getString(7).trim());
    			list.add(vo);
    		}
    		rs.close();
    		
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	finally
    	{
    		// 반환 => POOL안으로 첨부 => 다른 유저가 사용이 가능하게 한다
    		disConnection();
    		
    	}
    	return list;
    }
    // 총페이지 
    public int musicTotalPage()
    {
    	int total=0;
    	try
    	{
    		getConnection();
    		String sql="SELECT CEIL(COUNT(*)/20.0) FROM genie_cjw";
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
    		// 반환 
    		disConnection();
    	}
    	return total;
    }
    // 찾기 
    // 상세보기  ==> DBCP / JSTL / EL  ==> <% %>코딩을 => 자바파일로 분리 (MVC) => M(자바)/V(JSP) => 연결(Controller)
    
}





















