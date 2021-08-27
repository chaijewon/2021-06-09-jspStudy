package com.sist.dao;
/*
 *   역할분담 ==> 
 *     1) Controller(공통)
 *     2) 역할 => VO,DAO,Model,JSP
 *              ================= 
 *              게시판  : BoardVO,BoardDAO,BoardModel, list.jsp
 *              회원가입 
 *      MNO      NOT NULL NUMBER        
		CNO               NUMBER        
		TITLE    NOT NULL VARCHAR2(300) 
		REGDATE           VARCHAR2(100) 
		GENRE    NOT NULL VARCHAR2(200) 
		NATION            VARCHAR2(100) 
		GRADE    NOT NULL VARCHAR2(50)  
		TIME     NOT NULL VARCHAR2(30)  
		SCORE             NUMBER(2,1)   
		SHOWUSER          VARCHAR2(100) 
		POSTER   NOT NULL VARCHAR2(260) 
		STORY             CLOB        
 */
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
/*
 *   Connection => 오라클 연결하는 시간이 오래 걸린다 => 오라클 (서버에만 존재) 
 *              => 데이터 수집 (학원 컴퓨터) 
 *              => 프로젝트 (조별) => 조원 동시 작업 
 *                                ==========
 *                                1. 데이터 동일 (오라클 1개만 사용) => 고정(학원)
 *                                2. 프로젝트 => 1개만 사용 (UPDATE,WRITE,DELETE)
 *                                3. 예) list.jsp => 접속한 모든 (원격=>GITHUB) => Commit , Pull
 *                                   => Commit (반드시 조원 => 소통)
 *                                4. jdk버젼 ,한글변환 (15,1.8) => 톰캣 버전 
 */

public class MovieDAO {
    private Connection conn;
    private PreparedStatement ps;
    // Connection (미리 생성됨) => 생성된  Connection객체의 주소 얻기 
    public void getConnection()
    {
    	try
    	{
    		Context init=new InitialContext();
    		Context c=(Context)init.lookup("java://comp//env");
    		DataSource ds=(DataSource)c.lookup("jdbc/oracle");
    		conn=ds.getConnection();
    	}catch(Exception ex){}
    }
    // 사용후에는 반드시 반환 => conn.close() 
    public void disConnection()
    {
    	try
    	{
    		if(ps!=null) ps.close();
    		if(conn!=null) conn.close();
    	}catch(Exception ex) {}
    }
    
    // 1. 영화 출력 
    public List<MovieVO> movieListData(int cno)
    {
    	List<MovieVO> list=new ArrayList<MovieVO>();
    	try
    	{
    		getConnection();
    		String sql="SELECT mno,title,poster,genre,grade "
    				  +"FROM daum_movie "
    				  +"WHERE cno=?";
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1, cno);
    		ResultSet rs=ps.executeQuery();
    		while(rs.next())
    		{
    			MovieVO vo=new MovieVO();
    			vo.setMno(rs.getInt(1));
    			vo.setTitle(rs.getString(2));
    			vo.setPoster(rs.getString(3));
    			vo.setGenre(rs.getString(4));
    			vo.setGrade(rs.getString(5));
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
}

























