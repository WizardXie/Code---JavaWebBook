<%@page import="net.jwstm.JavaBeanDemo.mybeans.MessageBean"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>显示留言</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="mb" class="net.jwstm.JavaBeanDemo.mybeans.MessageBean">
		<jsp:setProperty name="mb" property="*" />
	</jsp:useBean>
	您的留言内容如下：
	<br> 姓名：<jsp:getProperty property="name" name="mb" /><br> 信息：<jsp:getProperty
		property="message" name="mb" />
</body>
</html>
