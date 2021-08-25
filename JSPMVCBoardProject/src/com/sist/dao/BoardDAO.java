package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
public class BoardDAO {
    private Connection conn;
    private PreparedStatement ps;
    // 미리 생성된 Connection의 주소를 읽어 온다 => 오라클과 연결 
    public void getConnection()
    {
    	try
    	{
    		Context init=new InitialContext();
    		Context c=(Context)init.lookup("java://comp//env");
    		DataSource ds=(DataSource)c.lookup("jdbc/oracle");
    		conn=ds.getConnection();
    	}catch(Exception ex) 
    	{
    		ex.printStackTrace();
    	}
    }
    // 반환 
    public void disConnection()
    {
    	try
    	{
    		if(ps!=null) ps.close();
    		if(conn!=null) conn.close();
    	}catch(Exception ex) {}
    }
    /*
     *    Collection (자료구조 : 데이터를 모아서 관리)
     *    ==========
     *      List  : 순서를 가지고 있다 (인덱스번호) , 데이터는 중복을 허용    
     *      ====
     *       |
     *     -----------------------
     *     |           |         |
     *    ArrayList(O)  Vector    LinkedList
     *    
     *      Set : 순서가 없다 , 데이터중복을 허용하지 않는다 (ArrayList에서 중복된 데이터를 제거)
     *      ===
     *       |
     *     --------
     *     |      |
     *   TreeSet HashSet(O)
     *   
     *     Map : 쌍으로 저장(키,값) => 키는 중복할 수 없다,값은 중복이 가능 (웹:=> request,session,application)
     *     ======= 클래스관리시 주로 사용 (클래스관리자 : 스프링=>Map을 이용)
     *      |
     *    ---------
     *    |       |
     *  Hashtable HashMap
     *     
     */
    // 기능 
    // 1. 목록
    public List<BoardVO> boardListData(int page)
    {
    	List<BoardVO> list=new ArrayList<BoardVO>(); // List=> interface , ArrayList는 List를 구현한 클래스 
    	// List는 ArrayList의 상위 클래스 => MyBatis(리턴형 => List)
    	try
    	{
    		getConnection();
    		String sql="SELECT no,subject,name,regdate,hit,group_tab,num "
    				  +"FROM (SELECT no,subject,name,regdate,hit,group_tab,rownum as num "
    				  +"FROM (SELECT no,subject,name,regdate,hit,group_tab "
    				  +"FROM mvcBoard ORDER BY group_id DESC,group_step ASC)) "
    				  +"WHERE num BETWEEN ? AND ?";
    		/*
    		 *    group_tab => 간격   =>답변 그림 출력 ==> level
    		 *    group_id => 답변의 그룹 
    		 *    group_step => 답변안에 출력 순서 
    		 */
    		ps=conn.prepareStatement(sql);
    		int rowSize=10;
    		int start=(rowSize*page)-(rowSize-1);
    		int end=rowSize*page;
    		
    		ps.setInt(1, start);
    		ps.setInt(2, end);
    		
    		ResultSet rs=ps.executeQuery();
    		while(rs.next())
    		{
    			BoardVO vo=new BoardVO();
    			vo.setNo(rs.getInt(1));
    			vo.setSubject(rs.getString(2));
    			vo.setName(rs.getString(3));
    			vo.setRegdate(rs.getDate(4));
    			vo.setHit(rs.getInt(5));
    			vo.setGroup_tab(rs.getInt(6));
    			list.add(vo);
    		}
    		rs.close();
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	finally
    	{
    		disConnection();
    	}
    	return list;
    }
    // 1-1 총페이지 
    public int boardTotalPage()
    {
    	int total=0;
    	try
    	{
    		getConnection();
    		String sql="SELECT CEIL(COUNT(*)/10.0) FROM mvcBoard";
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
    // 2. 게시물 추가 
    public void boardInsert(BoardVO vo)
    {
    	try
    	{
    		getConnection();
    		String sql="INSERT INTO mvcBoard(no,name,subject,content,pwd,group_id) "
    				  +"VALUES(mvc_no_seq.nextval,?,?,?,?,"
    				  +"(SELECT NVL(MAX(group_id)+1,1) FROM mvcBoard))";
    		ps=conn.prepareStatement(sql);
    		ps.setString(1, vo.getName());
    		ps.setString(2, vo.getSubject());
    		ps.setString(3, vo.getContent());
    		ps.setString(4, vo.getPwd());
    		
    		// 실행
    		ps.executeUpdate();
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	finally
    	{
    		disConnection();
    	}
    }
    // 3. 내용보기 => 2번
    // 4. 답변 => 4번 
    // 5. 수정 
    // 6. 삭제 => 5번
    // 7. 검색
}











