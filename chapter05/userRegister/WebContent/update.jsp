<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
</head>
<body>
	<%
		if (session.getAttribute("login") == null) {
			out.println("请先登录，5秒后进入登录页面……");
			response.setHeader("refresh", "5;Login.jsp");
		} else {
			String s = session.getAttribute("login").toString();
			String id=session.getAttribute("id").toString();
			if (s.equals("true")) {
	%>
	<form action="Update.jsp" method="post">
		请输入新的密码：<input type="password" name="pass"><br> 
		<input	type="submit" value="修改">&nbsp;&nbsp;&nbsp;&nbsp;
		<input	type="reset" value="重置">
	</form>
	<%
		request.setCharacterEncoding("utf-8");
		String p = request.getParameter("pass");
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
		
		if(p!=null && p.equals("")){
			out.println("请输入新密码");
		}else if(p!=null){
			String sql="update users set password='"+p+"' where id='"+id+"'";
			stmt.executeUpdate(sql);
			out.println("修改成功！");
		}
	%>
	<%
		} else {
				out.println("请先登录，5秒后进入登录页面……");
				response.setHeader("refresh", "5;Login.jsp");
			}
		}
	%>
</body>
</html>