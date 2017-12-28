<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="sql.*" %>
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
	String userposition = u.getUserposition();
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
    <td colspan="2" >
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
        <li><a href='orderHistory.jsp'>用户预订历史</a></li>
        <li><a href='roomMmt.jsp'><b>会议室管理</b></a></li>
        <li><a href='userSrch.jsp'>用户管理</a></li>
        <li><a href='userCreate.jsp'>新建用户</a></li>
    </ul>
	</div>
    </td>
    <td align="center" valign="top">
     <form id="roomInfoUpdate" name="roomInfoUpdate" method="post" action="dealRoomUpdate.jsp">    
      <p><b>会议室信息</b></p>    
      <table border="0" align="center">
        <tr class='todd'>
          <td class="ttitle" width='150'>会议室</td>
          <td width='300'>
            <select name="selectedRoom" id="selectedRoom">
            <option value='1'>会议室201</option>
            	<option value='2'>会议室202</option>
            	<option value='3'>会议室203(大)</option>
            	<option value='4'>会议室301</option>
            	<option value='5'>会议室302</option>
            	<option value='6'>会议室303(大)</option>
            	<option value='7'>会议室401</option>
            	<option value='8'>会议室402</option>
            	<option value='9'>会议室501(大)</option>
            	<option value='10'>会议室502(大)</option>    
            </select></td>
        </tr>
        <tr class='teven'>
          <td class="ttitle">会议室起用时间</td>
          <td><input name="startTime" type="text" onclick="WdatePicker({dateFmt:'H:mm'})"/></td>
        </tr>
        <tr class='todd'>
          <td class="ttitle">会议室停用时间</td>
          <td><input name="endTime" type="text" onclick="WdatePicker({dateFmt:'H:mm'})"/></td>
        </tr>
        <tr class='teven'>
          <td class="ttitle">会议室预订权限</td>
          <td>
             <select name="authority" id="authority">
            	<option value='employee'>员工级</option>
                <option value='manager'>经理级</option>
             </select>
          </td>
        </tr>
        <tr class='todd'>
          <td colspan="2">
          <input type="submit" value="提交修改"/>
          </td>
        </tr>
      </table>
    </form>
    </td>
  </tr>
</table>
</body>
</html>
