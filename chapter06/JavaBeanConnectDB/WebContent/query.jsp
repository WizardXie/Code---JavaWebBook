<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询学生情况</title>
</head>
<body>
	<form method="post" action="query.jsp">
		请输入要查询的学生姓名：<input type="text" name="name"> <br> <input
			type="submit" value="查询">
	</form>
	<hr>
	<jsp:useBean id="bc" class="net.jwstm.JavaBeanDemo.mybeans.BeanConnect"></jsp:useBean>
	<%
		//获取输入的学生姓名
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		//创建包含sql语句的字符串，根据name字符串是否为空选择合适的查询语句
		String sql;
		if (name == null || name.equals("")) {
			sql = "select * from studentinfo";
		} else {
			sql = "select * from studentinfo where name='" + name + "'";
		}
		//执行SQL语句并获取执行结果
		ResultSet rs = bc.select(sql);
		//显示查询结果
	%>
	<table border=1>
		<caption>学生信息表</caption>
		<tr>
			<th>学号</th>
			<th>姓名</th>
			<th>性别</th>
			<th>系部</th>
		</tr>
		<%
			//输出信息		
			while (rs.next()) {
				out.println("<tr>");
				out.println("<td>" + rs.getString(1) + "</td>");
				out.println("<td>" + rs.getString(2) + "</td>");
				out.println("<td>" + rs.getString(3) + "</td>");
				out.println("<td>" + rs.getString(4) + "</td>");
				out.println("</tr>");
			}
		%>
	</table>
	<%
		rs.close();
		bc.release();
	%>
</body>
</html>