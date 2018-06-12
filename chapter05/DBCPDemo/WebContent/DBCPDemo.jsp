<%@page import="java.sql.*"%>
<%@page import="net.jwstm.DBCPDemo.*"%>
<!-- 此处省略部分JSP页面常规代码 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DBCP演示页面</title>
</head>
<body>
	<% 
		//通过getConnection方法获取数据库连接
		Connection conn = DbcpDemo.ds.getConnection();
		//创建与数据库连接相关联的Statement对象
		Statement stmt = conn.createStatement();
		//创建包含sql语句的字符串，根据name字符串是否为空选择合适的查询语句
		String sql;
		sql = "select * from studentinfo";
		//执行SQL语句并获取执行结果
		ResultSet rs = stmt.executeQuery(sql);
		//显示读取出来的信息
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

</body>
</html>