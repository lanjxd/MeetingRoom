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
</head>

<%
	
	User u = new User();
	u = (User)session.getAttribute("currentUser");
	String username = u.getUsername();
	String userposition = u.getUserposition();
	String roomid = request.getParameter("roomid");
	int room = Integer.parseInt(roomid);
	DBConnect conn = new DBConnect();
	ArrayList<Meeting> allApplies = new ArrayList<Meeting>();   
    allApplies = conn.chkRoomApply(room);
    ArrayList<Room> rooms = new ArrayList<Room>();
    Meeting apply = new Meeting();
	rooms = conn.getRooms();
	Room r = new Room();
	r = rooms.get(room-1);

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
        				<li><a href="chkDate.jsp">按日期查询</a></li>
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
    			<p><b>会议室<%=r.getRoomName() %>预约情况</b></p>
    			<table cellspacing="0">
    			
    <%
    	
    	for(int i = 0; i < (allApplies.size()+1); i++){
        	
        	out.println("<tr>");
        	
        	if(i==0){        	  	
           	 	out.println("<td class='ttitle' width='150'>会议日期</td>");
            	out.println("<td class='ttitle' width='150'>会议起始时间</td>");
            	out.println("<td class='ttitle' width='150'>会议结束时间</td>");  
            	out.println("<td class='ttitle' width='150'>预约者</td>");        	
        	}
        	
        	else if(i%2 == 1){
        		apply = allApplies.get(i-1);
                int applyDate = apply.getMeetingDate();
                int orderStartTime = apply.getMeetingStartTime();
                int orderEndTime = apply.getMeetingEndTime();
                String orderStarter = apply.getMeetingStarter();
                
                String applyDateStr = String.valueOf(applyDate);
                String year = applyDateStr.substring(0,4);
            	String month = applyDateStr.substring(4,6);
            	String day = applyDateStr.substring(6,8);
            	String orderDate = year + "-" + month + "-" + day;
            	
        	    out.println("<td class='todd'>");
  				out.println(orderDate);
  				out.println("</td>");
  				out.println("<td class='todd'>");
  				out.println(orderStartTime);
  				out.println("</td>");
  				out.println("<td class='todd'>");
  				out.println(orderEndTime);
  				out.println("</td>");
  				out.println("<td class='todd'>");
  				out.println(orderStarter);
  				out.println("</td>");    				
        	}
        	
        	else if(i%2 == 0) {
        		apply = allApplies.get(i-1);
                int applyDate = apply.getMeetingDate();
                int orderStartTime = apply.getMeetingStartTime();
                int orderEndTime = apply.getMeetingEndTime();
                String orderStarter = apply.getMeetingStarter();
                
                String applyDateStr = String.valueOf(applyDate);
                String year = applyDateStr.substring(0,4);
            	String month = applyDateStr.substring(4,6);
            	String day = applyDateStr.substring(6,8);
            	String orderDate = year + "-" + month + "-" + day;
            	
				out.println("<td class='teven'>");
				out.println(orderDate);
				out.println("</td>");
				out.println("<td class='teven'>");
				out.println(orderStartTime);
				out.println("</td>");
				out.println("<td class='teven'>");
				out.println(orderEndTime);
				out.println("</td>");
				out.println("<td class='teven'>");
				out.println(orderStarter);
				out.println("</td>");				
  			}
        	out.println("</tr>");
  		}
    	
    %>
    
    			</table>	
    		</td>
  		</tr>
  		<tr>
    		<td></td>
  		</tr>
	</table>
</body>
</html>