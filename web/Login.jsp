<%-- 
    Document   : Login
    Created on : 6 Jul, 2017, 3:12:03 PM
    Author     : tavya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
	<link rel="stylesheet" type="text/css" href="css/custom.css">
	<link rel="icon" href="img/logo.png">
	<script src="js/respond.js"></script>

    </head>
    <body>
	<div id="contain">
	    <div class="container">
		<h1 class="logo"><img src="img/logo.png" width="80" height="60">Company</h1>
		<form method="post" action="EmpServlet"  onsubmit="return validateLogin()">
		    <div class="input-group f-element">
			<span class="input-group-addon glyphicon glyphicon-user"></span>
			<input type="text" class="form-control" placeholder="Employee ID" id="txtEmployeeId" name="txtEmployeeId">
		    </div>
		    <div class="f-element text-danger" id="msgEmployeeID"></div>
		    <div class="input-group f-element">
			<span class="input-group-addon glyphicon glyphicon-lock"></span>
			<input type="password" class="form-control" placeholder="Password" id="pwdPassword" name="pwdPassword">
		    </div>
		    <div class="f-element text-danger" id="msgPassword"></div>
		    <a href="#" class="pull-right f-element">Forgot Password?</a>
		    <input type="submit" name="btnLogin" value="Login" class="f-element form-control btn">
		    <span	class="f-element text-danger" id="msg" name="msg"><%=request.getAttribute("flag") != null ? "Either Username or Password are wrong" : ""%></span>
		    <hr class="f-element">
		    <br>
		</form>
	    </div>
	</div>
	<script src="LatestJQuery.js"></script>
	<script>
			    function validateLogin() {
				let ret = true;
				let txt1 = document.getElementById("txtEmployeeId");
				let txt2 = document.getElementById("pwdPassword");
				document.getElementById("msgEmployeeID").innerHTML = "";
				document.getElementById("msgPassword").innerHTML = "";
				if (txt1.value.trim().length === 0) {
				    document.getElementById("msgEmployeeID").innerHTML = "Employee ID cannot be Empty !";
				    ret = false;
				}
				if (txt2.value.trim().length === 0) {
				    document.getElementById("msgPassword").innerHTML = "Password cannot be Empty !";
				    ret = false;
				}
				return ret;
			    }
	</script>
	<script src="js/bootstrap.min.js"></script>
    </body>
</html>