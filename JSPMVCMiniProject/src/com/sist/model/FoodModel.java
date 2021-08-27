package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
// JSP(링크) ==> Model ==> DAD ==> Model => JSP
public class FoodModel {
  @RequestMapping("food/category.do")
  public String categoryData(HttpServletRequest request,HttpServletResponse response)
  {
	  System.out.println("요청");
	  FoodDAO dao=new FoodDAO();// 싱글턴 사용 (스프링은 싱글턴 기본)
	  List<CategoryVO> list=dao.categoryReadData();
	  request.setAttribute("list", list);// main_jsp => 파일명 (include)
	  return "../food/category.jsp";
  }
  @RequestMapping("food/list.do")
  public String foodListData(HttpServletRequest request,HttpServletResponse response)
  {
	  String cno=request.getParameter("cno");
	  FoodDAO dao=new FoodDAO();
	  List<FoodVO> list=dao.foodListData(Integer.parseInt(cno));
	  CategoryVO cvo=dao.foodCategoryInfoData(Integer.parseInt(cno));
	  //jsp로 전송 
	  request.setAttribute("cvo", cvo);
	  request.setAttribute("list", list);
	  return "../food/food_list.jsp";
  }
  @RequestMapping("food/detail.do")
  public String foodDetail(HttpServletRequest request,HttpServletResponse response)
  {
	  return "../food/food_detail.jsp";
  }
}
