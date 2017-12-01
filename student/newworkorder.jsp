<%@ include file="studentNavBar.jsp" %>
<!DOCTYPE html>
<html lang = "en">
<head>
    <meta charset = "utf-8">
    <title>Lakehead University Residence</title>
    <link rel="stylesheet" type="text/css" media="screen" href="../css/stylesheet.css">
	<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet"> 
</head>

<body>
	
	<!--MAIN PANEL WITH FORM-->
	<div class = "container" style = "margin-top: 40px;">
		<h4>Submit a work order</h4>
		<form action="../scripts/submitWorkOrder.jsp">
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
