<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除学生信息</title>
</head>
<body>
	<form method="post" action="delete.jsp">
		请输入要删除的学生学号：<input type="text" name="id"> <br> <input
			type="submit" value="删除">
	</form>
	<hr>
	<%
		//获取输入的学生姓名，如果没有输入，则默认为*
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
	%>
	<jsp:useBean id="bc" class="net.jwstm.JavaBeanDemo.mybeans.BeanConnect"></jsp:useBean>
	<%
		
		//创建包含sql语句的字符串，根据id字符串是否为空选择合适的查询语句
		String sql;
		sql = "select * from studentinfo";
		if (id == null || id.equals("")) {
			out.println("<font color=\"red\">请输入待删除学生的学号</font><br><hr>");
		} else {
			String deletesql="delete from studentinfo where id='"+id+"'";
			try {
				bc.executeSQL(deletesql);
			} catch (Exception e) {
				out.println("<font color=\"red\">输入信息有误，可能会覆盖现有数据，请检查后重新输入</font><br><hr>");
			}
		}

		//执行SQL语句并获取执行结果
		ResultSet rs = bc.select(sql);
		//显示度取出来的信息
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
		//关闭连接
		rs.close();
	bc.release();
	%>
</body>
</html>