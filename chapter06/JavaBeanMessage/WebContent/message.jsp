<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>留言板</title>
</head>
<body>
<form method="post" action="show.jsp">
	<table>
	<caption>请输入您的姓名和留言</caption>
		<tr>
			<td>姓名：</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>信息：</td>
			<td><textarea name="message" rows="10" cols="20"></textarea></td>
		</tr>
		<tr>
			<td><input type="submit" value="提交"></td>
			<td><input type="reset" value="重置"></td>
		</tr>
	</table>
</form>
</body>
</html>