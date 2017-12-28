<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会议室预订系统</title>
<link rel="stylesheet" href="../css/basis.css" />

<script language="javascript" type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>

</head>

<body>

<%

	User u = new User();
	u = (User)session.getAttribute("currentUser");
	String userid = u.getUserid();
	String username = u.getUsername();
	String userposition = u.getUserposition();	
	String usermail = u.getUsermail();
	String userpwd = u.getUserpwd();
	
%>

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
        <li><a href="userLimitedMmt.jsp"><b>用户信息修改</b></a></li>
        
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
    	<p><b>用户基本信息修改</b></p>
    	<form method='post' action='dealUserUpdate.jsp'>     
       		<table border="0" align="center">
        		<tr class='todd'>
          			<td class="ttitle" width='150'>员工号</td>
          			<td width='300'><input type="text" name="userid" id="userid" value="<%=userid %>" readonly="readonly"/></td>
        		</tr>
        		<tr class='teven'>
          			<td class="ttitle">姓名</td>
          			<td><input type="text" name="username" id="username" value="<%=username %>" readonly="readonly"/></td>
        		</tr>
        		<tr class='todd'>
          			<td class="ttitle">职位</td>
          			<td><input type="text" name="userposition" id="userposition" value="<%=userposition %>" readonly="readonly"/></td>
        		</tr>
        		<tr class='teven'>
          			<td class="ttitle">邮箱</td>
          			<td><input type="text" name="usermail" id="usermail" value="<%=usermail %>"/></td>
        		</tr>
        		<tr class='todd'>
          			<td class="ttitle">密码</td>
          			<td><input type="password" name="userpwd" id="userpwd" value="<%=userpwd %>"/></td>
        		</tr>
        		<tr class='teven'>
          			<td colspan="2"><input type="submit" value="提交修改"/></td>
        		</tr>
      		</table>
    	</form>
    </td>
  </tr>
</table>
</body>
</html>
