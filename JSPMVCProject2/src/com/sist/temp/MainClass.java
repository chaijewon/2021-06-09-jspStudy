package com.sist.temp;

import java.util.Scanner;

class ListModel
{
	public void _jspService()
	{
		System.out.println("<center><h1>묻고 답하기</h1></center>");
	}
}
class UpdateModel
{
	public void _jspService()
	{
		System.out.println("<center><h1>수정하기</h1></center>");
	}
}
class DeleteModel
{
	public void _jspService()
	{
		System.out.println("<center><h1>삭제하기</h1></center>");
	}
}
class InsertModel
{
	public void _jspService()
	{
		System.out.println("<center><h1>추가하기</h1></center>");
	}
}
// Controller
public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        Scanner scan=new Scanner(System.in);
        System.out.print("요청:");
        String cmd=scan.next();
        switch(cmd)
        {
        case "list.do":
        {
        	ListModel model=new ListModel();
        	model._jspService();
        }
        	break;
        case "insert.do":
        {
        	InsertModel model=new InsertModel();
        	model._jspService();
        }
        	break;
        case "update.do":
        {
        	UpdateModel model=new UpdateModel();
        	model._jspService();
        }
        	break;
        case "delete.do":
        {
        	DeleteModel model=new DeleteModel();
        	model._jspService();
        }
        	break;
        }
	}

}







