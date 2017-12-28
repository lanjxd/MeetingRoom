<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="sql.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会议室预订</title>

<link rel="stylesheet" href="../css/basis.css" />

<script language="javascript" type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>

</head>

<%

	DBConnect conn = new DBConnect();
	ArrayList<Meeting> historyApplies = new ArrayList<Meeting>();
	User u = new User();
	u = (User)session.getAttribute("currentUser");
	String username = u.getUsername();

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
    <td colspan="2">
    <hr/>
    </td>
  </tr>
  <tr>
    <td rowspan="2" valign="top">
    <div class="navi">
	<ul>
    	<li><a href="roomInfo.jsp">会议室信息</a></li>
    	<li><a href="order.jsp">会议室预订</a></li>
        <li><a href="chkDate.jsp">按日期查询</a></li>
        <li><a href="chkUser.jsp">用户预订信息</a></li>
        <li><a href='orderHistory.jsp'><b>用户预订历史</b></a></li>
        <li><a href='roomMmt.jsp'>会议室管理</a></li>
        <li><a href='userSrch.jsp'>用户管理</a></li>
        <li><a href='userCreate.jsp'>新建用户</a></li>
    </ul>
	</div>
    </td>
    <td align="center" valign="top">
    	<p><b>会议室预订历史</b></p>
  
    <%
   
    historyApplies = conn.chkUserHistoryApply();
    Meeting apply = new Meeting();
    ArrayList<Room> rooms = new ArrayList<Room>();
    rooms = conn.getRooms();
    Room r = new Room();
    for(int i = 0; i <historyApplies.size();i++){
        apply = historyApplies.get(i);
        long applyID = apply.getMeetingID();
        long applyTime = apply.getMeetingApplyTime();
        int applyRoom = apply.getMeetingRoom();
        int applyDate = apply.getMeetingDate();
        int applyStartTime = apply.getMeetingStartTime();
        int applyEndTime = apply.getMeetingEndTime();
        int applyStatus = apply.getMeetingStatus();
        String applier = apply.getMeetingStarter();
        
        String applyDateStr = String.valueOf(applyDate);
        String year = applyDateStr.substring(0,4);
    	String month = applyDateStr.substring(4,6);
    	String day = applyDateStr.substring(6,8);
    	String orderDate = year + "-" + month + "-" + day;
        
        r = rooms.get(applyRoom-1);
    	
        out.print("<table>");
        out.print("<tr class='teven'>");
        out.print("<td width='150'>");
        out.print("预约申请时间");
        out.print("</td>");
        out.print("<td width='120'>");
        out.print("会议室");
        out.print("</td>");
        out.print("<td width='120'>");
        out.print("会议日期");
        out.print("</td>");
        out.print("<td width='120'>");
        out.print("会议起始时间");
        out.print("</td>");
        out.print("<td width='120'>");
        out.print("会议结束时间");
        out.print("</td>"); 
        out.print("<td width='120'>");
        out.print("预约者");
        out.print("</td>");
        out.print("<td width='120'>");
        out.print("预约状态");
        out.print("</td>");   
        out.print("</tr>");
        
        out.print("<tr class='ttitle'>");
        out.print("<td>");
        out.print(applyTime);
        out.print("</td>");
        out.print("<td>");
        out.print(r.getRoomName());
        out.print("</td>");
        out.print("<td>");
        out.print(orderDate);
        out.print("</td>");
        out.print("<td>");
        out.print(applyStartTime);
        out.print("</td>");
        out.print("<td>");
        out.print(applyEndTime);
        out.print("</td>");
        out.print("<td>");
        out.print(applier);
        out.print("</td>");
        out.print("<td>");
        if(applyStatus==1){
        out.print("预约中");
        }
        else {
        	 out.print("已取消");
        }
        out.print("</td>");
        out.print("</tr>");
        out.print("<tr>");
        out.print("<td colspan='8'>");
        out.print("<hr/>");
        out.print("</td>");
        out.print("</tr>");
        out.print("</table>");
            
    }
  
    %>
    
    </td>
  </tr>
  <tr>
    <td></td>
  </tr>
  
</table>
</body>
</html>
