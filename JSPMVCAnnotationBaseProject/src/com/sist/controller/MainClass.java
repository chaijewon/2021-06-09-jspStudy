package com.sist.controller;
import java.lang.reflect.Method;
import java.util.*;
// MVC => .do => 클래스 찾기 (메소드 호출) : 클래스가 많아진다 (관리하기 어렵다) 
// MVC => .do => 클래스안에 메소드 찾기 
// DAO => Model => 여러개의 기능을 묶어서 처리 (응집성:메소드) => 재사용 (객체지향 목적:재사용) => 유지보수 
// class 찾기 , 메소드 찾기 
public class MainClass {

	public static void main(String[] args) {
		try
		{
			List<String> list=new ArrayList<String>();
			list.add("com.sist.controller.BoardModel");
			list.add("com.sist.controller.MovieModel"); // XML => List
			Scanner scan=new Scanner(System.in);
			System.out.print("URL 입력(list.do):");
			String url=scan.next();
			
			for(String cls:list)
			{
				Class clsName=Class.forName(cls);// 클래스의 모든 정보를 읽어온다 
				// 메소드,멤버변수 ...
				Object obj=clsName.getDeclaredConstructor().newInstance(); // new BoardModel()
				
				// BoardModel 클래스가 가지고 있는 모든 메소드를 읽어 온다 
				Method[] methods=clsName.getDeclaredMethods();
				for(Method m:methods)
				{
					RequestMapping rm=(RequestMapping)m.getAnnotation(RequestMapping.class);
					// 어노테이션을 읽어 온다 
					if(rm.value().equals(url))
					{
						m.invoke(obj, null);// 메소드 자동 호출 
						// obj=> 생성된 객체 ==> null은 매개변수 (매개변수가 없는 경우 null)
					}
				}
			}
			
		}catch(Exception ex){ex.printStackTrace();}
	}
	/*
	 * public static void main(String[] args) { // TODO Auto-generated method stub
	 * Scanner scan=new Scanner(System.in); System.out.print("URL주소 입력(list.do):");
	 * String cmd=scan.next();
	 * 
	 * BoardModel model=new BoardModel(); // Controller를 수정 => if을 추가 // Controller를
	 * 수정 => 사이트를 종료 (Controller고정)
	 * 
	 * if(cmd.equals("list.do")) { model.boardList(); } else
	 * if(cmd.equals("insert.do")) { model.boardInsert(); } else
	 * if(cmd.equals("update.do")) { model.boardUpdate(); } else
	 * if(cmd.equals("delete.do")) { model.boardDelete(); } else
	 * if(cmd.equals("find.do")) { model.boardFind(); }
	 * 
	 * }
	 */

}








