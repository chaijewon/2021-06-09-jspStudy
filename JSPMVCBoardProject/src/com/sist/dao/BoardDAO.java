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
    public BoardVO boardDetailData(int no)
    {
    	BoardVO vo=new BoardVO();
    	try
    	{
    		getConnection();
    		String sql="UPDATE mvcBoard SET "
    				  +"hit=hit+1 "
    				  +"WHERE no=?"; // 조회수 증가 
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1, no);
    		ps.executeUpdate();
    		
    		// 실제 데이터를 읽어 온다 
    		sql="SELECT no,name,subject,content,regdate,hit "
    	       +"FROM mvcBoard "
    		   +"WHERE no=?";
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1, no);
    		ResultSet rs=ps.executeQuery();
    		rs.next();
    		vo.setNo(rs.getInt(1));
    		vo.setName(rs.getString(2));
    		vo.setSubject(rs.getString(3));
    		vo.setContent(rs.getString(4));
    		vo.setRegdate(rs.getDate(5));
    		vo.setHit(rs.getInt(6));
    		rs.close();
    		
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	finally
    	{
    		disConnection();
    	}
    	return vo;
    }
    // 4. 답변 => 4번 
    /*
     *     ORDER BY group_id DESC,group_step ASC
     *                no    group_id    group_step   group_tab(답변표시)  root  depth(삭제용,답변갯수)
     *     AAAAAA      1       1           0             0                0      2
     *       
     *       =>BBBBB   2       1           1             1                1      1
     *        =>CCCCC  3       1           2             2                2      0
     *       =>DDDDD   4       1           1             1                1      0
     *            
     */
    // 트랜잭션 코딩 
    public void boardReplyInsert(int pno,BoardVO vo)
    {
    	try
    	{
    		//1.오라클 연결
    		getConnection();
    		//2.SQL문장 (1) => pno가 가지고 있는 group_id,group_step,group_tab를 가지고 온다
    		// 답변과 관련된 데이터 읽기
    		String sql="SELECT group_id,group_step,group_tab "
    				  +"FROM mvcBoard "
    				  +"WHERE no=?";
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1, pno);
    		ResultSet rs=ps.executeQuery();
    		rs.next();
    		int gi=rs.getInt(1); // 그대로 추가
    		int gs=rs.getInt(2); // gs+1
    		int gt=rs.getInt(3); // gt+1
    		rs.close();
    		//SQL문장 (2) => group_step를 증가 
    		// 답변 출력순서 지정 
    		sql="UPDATE mvcBoard SET "
    		   +"group_step=group_step+1 "
    	       +"WHERE group_id=? AND group_step>?";
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1, gi);
    		ps.setInt(2, gs);
    		ps.executeUpdate();
    		//SQL문장 (3) => insert 
    		sql="INSERT INTO mvcBoard(no,name,subject,content,pwd,group_id,group_step,group_tab,root,depth) "
    		   +"VALUES(mvc_no_seq.nextval,?,?,?,?,?,?,?,?,?)";
    		ps=conn.prepareStatement(sql);
    		ps.setString(1, vo.getName());
    		ps.setString(2, vo.getSubject());
    		ps.setString(3, vo.getContent());
    		ps.setString(4, vo.getPwd());
    		ps.setInt(5, gi);
    		ps.setInt(6, gs+1);
    		ps.setInt(7, gt+1);
    		ps.setInt(8, pno);
    		ps.setInt(9, 0);
    		ps.executeUpdate();
    		//SQL문장 (4) => depth를 증가 (답변의 갯수확인시킨다)
    		sql="UPDATE mvcBoard SET "
    		   +"depth=depth+1 "
    		   +"WHERE no=?";
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1, pno);
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
    // 5. 수정 
    public BoardVO boardUpdateData(int no)
    {
    	BoardVO vo=new BoardVO();
    	try
    	{
    		getConnection();
    		String sql="SELECT no,name,subject,content "
    	       +"FROM mvcBoard "
    		   +"WHERE no=?";
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1, no);
    		ResultSet rs=ps.executeQuery();
    		rs.next();
    		vo.setNo(rs.getInt(1));
    		vo.setName(rs.getString(2));
    		vo.setSubject(rs.getString(3));
    		vo.setContent(rs.getString(4));
    		rs.close();
    		
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	finally
    	{
    		disConnection();
    	}
    	return vo;
    }
    // 5-1 실제 수정 (결과값 => 비밀번호(O),비밀번호(X) 
    public boolean boardUpdate(BoardVO vo)
    {
    	boolean bCheck=false;// true => 수정처리 , false => 수정처리 없이 
    	try
    	{
    		getConnection();
    		//1.sql문장 => 비밀번호를 가지고 온다 
    		String sql="SELECT pwd FROM mvcBoard "
    				  +"WHERE no=?";
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1, vo.getNo());
    		ResultSet rs=ps.executeQuery();
    		rs.next();
    		String db_pwd=rs.getString(1);
    		rs.close();
    		
    		if(db_pwd.equals(vo.getPwd()))// 수정가능
    		{
    			bCheck=true;
    			// 실제 수정을 한다 
    			sql="UPDATE mvcBoard SET "
    			   +"name=?,subject=?,content=? "
    			   +"WHERE no=?";
    			ps=conn.prepareStatement(sql);
    			ps.setString(1, vo.getName());
    			ps.setString(2, vo.getSubject());
    			ps.setString(3, vo.getContent());
    			ps.setInt(4, vo.getNo());
    			
    			ps.executeUpdate();
    		}
    		else
    		{
    			bCheck=false;
    		}
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	finally
    	{
    		disConnection();
    	}
    	return bCheck;
    }
    // 6. 삭제 => 5번
    public boolean boardDelete(int no,String pwd)
    {
    	boolean bCheck=false;
    	try
    	{
    		// 1. 연결 (연결 Connection주소 얻기)
    		getConnection();
    		// 2. SQL문장 => 비밀번호 검색 
    		// 3. SQL문장 => depth검색 => 0삭제 , 0이 아니면 UPDATE
    		// 4. SQL문장 => delete
    		// 5. SQL문장 => update
    		// 6. SQL문장 => depth 감소 
    		String sql="SELECT pwd FROM mvcBoard "
    				  +"WHERE no=?";
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1, no);
    		ResultSet rs=ps.executeQuery();
    		rs.next();
    		String db_pwd=rs.getString(1);
    		rs.close();
    		
    		if(db_pwd.equals(pwd)) // 삭제
    		{
    			bCheck=true;
    			sql="SELECT depth,root FROM mvcBoard "
    			   +"WHERE no=?";
    			ps=conn.prepareStatement(sql);
    			ps.setInt(1, no);
    			rs=ps.executeQuery();
    			rs.next();
    			int depth=rs.getInt(1);
    			int root=rs.getInt(2);
    			rs.close();
    			
    			if(depth==0) // 답변이 없는 게시물
    			{
    				sql="DELETE FROM mvcBoard "
    				   +"WHERE no=?";
    				ps=conn.prepareStatement(sql);
    				ps.setInt(1, no);
    				ps.executeUpdate();
    			}
    			else // 답변을 가지고 있는 게시물 
    			{
    				String msg="관리자가 삭제한 게시물입니다.";
    				sql="UPDATE mvcBoard SET "
    				   +"subject=?,content=? "
    				   +"WHERE no=?";
    				ps=conn.prepareStatement(sql);
    				ps.setString(1, msg);
    				ps.setString(2, msg);
    				ps.setInt(3, no);
    				ps.executeUpdate();
    			}
    			
    			if(root!=0)
    			{
	    			sql="SELECT depth FROM mvcBoard "
	    			   +"WHERE no=?";
	    			ps=conn.prepareStatement(sql);
	    			ps.setInt(1, root);
	    			rs=ps.executeQuery();
	    			rs.next();
	    			int d=rs.getInt(1);
	    			rs.close();
	    			
	    			if(d>0)
	    			{
	    				sql="UPDATE mvcBoard SET "
	    				   +"depth=depth-1 "
	    				   +"WHERE no=?";
	    				ps=conn.prepareStatement(sql);
	    				ps.setInt(1, root);
	    				ps.executeUpdate();
	    			}
    			}
    			
    		}
    		else
    		{
    			bCheck=false;
    		}
    		
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	finally
    	{
    		disConnection();//반환 
    	}
    	return bCheck;
    }
    // 7. 검색
}











