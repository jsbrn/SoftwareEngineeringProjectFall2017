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
	
	<!--MAIN PANEL WITH FORM-->
	<div class = "container" style = "margin-top: 40px;">
		<h4>Submit a work order</h4>
		<form action="../scripts/submitWorkOrder.jsp>
			<div class="row">
				<div class="u-full-width">
					<label for="subject">Subject</label>
					<input class="u-full-width" placeholder="What's wrong?" id="subject" type="text" name = "subject">
					<label for="priority">Priority</label>
					<select class="u-full-width" id="priority" name="priority">
						<option>Low</option>
						<option>Normal</option>
						<option>High</option>
					</select>
					<label for="noteText">Additional Notes</label>
					<textarea class="u-full-width" placeholder="Describe the problem..." id="noteText" name="noteText"></textarea>
					<input class="button-primary" value="Submit request" type="submit">
				</div>
			</div>
		</form>
	</div>
	

</body>

</html>
