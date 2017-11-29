<!DOCTYPE html>
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
				<a href = "" class = "button">Building Directory</a>
				<a href = "applications.jsp" class = "button">Student Applications</a>
				<a href = "workorders.jsp" class = "button">Work Orders</a>
				<a href = "../index.html" class = "button">Sign Out</a>
			</div>
		</div>
	</div>
	
	<div class = "container" style = "margin-top: 40px;">
		<h4>News Feed</h4>
	</div>
	
</body>
    
</html>