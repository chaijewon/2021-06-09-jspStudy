package com.sist.fo;

import java.util.Scanner;

class A
{
	public void service()
	{
		System.out.println("A:service()");
	}
}
class B
{
	public void service()
	{
		System.out.println("B:service()");
	}
}
class C
{
	public void service()
	{
		System.out.println("C:service()");
	}
}
public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        Scanner scan=new Scanner(System.in);
        System.out.println("화면 선택:");
        int a=scan.nextInt();
        switch(a)
        {
        case 1:
        	A aa=new A();
        	aa.service();
        	break;
        case 2:
        	B bb=new B();
        	bb.service();
        	break;
        case 3:
        	C cc=new C();
        	cc.service();
        	break;
        }
	}

}
