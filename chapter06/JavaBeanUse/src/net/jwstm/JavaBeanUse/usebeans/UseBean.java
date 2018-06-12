package net.jwstm.JavaBeanUse.usebeans;

import java.util.Scanner;
import net.jwstm.JavaBeanDemo.mybeans.MessageBean;

public class UseBean {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MessageBean mb =  new MessageBean();
		Scanner sc = new Scanner(System.in);   
	    System.out.print("请输入姓名:");   
	    String name = sc.next();  //读取字符串型输入-姓名
	    mb.setName(name);
	    System.out.print("请输入信息:");   
	    String message = sc.next();//读取字符串型输入-信息
	    mb.setMessage(message);
	    System.out.println("你的输入内容如下所示:");   
	    System.out.println("姓名：" + mb.getName() +"\n" 
	    			  + "信息：" + mb.getMessage() + "\n");   
		sc.close();

	}

}
