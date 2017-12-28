<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会议室预订</title>
<link rel="stylesheet" href="../css/basis.css" />

<script language="javascript" type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>

</head>

<%
	
	User u = new User();
	u = (User)session.getAttribute("currentUser");
	String username = u.getUsername();
	String userposition = u.getUserposition();
	
	DBConnect conn = new DBConnect();
    ArrayList<Room> rooms = new ArrayList<Room>();
	rooms = conn.getRooms();
	Room r = new Room();

	Tool t = new Tool();

%>

<body>
<table width="90%" align="center" border="0">
  <tr>
    <td width="240" align="left">
      <h1>会议室预订系统</h1>
    </td>
    <td align="right">
    <p>当前用户：<%=username%></p>
      <a href="index.jsp">退出登录</a>
    </td>
  </tr>
  <tr>
    <td colspan="2" >
    <hr/>
    </td>
  </tr>
  <tr>
    <td rowspan="3" valign="top">
    <div class="navi">
	<ul>
    	<li><a href="roomInfo.jsp">会议室信息</a></li>
    	<li><a href="order.jsp">会议室预订</a></li>
        <li><a href="chkDate.jsp"><b>按日期查询</b></a></li>
        <li><a href="chkUser.jsp">用户预订信息</a></li>
        <li><a href="userLimitedMmt.jsp">用户信息修改</a></li>
        
        <%
        if(userposition.equals("admin")){
        	out.println("<li><a href='orderHistory.jsp'>用户预订历史</a></li>");
        	out.println("<li><a href='roomMmt.jsp'>会议室管理</a></li>");
        	out.println("<li><a href='userSrch.jsp'>用户管理</a></li>");
        	out.println("<li><a href='userCreate.jsp'>新建用户</a></li>");
        }
        %>
        
    </ul>
	</div>
    </td>

    <td align="center" valign="top">
    	<form id="chkRoom" name="chkRoom" method="post" action="chkDateApply.jsp" >   
         <p>
          <b>请选择查询日期：</b>
          <input name="selectedDate" id="selectedDate" onclick="WdatePicker()" class="Wdate"></input>     
          <input type="submit" value="查询"  />
         </p>
    	</form>
    </td>
  </tr>  
    
  <tr>  
    <th>
    	
<%

	String sdStr = request.getParameter("selectedDate");
    int sd;   
    if(sdStr.equals("")){
 	   SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
	   String todayStr = df.format(new Date());
 	   sd = Integer.parseInt(todayStr);  
 	} 	      
    else { 
	   String sdStr2 = sdStr.replaceAll("-", "");
       sd = Integer.parseInt(sdStr2);  
 	}    
    int year = sd/10000;
    int month = sd/100 % 100;
    int day = sd%100;    
    String dateTitle = year +"年"+month + "月" + day +"日";
   	out.println(dateTitle);

%>

    </th>
  </tr>

  <tr>
    <td>
    
<%	

   int col = 11;
   int row = 41;
   
   
   int startHour=8;
   String minuteLabel = "00";

   out.print("<table cellspacing='0'  >");
   
   for(int i= 0; i < row; i++){
	  		   		   
   out.print("<tr>");
   		for(int j = 0 ;j < col; j++) {
			 	if(i==0){
				   	   if(j!=0) {					   
			  		   		r = rooms.get(j-1);
					   		out.print("<td class='ttitle' width='60'>");
					   		out.print("会议室" + r.getRoomName());
					   		out.print("</td>");
					   }
					   else {
						 	  
						   out.print("<td class='ttitle' width='60'>");
						   out.print("</td>");
					   }	
				}
				   
				   else if(i%4==1){
					   if(j==0){
						   out.print("<td rowspan=4 class='ttitle'>");
						   startHour ++;
						   out.print(startHour + ":"+ minuteLabel);
						   out.print("</td>");
					   }
					   else {
						   
						   
						   int ttime = startHour * 100;
						   if(!conn.isRoomOrdered(ttime, j, sd)){
 
%>  

	<td class='todd'>
	  <a href="orderViaTable.jsp?startTime=<%=ttime%>&room=<%=j%>&date=<%=sd%>" class="order_href_odd">————————</a>
	</td>
								   
<%
						   }
						   
						   else{
							   Meeting m = new Meeting();
							   m = conn.getMeeting(ttime, j, sd);
							   int endTime = m.getMeetingEndTime();
							   int startTime = m.getMeetingStartTime();
							   String starter = m.getMeetingStarter();
							   int rspan = t.getPeriod(startTime, endTime);
							   
							   if(ttime == startTime) {
								   out.print("<td class='tselected' rowspan="+rspan+">");
								   out.print("<div class='meeting_info'>");
								   out.print("会议时间："+startTime+" - "+endTime);
								   out.print("<br/>");
								   out.print("会议发起者："+starter);
								   out.print("</div>");
								   out.print("</td>");
							   }
							   else{
								 
							   }
						   }
						  
					   }
				   }
				   
				   else if(i%4!=1){
					   if(j!=0){
						   if(i%4==2){
							   
							   int ttime = startHour * 100 + 15;
							   if(!conn.isRoomOrdered(ttime, j, sd)){
									 
%>  

	<td class='teven'>
	  <a href="orderViaTable.jsp?startTime=<%=ttime%>&room=<%=j%>&date=<%=sd%>" class="order_href_even">————————</a>
	</td>
									   
<%
								   
							   }
								   
								   else{
									   Meeting m = new Meeting();
									   m = conn.getMeeting(ttime, j, sd);
									   int endTime = m.getMeetingEndTime();
									   int startTime = m.getMeetingStartTime();
									   String starter = m.getMeetingStarter();
									   int rspan = t.getPeriod(startTime, endTime);
									   
									   if(ttime == startTime) {
										   out.print("<td class='tselected' rowspan="+rspan+">");
										   out.print("<div class='meeting_info'>");
										   out.print("会议时间："+startTime+" - "+endTime);
										   out.print("<br/>");
										   out.print("会议发起者："+starter);
										   out.print("</div>");
										   out.print("</td>");
										   }
										   else{
											 
										   }
								   }
							   
						   }
						   else if(i%4==3){
							   
							   int ttime = startHour * 100 + 30;
							   if(!conn.isRoomOrdered(ttime, j, sd)){
 
%>  

	<td class='todd'>
	  <a href="orderViaTable.jsp?startTime=<%=ttime%>&room=<%=j%>&date=<%=sd%>" class="order_href_odd">————————</a>
	</td>
								   
<%
							   }
								   else{
									   Meeting m = new Meeting();
									   m = conn.getMeeting(ttime, j, sd);
									   int endTime = m.getMeetingEndTime();
									   int startTime = m.getMeetingStartTime();
									   String starter = m.getMeetingStarter();
									   int rspan = t.getPeriod(startTime, endTime);
									   
									   if(ttime == startTime) {
										   out.print("<td class='tselected' rowspan="+rspan+">");
										   out.print("<div class='meeting_info'>");
										   out.print("会议时间："+startTime+" - "+endTime);
										   out.print("<br />");
										   out.print("会议发起者："+starter);
										   out.print("</div>");
										   out.print("</td>");
										   }
										   else{
											 
										   }
								   }
							  
						   }
						   else if(i%4==0){
							 
							   int ttime = startHour * 100 + 45;
							   if(!conn.isRoomOrdered(ttime, j, sd)){
								 
%>
  
	<td class='teven'>
	  <a href="orderViaTable.jsp?startTime=<%=ttime%>&room=<%=j%>&date=<%=sd%>" class="order_href_even">————————</a>
	</td>
									   
<%
								   }
								   
								   else{
									   Meeting m = new Meeting();
									   m = conn.getMeeting(ttime, j, sd);
									   int endTime = m.getMeetingEndTime();
									   int startTime = m.getMeetingStartTime();
									   String starter = m.getMeetingStarter();
									   int rspan = t.getPeriod(startTime, endTime);
									   
									   if(ttime == startTime) {
										   out.print("<td class='tselected' rowspan="+rspan+">");
										   out.print("<div class='meeting_info'>");
										   out.print("会议时间："+startTime+" - "+endTime);
										   out.print("<br/>");
										   out.print("会议发起者："+starter);
										   out.print("</div>");
										   out.print("</td>");
										   }
										   else{
											 
										   }
								   }
							   
						   }
											   
					   }
					   
				   }
			   			   
			   }	
			   out.print("</tr>");
		   }
		   
   out.print("</table>");
   
%>
	
     </td>
   </tr>
</table>
</body>
</html>
