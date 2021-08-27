package com.sist.controller;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

@Retention(RUNTIME)
@Target(METHOD)
// 찾기 => 메소드 찾기 , index => if 대신 사용 ==> 어노테이션을 만드는 일은 실무에서는 없다 (스프링,마이바티스)
/*
 *    사용위치 
 *    @ ==> @Target(TYPE) => 클래스 찾기
 *    public class ClassName
 *    {
 *        @ ==> @Target(FIELD) => 멤버변수 
 *        BoardDAO dao;
 *        @ ==> @Target(METHOD) => 메소드찾기
 *        public void display()
 *        {
 *        }
 *        public void dispaly2(@ => @Target(PARAMETER) BoardDAO d) => 매개변수 
 *        {
 *        }
 *    }
 *    
 *    ==> 어노테이션 아래나 옆에 있는 대상 제어
 */
public @interface RequestMapping {
   public String value(); // 해당 찾는 경우에 => 문자열로 찾는다 
}









