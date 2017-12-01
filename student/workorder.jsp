<!DOCTYPE html>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ include file="studentNavBar.jsp" %>

<html lang = "en">
<head>
    <meta charset = "utf-8">
    <title>Lakehead University Residence</title>
    <link rel="stylesheet" type="text/css" media="screen" href="../css/stylesheet.css">
	<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet"> 
</head>
<body>


	<div class = "container" style = "margin-top: 40px;">
		<h4>Work Order Details</h4>
		<p>
		<b>Subject:</b> Please help me :(<br>
		<b>ID:</b> 34534675<br>
		<b>Description:</b> my sink broke what else is there to say</p>
		<a class = "button">Mark as resolved</a>
	</div>
	
	<div class = "container" style = "margin-top: 40px; padding-bottom: 10px;">
		<h4>Conversation</h4>
		<!--conversation-->
		<table class = "u-full-width">
			<tr><td><img src = "../css/you.png"></img></td><td><p><b>[person 1]</b>: Can you please hurry?</p></td></tr>
			<tr><td><img src = "../css/admin.png"></img></td><td><p><b>[person 1]</b>: Your sink will be fixed by Saturday.</p></td></tr>
			<tr><td><img src = "../css/you.png"></img></td><td><p><b>[person 1]</b>: I'm having a huge party in my dorm on Friday I can't have a broken sink.</p></td></tr>
			<tr><td><img src = "../css/admin.png"></img></td><td><p><b>[person 1]</b>: Very sorry, sir or madame, but we cannot fix your sink that early.</p></td></tr>
		</table>
		<!--submit new message-->
		<form action="../scripts/submitWorkOrder.jsp">
			<div class="row">
				<div class="u-full-width">
					<label for="msg">Send a message...</label>
					<textarea class="u-full-width" placeholder="Enter your message..." id="msg" name="msg"></textarea>
					<input class="button-primary" value="Send message" type="submit">
				</div>
			</div>
		</form>
	</div>

</body>
</html>
