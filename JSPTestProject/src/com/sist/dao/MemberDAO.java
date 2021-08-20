package com.sist.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import java.util.*;
import com.sist.db.*;
public class MemberDAO {
   // 로그인 처리 (Ajax) 
	private Connection conn;
	private PreparedStatement ps;
	private DBCreate db=new DBCreate();
	public String isLogin(String id,String pwd)
	{
		String result="";
		try
		{
			//1. 연결 
			conn=db.getConnection();
			// 로그인 => id존재여부 , 존재(O)=> 비밀번호 확인 (O,X), 존재(X)
			// id 체크 
			String sql="SELECT COUNT(*) FROM jsp_member "
					  +"WHERE id=?";
			// count=0 (id=X)
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			rs.close();
			if(count==0)
			{
				result="NOID";
			}
			else
			{
				// 비밀번호 체크
				sql="SELECT pwd,name FROM jsp_member "
				   +"WHERE id=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				rs=ps.executeQuery();
				rs.next();
				String db_pwd=rs.getString(1);
				String name=rs.getString(2);
				if(pwd.equals(db_pwd)) // 로그인 상태
				{
					result=name; // 세션에 저장
				}
				else
				{
					result="NOPWD";
				}
			}
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return result;
	}
}







