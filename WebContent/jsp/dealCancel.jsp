<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>会议室预订系统</title>
</head>
<body>
<% 

	String cancelID = request.getParameter("cancelID");
	DBConnect conn = new DBConnect();
	conn.cancelOrder(cancelID);	
	response.sendRedirect("chkUser.jsp");

%>
</body>
</html>