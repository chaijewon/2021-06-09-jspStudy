package com.sist.movie;
import java.util.*;

import com.sist.db.DBCreate;

import java.sql.*;
public class MovieDAO {
   private Connection conn;
   private PreparedStatement ps;
   private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
   public MovieDAO()
   {
	   try
	   {
		   Class.forName("oracle.jdbc.driver.OracleDriver");
	   }catch(Exception ex) {}
   }
   public void getConnection()
   {
	   try
	   {
		   conn=DriverManager.getConnection(URL,"hr","happy");
	   }catch(Exception ex) {}
   }
   public void disConnection()
   {
	   try
	   {
		   if(ps!=null) ps.close();
		   if(conn!=null) conn.close();
	   }catch(Exception ex) {}
   }
   public ArrayList<MovieVO> movieFindData(String fd)
   {
	   ArrayList<MovieVO> list=new ArrayList<MovieVO>();
	   try
	   {
		   getConnection();
		   String sql="";
		   
		   if(fd.equals("all"))
		   {
			   sql="SELECT title,poster,rownum "
				  +"FROM daum_movie "
				  +"WHERE rownum<=32";
			   ps=conn.prepareStatement(sql);
		   }
		   else
		   {
			   sql="SELECT title,poster "
				  +"FROM daum_movie "
				  +"WHERE title LIKE '%'||?||'%'";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, fd);
		   }
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   MovieVO vo=new MovieVO();
			   vo.setTitle(rs.getString(1));
			   vo.setPoster(rs.getString(2));
			   list.add(vo);
		   }
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









