<!DOCTYPE html>
<html lang = "en">
<head>
    <meta charset = "utf-8">
    <title>Main</title>
    <link rel="stylesheet" type="text/css" media="screen" href="stylesheet.css">
	<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet"> 
</head>
<body>
    
    <center><h2>Student Portal</h2></center>
    
	<div class = "login-card">
	<%
	   HttpSession sess = request.getSession();
	   out.println("Resident Options");
	   if(sess.getAttribute("studentType").equals("yes"))
	   {
			out.println("<a href='enterWorkOrder.html'>Submit Work order</a><br>");
	   }
	   else
	   {
			out.println("<a href='enterApplicationInfo.jsp'>Register</a><br><a href='viewApplications.jsp'>View Applications</a><br>");
	   }
	   %>
		<a href="search.html">Search</a><br>
		<a href="index.html">Log Out</a>
    </div>
</body>
    
</html>