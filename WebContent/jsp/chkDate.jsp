<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="sql.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会议室预订</title>
<link rel="stylesheet" href="../css/basis.css" />

<%
	
	User u = new User();
	u = (User)session.getAttribute("currentUser");
	String userposition = u.getUserposition();
	String username = u.getUsername();
	
%>

<script language="javascript" type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>

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

    <td width='800' align="center" valign="top">
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
  	<td></td>
  </tr>
</table>
</body>
</html>
