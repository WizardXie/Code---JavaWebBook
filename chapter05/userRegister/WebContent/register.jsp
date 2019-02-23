<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
</head>
<body>
	<form action="Register.jsp" method="post">
		帐户：<input type="text" name="id"><br> 
		密码：<input type="password" name="password"><br> 
		<input	type="submit" value="注册">&nbsp;&nbsp;&nbsp;&nbsp;
		<input	type="reset" value="重置">
	</form>
	<hr>
	<%-- 获取注册用户信息 --%>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pass = request.getParameter("password");
		//定义表示MySQL的jdbc驱动类名的字符串	
		String driver = "com.mysql.jdbc.Driver";
		//定义表示数据库的URL的字符串，localhost为MySQL服务器的计算机名，也可以用IP地址表示，3306为访问端口
		String url = "jdbc:mysql://localhost:3306/testdb";
		//定义表示数据库用户名和密码的字符串
		String username = "root";
		String password = "12345678";
		//加载数据库JDBC驱动
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			out.println("数据库驱动出现问题，具体内容如下：");
			e.printStackTrace();
		}
		//创建网页到数据库的连接，注意：这里的Connection类来自包java.sql.Connection
		Connection conn = DriverManager.getConnection(url, username, password);
		//创建SQL语句对象
		Statement stmt = conn.createStatement();
		if ((id != null && pass != null) && (id.equals("") || pass.equals(""))) {
			out.println("<font color=\"red\">请输入帐号和密码</font><br><hr>");
		} else if (id != null && pass != null) {
			String insertsql = "insert into users values('" + id + "','" + pass + "')";
			try {
				stmt.executeUpdate(insertsql);
				out.println("注册成功，您的用户名是："+id+"，密码是："+pass);
			} catch (SQLException e) {
				out.println("<font color=\"red\">输入信息有误，可能会覆盖现有数据，请检查后重新输入</font><br><hr>");
			}
		}
		//关闭连接
		stmt.close();
		conn.close();
	%>
</body>
</html>