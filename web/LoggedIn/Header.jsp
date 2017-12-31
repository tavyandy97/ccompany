<%-- 
    Document   : Header
    Created on : 6 Jul, 2017, 4:28:42 PM
    Author     : tavya
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import = "java.util.*" errorPage=""%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
	<title>CCompany</title>
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.css">
	<link rel="stylesheet" type="text/css" href="../css/custom-logged.css">
	<link rel="icon" href="img/logo.png">
	<script src="../js/respond.js"></script>

	
</head>
<body>
	<!-- The Navbar Section Starts -->
	<nav class="navbar navbar-inverse navbar-fixed-top" id="navigation"> 
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand">
				    <div id="ham-box" class="open">
					    <span></span><br>
					    <span></span><br>
					    <span></span><br>
				    </div>
				</a>
				<a class="navbar-brand" href="#"><span class="logo"><img src="../img/logo.png" width="40" height="30">Company</span></a>
			</div>
		    <ul class="nav navbar-nav navbar-right">

			<li class="dropdown hidden-xs">
			  <a class="dropdown-toggle" data-toggle="dropdown" href="#"><img src="EmployeesImages/Img<%=session.getAttribute("LoggedEmpId")%>.jpg" class="img-circle" height="39px" onerror="if (this.src != 'ProfileImg.jpg') this.src = 'EmployeesImages/ProfileImg.jpg';"> Welcome ${sessionScope.LoggedEmpName} <span class="caret"></span></a>
		          <ul class="dropdown-menu">
			    <li><a href="UploadImage.jsp"><span class="glyphicon glyphicon-picture"></span> Change Picture</a></li>
		            <li class="divider"></li>
<!--			    <li><a href="ChangeDetails.jsp"><span class="glyphicon glyphicon-wrench"></span> Edit Details</a></li>
		            <li class="divider"></li>-->
		            <li><a href="ChangePassword.jsp"><span class="glyphicon glyphicon-option-horizontal"></span> Change Password</a></li>
		            <li class="divider"></li>
		            <li><a href="../EmpServlet?logout=y"><span class="glyphicon glyphicon-log-out"></span> Sign Out</a></li>
		          </ul>
			</li>
		    </ul>
   		</div>
	</nav>
	<!-- The Navbar Section is over-->
	<!-- The SideBar Section starts-->
	<div id="sidebar">
		<ul>
		    <li><a href="Tasks.jsp" id='link1' onclick='return samePage("link1")'><span class="glyphicon glyphicon-th-list"></span> <span class="hidden-xs">Tasks</span></a></li>
			<li><a href="AddTask.jsp" id='link2' onclick='return samePage("link2")'><span class="glyphicon glyphicon-plus-sign"></span> <span class="glyphicon glyphicon-tags"></span> <span class="hidden-xs">Add a Task</span></a></li>
			<li><a href="AddEmp.jsp" id="link3" onclick="return samePage('link3')"><span class="glyphicon glyphicon-plus-sign"></span> <span class="glyphicon glyphicon-user"></span> <span class="hidden-xs">Add Employee</span></a></li>
			<li><a href="EmpAdded.jsp" id="link4" onclick="return samePage('link4')"><span class="glyphicon glyphicon-user"></span> <span class="hidden-xs">Employees Added by You</span></a></li>
			<li><a href="ClosedTasks.jsp" id='link5' onclick='return samePage("link5")'><span class="glyphicon glyphicon-ok"></span> <span class="hidden-xs">Closed Tasks</span></a></li>
			<!--<li><a href="#"><span class="glyphicon glyphicon-credit-card"></span> <span class="hidden-xs">Report</span></a></li>-->
		</ul>
	</div>
		<div class="container">