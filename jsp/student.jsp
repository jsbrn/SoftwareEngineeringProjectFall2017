<!DOCTYPE html>
<html lang = "en">
<head>
    <meta charset = "utf-8">
    <title>Lakehead University Residence</title>
    <link rel="stylesheet" type="text/css" media="screen" href="../css/stylesheet.css">
	<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet"> 
</head>
<body>
    
	<%
	   HttpSession sess = request.getSession();
	   out.println("<center><br><div class = "login-card"><img src = "../css/logo.png"></img></div><br><br><br><h2>Welcome, "+(String)sess.getAttribute("name")+"!</h2></center>");
	   out.println("<div class = 'login-card'>");
	   out.println("Resident Options<br><br>");
	   if(sess.getAttribute("studentType").equals("yes"))
	   {
			out.println("<a href='../html/enterWorkOrder.html'>Submit Work order</a><br>");
	   }
	   else
	   {
			out.println("<a href='enterApplicationInfo.jsp'>Register</a><br><a href='viewApplications.jsp'>View Applications</a><br>");
	   }
	   %>
		<a href="../html/search.html">Search</a><br>
		<a href="../index.html">Log Out</a>
    </div>
</body>
    
</html>
