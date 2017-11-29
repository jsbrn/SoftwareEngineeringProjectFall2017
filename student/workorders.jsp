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

	<!--NAVIGATION BAR-->
	<div class = "container" style = "padding: 20px 40px 20px 40px">
		<div class = "row">
			<div class = "six columns">
				<% HttpSession sess = request.getSession(); out.println("<h5>Signed in as "+(String)sess.getAttribute("name")+"</h2>"); %>
			</div>
			<div class = "u-pull-right">
				<h5>Student</h5>
			</div>
		</div>
		<div class = "row">
			<div class = "twelve columns u-pull-right">
				<a href = "index.jsp" class = "button">News Feed</a>
				<a href = "applications.jsp" class = "button">Your Application</a>
				<a href = "workorders.jsp" class = "button">Your Work Orders</a>
				<a href = "../index.html" class = "button">Sign out</a>
			</div>
		</div>
	</div>

	<div class = "container" style = "margin-top: 40px;">
		<h4>Your Work Orders</h4>
		<table class = 'u-full-width'>
			<tr><td><b>Subject</b></td><td><b>Priority</b></td><td><b>Status</b></td><td></td></tr>
			<tr>
				<td>Please help me [example work order]</td><td>High</td><td>Unresolved</td>
				<td>
					<button class = 'button'>View</button>
					<button class = 'button'>Cancel</button>
				</td>
			</tr>
		</table>
		<a href = "newworkorder.html" class = "button">Submit new work order</a>
	</div>

</body>
</html>
