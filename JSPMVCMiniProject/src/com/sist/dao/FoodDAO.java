package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
public class FoodDAO {
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
    
    // 카테고리 읽기
    public List<CategoryVO> categoryReadData()
    {
    	List<CategoryVO> list=new ArrayList<CategoryVO>();
    	try
    	{
    		getConnection();
    		String sql="SELECT cno,title,poster,subject "
    				  +"FROM food_category "
    				  +"ORDER BY cno ASC";
    		ps=conn.prepareStatement(sql);
    		ResultSet rs=ps.executeQuery();
    		while(rs.next())
    		{
    			CategoryVO vo=new CategoryVO();
    			vo.setCno(rs.getInt(1));
    			vo.setTitle(rs.getString(2));
    			vo.setPoster(rs.getString(3));
    			vo.setSubject(rs.getString(4));
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
    // 카테고리별 맛집 출력 
    public CategoryVO foodCategoryInfoData(int cno)
    {
    	CategoryVO vo=new CategoryVO();
    	try
    	{
    		getConnection();
    		String sql="SELECT title,subject "
    				  +"FROM food_category "
    				  +"WHERE cno=?";
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1, cno);
    		ResultSet rs=ps.executeQuery();
    		rs.next();
    		vo.setTitle(rs.getString(1));
    		vo.setSubject(rs.getString(2));
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
    public List<FoodVO> foodListData(int cno)
    {
    	List<FoodVO> list=new ArrayList<FoodVO>();
    	try
    	{
    		getConnection();
    		String sql="SELECT no,name,address,tel,type,poster "
    				  +"FROM food_house "
    				  +"WHERE cno=?";
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1, cno);
    		ResultSet rs=ps.executeQuery();
    		while(rs.next())
    		{
    			FoodVO vo=new FoodVO();
    			vo.setNo(rs.getInt(1));
    			vo.setName(rs.getString(2));
    			String addr=rs.getString(3);
    			addr=addr.substring(0,addr.lastIndexOf("지"));
    			vo.setAddress(addr);
    			vo.setTel(rs.getString(4));
    			vo.setType(rs.getString(5));
    			String img=rs.getString(6);
    			img=img.substring(0,img.indexOf("^"));
    			vo.setPoster(img);
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











