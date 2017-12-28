<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	
	String username = request.getParameter("username");
	String userid = request.getParameter("userid");
	String userposition = request.getParameter("userposition");
	String usermail = request.getParameter("usermail");
	String userpwd = request.getParameter("userpwd");
	
	
	DBConnect conn = new DBConnect();
	
	if(conn.isUserExist(userid)){
		out.println("<script language='javascript'>alert('该员工已存在！');window.location.href='userCreate.jsp';</script>");
	}
	else {
	conn.createUser(userid, username, userpwd, usermail, userposition);	
	out.println("<script language='javascript'>alert('员工新建成功！');window.location.href='userCreate.jsp';</script>");
	}
%>
</body>
</html>