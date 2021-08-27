package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
public class MusicDAO {
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
    public List<MusicVO> musicListData(String table)
    {
    	List<MusicVO> list=new ArrayList<MusicVO>();
    	try
    	{
    		getConnection();
    		String sql="SELECT no,poster,title,singer,album "
    				  +"FROM "+table; // ? => setString(1,table) => 'melon_cjw' =>?는 일반 데이터 출력 ''
    		ps=conn.prepareStatement(sql);
    		ResultSet rs=ps.executeQuery();
    		while(rs.next())
    		{
    			MusicVO vo=new MusicVO();
    			vo.setNo(rs.getInt(1));
    			vo.setPoster(rs.getString(2));
    			vo.setTitle(rs.getString(3));
    			vo.setSinger(rs.getString(4));
    			vo.setAlbum(rs.getString(5));
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
    public List<MusicVO> musicTotalData()
    {
    	List<MusicVO> list=new ArrayList<MusicVO>();
    	try
    	{
    		getConnection();
    		String sql="SELECT g.no,g.poster,g.title,g.singer,g.album "
    				  +"FROM genie_cjw g,melon_cjw m "
    				  +"WHERE g.title=m.title";
    		ps=conn.prepareStatement(sql);
    		ResultSet rs=ps.executeQuery();
    		while(rs.next())
    		{
    			MusicVO vo=new MusicVO();
    			vo.setNo(rs.getInt(1));
    			vo.setPoster(rs.getString(2));
    			vo.setTitle(rs.getString(3));
    			vo.setSinger(rs.getString(4));
    			vo.setAlbum(rs.getString(5));
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
    
}










