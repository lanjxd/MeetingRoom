<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>会议室预订系统</title>
</head>
<body>

<%

	String orderRoom = request.getParameter("orderRoom");
	String orderDate = request.getParameter("orderDate");
	String orderStartTime = request.getParameter("orderStartTime");
	String orderEndTime = request.getParameter("orderEndTime");
	String orderPeriod = request.getParameter("orderPeriod");
	String orderTimesStr = request.getParameter("periodTimes");
	String orderGuest = request.getParameter("orderGuest");
		
	int room = Integer.parseInt(orderRoom);
	int cycle = Integer.parseInt(orderTimesStr);
			
	User u = new User();
	u = (User)session.getAttribute("currentUser");
	String orderStarter = u.getUsername();
	String starterPosition = u.getUserposition();
				
	Tool t = new Tool();

	String orderDateStr = "";
	orderDateStr = orderDate.replaceAll("-", "");
	int date = Integer.parseInt(orderDateStr);

	String orderStartTimeStr = "";
	orderStartTimeStr = orderStartTime.replaceAll(":", "");
	int startTime = Integer.parseInt(orderStartTimeStr);
	
	String orderEndTimeStr = "";
	orderEndTimeStr = orderEndTime.replaceAll(":", "");
	int endTime = Integer.parseInt(orderEndTimeStr);
	
	float duration = t.getDuration(startTime, endTime);
	
	SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
	String now = df.format(new Date());
	
	long applyTime = Long.parseLong(now);
	int status = 1;
	String IdStr = now + "1";
	long id = Long.parseLong(IdStr);
		
	DBConnect orderconn = new DBConnect();
	
	Room r = new Room();
	r = orderconn.getRoom(room);
	
	int flag = 0;
	if(starterPosition.equals("employee")){
		if((orderPeriod.equals("daily") && (cycle > 14)) || (orderPeriod.equals("weekly") && (cycle > 2))){
			out.println("<script language='javascript'>alert('只接受两周内的预约!');window.location.href='order.jsp';</script>");
			System.out.println("Cycle Limit Error");
			flag = 1;
		}
		else if(duration*cycle > 20){
			out.println("<script language='javascript'>alert('您的总预订时长已超过20小时上限！');window.location.href='order.jsp';</script>");
			System.out.println("Duration Limit Error");
			flag = 1;
		}
	}
	if(startTime<r.getRoomStartTime() || endTime > r.getRoomEndTime() || startTime >= endTime){
		out.println("<script language='javascript'>alert('预约时间有误，请重新输入！');window.location.href='order.jsp';</script>");
		System.out.println("Time Error");
		flag = 1;
	}	
	else if(starterPosition.equals("employee") && r.getRoomPermission().equals("manager")) {
		out.println("<script language='javascript'>alert('您尚无权限预订该会议室！');window.location.href='order.jsp';</script>");
		System.out.println("Permission Error");	
		flag = 1;
	}
	else{	
		
		for(int i = 0;i < cycle; i++){		
			int chkdate = date;			
			if(orderconn.isRoomOrdered(startTime, endTime, room, chkdate)){			
				out.println("<script language='javascript'>alert('该时段此会议室已被预订，请更改预约申请！');window.location.href='order.jsp';</script>");
				System.out.println("Order Period Error");
				flag = 1;
			}
			chkdate = t.addDate(chkdate, orderPeriod);
		}		
		if(flag == 0){
			for(int j = 0; j < cycle; j++){
				orderconn.applyRoom(id, date, startTime, endTime, orderStarter, room, 1, applyTime, orderGuest);
				date = t.addDate(date, orderPeriod);			
				id++;		
			}
			out.println("<script language='javascript'>alert('预约成功！');window.location.href='order.jsp';</script>");
			System.out.println("Order Success");
		}
	}	
	
%>	
	
</body>
</html>