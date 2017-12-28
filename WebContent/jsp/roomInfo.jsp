<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="sql.*" %> 
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会议室预订系统</title>
<link rel="stylesheet" href="../css/basis.css" />

<%
	
	User u = new User();
	u = (User)session.getAttribute("currentUser");
	String userposition = u.getUserposition();
	String username = u.getUsername();

	DBConnect conn = new DBConnect(); 
	ArrayList<Room> rooms = new ArrayList<Room>();
	rooms = conn.getRooms();
	Room r = new Room();
	
%>

</head>

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
    <td rowspan="2" valign="top">
    <div class="navi">
	<ul>
    	<li><a href="roomInfo.jsp"><b>会议室信息</b></a></li>
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
    <p><b>全部会议室信息</b><br/>(大会议室配备有投影仪和网络视频会议设备)</p>
  	<img src="../images/room.jpg" />
  	<table cellspacing="0"> 
<%
  	for(int i = 0; i<11; i ++){
  		out.println("<tr>"); 		
  		if(i==0){ 	
		  	out.println("<td class='ttitle' width='150'>会议室</td>");
		  	out.println("<td class='ttitle' width='150'>开始预订时间</td>");
		  	out.println("<td class='ttitle' width='150'>结束预订时间</td>");
		  	out.println("<td class='ttitle' width='150'>预订权限</td>");
		  	out.println("<td class='ttitle' width='150'>使用情况</td>");  			
  		}
  		
  		else if(i%2 == 1){  					
  				r = rooms.get(i-1);
 				out.println("<td class='todd'>");
  				out.println(r.getRoomName());
  				out.println("</td>");
  				out.println("<td class='todd'>");
  				out.println(r.getRoomStartTime());
  				out.println("</td>");
  				out.println("<td class='todd'>");
  				out.println(r.getRoomEndTime());
  				out.println("</td>");
  				out.println("<td class='todd'>");
  				out.println(r.getRoomPermission());
  				out.println("</td>");
  				out.println("<td class='todd'>");
  				out.println("<a href='chkRoomApply.jsp?roomid="+r.getRoomID()+"'>查看</a>");
  				out.println("</td>"); 		
  		}
  		
  		else if(i%2 == 0) { 					
  				r = rooms.get(i-1);
				out.println("<td class='teven'>");
				out.println(r.getRoomName());
				out.println("</td>");
				out.println("<td class='teven'>");
				out.println(r.getRoomStartTime());
				out.println("</td>");
				out.println("<td class='teven'>");
				out.println(r.getRoomEndTime());
				out.println("</td>");
				out.println("<td class='teven'>");
				out.println(r.getRoomPermission());
				out.println("</td>");
				out.println("<td class='teven'>");
				out.println("<a href='chkRoomApply.jsp?roomid="+r.getRoomID()+"'>查看</a>");
  				out.println("</td>");			
  		}
  		out.println("</tr");
  	}
%>
  	</table>
    </td>
  </tr>
</table>
</body>
</html>