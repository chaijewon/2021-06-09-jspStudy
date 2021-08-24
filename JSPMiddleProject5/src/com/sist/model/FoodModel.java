package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.sist.dao.*;
/*
 *    public class 개
 *    {
 *       public void eat()
 *       {
 *       }
 *    }
 *    public class 사람
 *    {
 *       public void eat()
 *       {
 *       }
 *    }
 *    
 *    class A
 *    {
 *       int a=10;
 *    }
 *    
 *    class B
 *    {
 *        public void display(A aa)
 *        {
 *            aa.a=100;
 *        }
 *    }
 *    
 *    A aa=new A();
 *    B b=new B();
 *    b.display(aa);  ==> aa.a=100
 */
class A
{
	int a;
	String s;
}
public class FoodModel {
   public static void main(String[] args) {
	   FoodModel fm=new FoodModel();
	   int[] arr=new int[5]; // 0,0,0,0,0
	   for(int i:arr)
	   {
		   System.out.print(i+" ");
	   }
	   System.out.println();
	   fm.display(arr);
	   for(int i:arr)
	   {
		   System.out.print(i+" ");
	   }
	   
	   System.out.println();
	   A a=new A();
	   System.out.println("a="+a.a);
	   System.out.println("s="+a.s);
	   
	   fm.disp(a);
	   System.out.println("a="+a.a);
	   System.out.println("s="+a.s);
	   
   }
   public void disp(A aa)
   {
	   aa.a=100;
	   aa.s="홍길동";
   }
   public void display(int[] arr)
   {
	   for(int i=0;i<arr.length;i++)
	   {
		   arr[i]=(int)(Math.random()*100)+1;
	   }
   }
   public void categoryData(HttpServletRequest request)
   {
	   //System.out.println("FoodModel:request="+request);
	   FoodDAO dao=new FoodDAO();
	   ArrayList<CategoryVO> list=dao.categoryListData();
	   // JSP로 전송 => JSP가 가지고 있는 request에 요청값 추가해서 다시 JSP로 전송 => request.setAttribute("list", list);
	   request.setAttribute("list", list);
   }
   public void foodListData(HttpServletRequest request)
   {
	   String cno=request.getParameter("cno");
	   FoodDAO dao=new FoodDAO();
	   ArrayList<FoodVO> list=dao.foodListData(Integer.parseInt(cno));
	   request.setAttribute("list", list);
   }
   public void foodDetailData(HttpServletRequest request)
   {
	   // detail.jsp => 안에 코딩된 자바 <% %>:메소드안에서 코딩
	   String no=request.getParameter("no");
	   FoodDAO dao=new FoodDAO();
	   FoodVO vo=dao.foodDetailData(Integer.parseInt(no));
	   request.setAttribute("vo", vo); 
	   // 자바  <=====> JSP
	   // request/session(기간) => request화면이 변경되는 초기화 => 특별한 경우가 아니면 request 
	   // 여러개의 JSP에서 동시에 사용 => session(공유,공통으로 사용) => login(사용자 정보) 
	   // 자바 ====> JSP로 값을 전송 (request,session,cookie)
   }
}







