package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.db.*;
/*
 *   1. Web 
 *      **핵심 : DAO(오라클) => Jsoup 실시간 (단점) => 클라이언트마다 내용이 다르다 
 *              = DBCP = ORM
 *      **CS : client/server => 요청/응답
 *                            request / response => 서버에서 필요한 부분을 저장 (session)
 *                            ======== 필요한 부분을 저장 (cookie)
 *      **JSP => HTML안에 자바 코딩 => 데이터출력 
 *      HTML/CSS ==> 템플릿 (약간 수정) => 오픈소스
 *      **JavaScript ==> 클라이언트 동작을 제어 
 *      
 *      => 최적화 (속도) , 가독성
 *      
 */
public class FoodDAO {
   private Connection conn;
   private PreparedStatement ps;
   private DBCreate db=new DBCreate();
   // 카테고리 읽기 
   public ArrayList<CategoryVO> foodCategoryListData()
   {
	   ArrayList<CategoryVO> list=new ArrayList<CategoryVO>();
	   try
	   {
		   conn=db.getConnection();
		   String sql="SELECT cno,title,subject,poster "
				     +"FROM food_category "
				     +"ORDER BY cno ASC";
		   // 1~12 , 13~18 , 19~30
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
		   db.disConnection(conn, ps);
	   }
	   return list;
   }
   // 카테고리별 맛집 목록 
   public ArrayList<FoodVO> foodCategoryData(int cno)
   {
	   ArrayList<FoodVO> list=new ArrayList<FoodVO>();
	   try
	   {
		   conn=db.getConnection();
		   String sql="SELECT no,name,address,tel,type,poster,score "
				     +"FROM food_house "
				     +"WHERE cno=? "
				     +"ORDER BY no ASC";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, cno);
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   FoodVO vo=new FoodVO();
			   vo.setNo(rs.getInt(1)); //Detail로 이동 
			   vo.setName(rs.getString(2));
			   String addr=rs.getString(3);
			   addr=addr.substring(0,addr.lastIndexOf("지"));
			   vo.setAddress(addr);
			   vo.setTel(rs.getString(4));
			   vo.setType(rs.getString(5));
			   String image=rs.getString(6);
			   image=image.substring(0,image.indexOf("^"));//이미지가 5개  ^
			   vo.setPoster(image);
			   vo.setScore(rs.getDouble(7));
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
   
   // Category데이터 
   public CategoryVO foodCategoryInfo(int cno)
   {
	   CategoryVO vo=new CategoryVO();
	   try
	   {
		   conn=db.getConnection();
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
		   db.disConnection(conn, ps);
	   }
	   return vo;
   }
}






