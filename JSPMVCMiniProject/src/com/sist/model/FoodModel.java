package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
public class FoodModel {
  @RequestMapping("food/category.do")
  public String categoryData(HttpServletRequest request,HttpServletResponse response)
  {
	  return "../food/category.jsp";
  }
  @RequestMapping("food/list.do")
  public String foodListData(HttpServletRequest request,HttpServletResponse response)
  {
	  return "../food/food_list.jsp";
  }
  @RequestMapping("food/detail.do")
  public String foodDetail(HttpServletRequest request,HttpServletResponse response)
  {
	  return "../food.food_detail.jsp";
  }
}
