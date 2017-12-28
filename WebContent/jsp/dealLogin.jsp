<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="sql.*" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<%
	String userid=request.getParameter("u_id");
	String userpwd=request.getParameter("u_pwd");
	
	DBConnect conn = new DBConnect();
	boolean isUser = conn.chkUser(userid, userpwd);
	
	if(isUser){
		User currentUser = new User();
		currentUser = conn.saveUser(userid);
		session.setAttribute("currentUser", currentUser);
		
		System.out.println("login success");
		response.sendRedirect("homepage.jsp");
	}
	else {
		System.out.println("login fail");
		out.println("<script language='javascript'>alert('工号或密码错误，请重新输入！');window.location.href='index.jsp';</script>");
	}
%>
</body>
</html>