<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="sql.*"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会议室预订系统</title>
<link rel="stylesheet" href="../css/basis.css" />
<script language="javascript" type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>
</head>

<%
	
	User u = new User();
	u = (User)session.getAttribute("currentUser");
	String username = u.getUsername();
	String userposition = u.getUserposition();

	String roomStr = request.getParameter("room");
	String dateStr = request.getParameter("date");
	int roomID = Integer.parseInt(roomStr);
	
	DBConnect conn = new DBConnect();
	ArrayList<Room> rooms = new ArrayList<Room>();
	rooms = conn.getRooms();
	Room r = new Room();
	r=rooms.get(roomID-1);
	
	String year = dateStr.substring(0,4);
	String month = dateStr.substring(4,6);
	String day = dateStr.substring(6,8);
	dateStr = year + "-" + month + "-" + day;
	
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
    <td rowspan="2" valign="top">
    <div class="navi">
	<ul>
    	<li><a href="roomInfo.jsp">会议室信息</a></li>
    	<li><a href="order.jsp"><b>会议室预订</b></a></li>
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
    
    <%
    
		String orderDate = request.getParameter("srchDate");
    
	%>
	
    <form id="orderForm" name="orderForm" method="post" action="dealOrder.jsp">
       <p><b>会议室预订信息</b></p>
       <table border="0" align="center">
        <tr class="todd">
          <td class="ttitle" width='150'>会议室</td>
          <td width='300'>
          <select name="orderRoom" id="room">
          	
          	<%
          
          		out.println("<option value=\'" + roomID + "\' selected=\"selected\">会议室" + r.getRoomName() + "</option>");
          
          	%>
          	
          </select></td>
        </tr>
        <tr class='teven'>
          <td class="ttitle">预定日期</td>
          <td><input name="orderDate" value="<%=dateStr%>" onclick="WdatePicker()" class="Wdate"></input></td>
        </tr>
        <tr class='todd'>
          <td class="ttitle">开始时间</td>
          <td><input name="orderStartTime" type="text" onclick="WdatePicker({dateFmt:'H:mm'})"/></td>
        </tr>
        <tr class='teven'>
          <td class="ttitle">结束时间</td>
          <td><input name="orderEndTime" type="text" onclick="WdatePicker({dateFmt:'H:mm'})"/></td>
        </tr>
        <tr class='todd'>
          <td class="ttitle">预订人</td>
          <td><input name="orderStarter" type="text" value="<%=username%>" readonly="readonly"/></td>
        </tr>
        <tr class='teven'>
          <td class="ttitle">预定周期</td>
          <td>
          	<input name="orderPeriod" type="radio" value="daily" checked="checked">每日</input>
          	<input name="orderPeriod" type="radio" value="weekly">每周</input>
          </td>
        </tr>
        <tr class='todd'>
          <td class="ttitle">重复次数</td>
          <td>
          <input name="periodTimes" value="1" type="text"></input>          
          </td>
        </tr>
        <tr class="teven">
          <td class="ttitle">会议参与者</td>
          <td>
          <input name="orderGuest" type="text"></input>
          </td>
        </tr>
        <tr >
          <td align="center" colspan="2"><input type="submit" value="预订" /></td>
        </tr>
      </table>
    </form></td>
  </tr>
</table>
</body>
</html>
