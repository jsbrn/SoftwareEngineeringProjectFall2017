<!DOCTYPE html>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
    
<html lang = "en">
<head>
    <meta charset = "utf-8">
    <title>Lakehead University Residence</title>
    <link rel="stylesheet" type="text/css" media="screen" href="../css/stylesheet.css">
	<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet"> 
</head>
<body>

	<!--UNIVERSITY LOGO-->
	<div class = 'container nobg'>
		<center><img src = "../css/logo.png"></img></center>
	</div>

	<!--MANAGER NAVIGATION BAR-->
	<div class = "container" style = "padding: 20px 40px 20px 40px">
		<div class = "row">
			<div class = "six columns">
				<% HttpSession sess = request.getSession(); out.println("<h5>Signed in as "+(String)sess.getAttribute("name")+"</h2>"); %>
			</div>
			<div class = "u-pull-right">
				<h5>Admin</h5>
			</div>
		</div>
		<div class = "row">
			<div class = "twelve columns u-pull-right">
				<a href = "applications.jsp" class = "button">Applications</a>
				<a href = "workorders.jsp" class = "button">Work Orders</a>
				<a href = "students.jsp" class = "button">Students</a>
				<a href = "config/index.jsp" class = "button">Configuration</a>
				<a href = "../index.html" class = "button u-pull-right">Sign Out</a>
			</div>
		</div>
	</div>

	<div class = "container" style = "margin-top: 40px;">
		<h5>Student Details</h5>
		<b>ID: </b>4534904<br>
		<b>Name: </b>Billy Joel<br>
		<a href = "" class = "button button-primary">Evict</a>
		<a href = "" class = "button">Move to... [will be a proper form soon]</a>
	</div>
	
</body>
</html>
