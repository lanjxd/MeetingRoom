<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>欢迎使用会议室预订系统！</title>
	<link rel="stylesheet" href="../css/basis.css" />
</head>

<body class="login" onselectstart="return false">
	<p class="t1">会议室预定系统</p>
	<p class="t2">Meeting Room Reservation System</p>
	<table>
		<tr><td>
        	<form method="post" action="dealLogin.jsp" name="loginForm">
            	<p>
            		<label for="u_id">工号&nbsp;</label>
            		<input type="text" id="u_id" name="u_id" style="width:200px; height:30px;"/>
            	</p>
            	<p>
            		<label for="u_pwd">密码&nbsp;</label>
            		<input id="u_pwd" name="u_pwd" type="password" style="width:200px; height:30px;"/>
            	</p>
            	<p>
            		<input type="submit" value="登录" style="width:100px; height:30px;"/>
            	</p>
        	</form>
		</td></tr>
	</table>
</body>
</html>
