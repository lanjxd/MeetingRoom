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
        <li><a href='roomMmt.jsp'>会议室管理</a></li>
        <li><a href='userSrch.jsp'>用户管理</a></li>
        <li><a href='userCreate.jsp'><b>新建用户</b></a></li>    
    </ul>
	</div>
    </td>
    <th>新员工信息</th>
  </tr>
  <tr>
    <td valign="top"><form id="form1" name="form1" method="post" action="dealCreateUser.jsp">
      <table border="0" align="center">
        <tr class='todd'>
          <td class="ttitle" width='150'>员工号 </td>
          <td width='300'><input type="text" name="userid" id="userid" /></td>
        </tr>
        <tr class='teven'>
          <td class="ttitle">姓名</td>
          <td><input type="text" name="username" id="username"/></td>
        </tr>
        <tr class='todd'>
          <td class="ttitle">职位</td>
          <td><select name="userposition" id="userposition">
            	<option value='employee'>employee</option>
                <option value='manager'>manager</option>
            </select></td>
        </tr>
        <tr class='teven'>
          <td class="ttitle">邮箱</td>
          <td><input type="text" name="usermail" id="usermail" /></td>
        </tr>
        <tr class='todd'>
          <td class="ttitle">密码</td>
          <td><input type="password" name="userpwd" id="userpwd"/></td>
        </tr>
        <tr class='teven'>
          <td colspan="2">
          <input type="submit" value="新建员工项"/>
          </td>
        </tr>
      </table>
    </form></td>
  </tr>
</table>
</body>
</html>
