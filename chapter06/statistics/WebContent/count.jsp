<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>统计信息</title>
</head>
<body>
	<jsp:useBean id="stat" class="net.jwstm.Statistics.beans.statBean"></jsp:useBean>
	<%
		out.println("最高分获得者为：" + stat.getMaxName() + ",成绩为：" + stat.getMaxScore() + "<br>");
		out.println("最低分获得者为：" + stat.getMinName() + ",成绩为：" + stat.getMinScore() + "<br>");
		out.println("一共有" + stat.getLength() + "名学生，平均分为：" + stat.getAverage()+ "<br>");
		out.println("一共有"+stat.getBadNames().size()+"名学生不及格，他们是：<br>");
		ArrayList<String> a=stat.getBadNames();
		ArrayList<String> b=stat.getBadScores();
		for(int i=0;i<a.size();i++){
			out.println(a.get(i)+"，成绩为："+b.get(i)+"<br>");
		}
	%>
</body>
</html>