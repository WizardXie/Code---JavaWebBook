<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加学生信息</title>
</head>
<body>
	请输入要添加的学生信息
	<form method="post" action="insert.jsp">
		学号：<input type="text" name="id"><br> 姓名：<input
			type="text" name="name"><br> 性别：<input type="text"
			name="gender"><br> 系部：<input type="text"
			name="department"><br> <input type="submit" value="添加">&nbsp;&nbsp;&nbsp;&nbsp;<input
			type="reset" value="重置">
	</form>
	<hr>
	<jsp:useBean id="bc" class="net.jwstm.JavaBeanDemo.mybeans.BeanConnect"></jsp:useBean>
	<%-- 获取学生信息 --%>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String department = request.getParameter("department");
		if ((id != null && name != null) && (id.equals("") || name.equals(""))) {
			out.println("<font color=\"red\">请输入学号和姓名，这是必填信息</font><br><hr>");
		} else if (id != null && name != null) {
			String sql = "insert into studentinfo values('" + id + "','" + name + "','" + gender + "','"
					+ department + "')";
			try {
				bc.executeSQL(sql);
			} catch (Exception e) {
				out.println("<font color=\"red\">输入信息有误，可能会覆盖现有数据，请检查后重新输入</font><br><hr>");
			}
		}
		//创建包含sql语句的字符串
		String sql = "select * from studentinfo";
		//执行SQL语句并获取执行结果
		ResultSet rs = bc.select(sql);
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
	<%
		//关闭连接
		rs.close();
	bc.release();
	%>
</body>
</html>