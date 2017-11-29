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
				<a href = "applications.jsp" class = "button">Applications</a>
				<a href = "workorders.jsp" class = "button">Work Orders</a>
				<a href = "config/index.jsp" class = "button">Configuration</a>
				<a href = "../index.html" class = "button u-pull-right">Sign Out</a>
			</div>
		</div>
	</div>
	
	<div class = "container" style = "margin-top: 40px; padding-bottom: 0px;">
		<h4>News Feed</h4>
		<!--conversation-->
		<table class = "u-full-width">
			<tr>
				<td><img src = "../css/admin.png"></img></td>
				<td>
					<p>
						<b>[NEWS FEED ENTRY TITLE]</b> - <i>[timestamp]</i><br>
						There will be scheduled maintenance. It's just the wei things go.
					</p>
				</td>
				<td>
					<button class = "button">Delete</button>
				</td>
			</tr>
		</table>
		<!--submit new news feed item-->
		<form>
			<div class="row">
				<div class="u-full-width">
					<label for="msg">Post a news feed entry...</label>
					<textarea class="u-full-width" placeholder="Enter your message..." id="msg" name="msg"></textarea>
					<input class="button-primary" value="Post new entry" type="submit">
				</div>
			</div>
		</form>
	</div>
	
</body>
    
</html>
