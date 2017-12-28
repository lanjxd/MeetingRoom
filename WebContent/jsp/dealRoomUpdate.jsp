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
	String roomStr = request.getParameter("selectedRoom");
	String startTimeStr = request.getParameter("startTime");
	String endTimeStr = request.getParameter("endTime");
	String authority = request.getParameter("authority");
	
	int room = Integer.parseInt(roomStr);
	String st1 = startTimeStr.replaceAll(":", "");
	int startTime = Integer.parseInt(st1);
	st1 = endTimeStr.replaceAll(":", "");
	int endTime = Integer.parseInt(st1);
	
	DBConnect conn = new DBConnect();
	conn.alterRoomInfo(room, startTime, endTime, authority);
	out.println("<script language='javascript'>alert('会议室信息修改成功！');window.location.href='roomMmt.jsp';</script>");
	
	
%>
</body>
</html>