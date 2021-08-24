package com.sist.dao;
import java.sql.*;
import java.util.*;
import javax.sql.*;
import javax.naming.*;
public class FoodDAO {
   private Connection conn;
   private PreparedStatement ps;
   // Connection읽기
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
   
   // Category 읽기 
   public ArrayList<CategoryVO> categoryListData()
   {
	   ArrayList<CategoryVO> list=new ArrayList<CategoryVO>();
	   try
	   {
		   getConnection();
		   String sql="SELECT cno,title,subject,poster "
				     +"FROM food_category "
				     +"ORDER BY cno ASC";
		   ps=conn.prepareStatement(sql);
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   CategoryVO vo=new CategoryVO();
			   vo.setCno(rs.getInt(1));
			   vo.setTitle(rs.getString(2));
			   vo.setSubject(rs.getString(3));
			   vo.setPoster(rs.getString(4));
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
   public ArrayList<FoodVO> foodListData(int cno)
   {
	   ArrayList<FoodVO> list=new ArrayList<FoodVO>();
	   try
	   {
		   getConnection();
		   String sql="SELECT no,name,score,address,tel,type,poster "
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
			   vo.setScore(rs.getDouble(3));
			   String addr=rs.getString(4);
			   addr=addr.substring(0,addr.lastIndexOf("지"));
			   vo.setAddress(addr);
			   vo.setTel(rs.getString(5));
			   vo.setType(rs.getString(6));
			   String image=rs.getString(7);
			   image=image.substring(0,image.indexOf("^"));
			   vo.setPoster(image);
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
   // 상세보기 => <c:forTokens> , 메뉴(원) 
   /*
    *   private int no,cno,good,soso,bad;
	    private String name,address,tel,type,price,parking,time,menu,poster;
	    private double score;
    */
   public FoodVO foodDetailData(int no)
   {
	   FoodVO vo=new FoodVO();
	   try
	   {
		   getConnection();
		   String sql="SELECT name,address,tel,type,price,time,menu,poster,score "
				     +"FROM food_house "
				     +"WHERE no=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, no);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   vo.setName(rs.getString(1));
		   vo.setAddress(rs.getString(2));
		   vo.setTel(rs.getString(3));
		   vo.setType(rs.getString(4));
		   vo.setPrice(rs.getString(5));
		   vo.setTime(rs.getString(6));
		   vo.setMenu(rs.getString(7));
		   vo.setPoster(rs.getString(8));
		   vo.setScore(rs.getDouble(9));
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
}







