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
	conn.alterUserInfo(userid, userposition, usermail, userpwd);
	
	out.println("<script language='javascript'>alert('员工信息修改成功！');window.location.href='userSrch.jsp';</script>");
	}
	else {
		out.println("<script language='javascript'>alert('无搜索结果，请重新输入员工号！');window.location.href='userSrch.jsp';</script>");	
	}
	
%>
</body>
</html>