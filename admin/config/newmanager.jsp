<!DOCTYPE html>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<html>

<head>
    <meta charset = "utf-8">
    <title>Lakehead University Residence</title>
    <link rel="stylesheet" type="text/css" media="screen" href="../../css/stylesheet.css">
	<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet"> 
</head>

<body>

	<!--UNIVERSITY LOGO-->
	<div class = 'container nobg'>
		<center><img src = "../../css/logo.png"></img></center>
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
				<a href = "../index.jsp" class = "button">News Feed</a>
				<a href = "../applications.jsp" class = "button">Applications</a>
				<a href = "../workorders.jsp" class = "button">Work Orders</a>
				<a href = "../students.jsp" class = "button">Students</a>
				<a href = "../config/index.jsp" class = "button">Configuration</a>
				<a href = "../index.html" class = "button">Sign Out</a>
			</div>
		</div>
	</div>
	
	<div class = "container" style = "margin-top: 40px">
		<h4>Add a manager</h4>
		<form action="../../scripts/addManager.jsp">
			<div class="row">
				<div class="u-full-width">
				
				<label for="m_id">ID</label>
				<input class = "u-full-width" name = "m_id" type = "text"></input>
				<label for="fname">First Name</label>
				<input class = "u-full-width" name = "fname" type = "text"></input>
				<label for="lname">Last Name</label>
				<input class = "u-full-width" name = "lname" type = "text"></input>
				<label for="email">Email</label>
				<input class = "u-full-width" name = "email" type = "text"></input>
				<label for="password">Password</label>
				<input class = "u-full-width" name = "password" type = "password"></input>
				<input class="button-primary" value="Add room" type="submit">
				
		</form>
	</div>

	</body>
</html>
