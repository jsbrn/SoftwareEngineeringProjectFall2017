<!DOCTYPE html>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
    
<html lang = "en">
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
				<a href = "../applications.jsp" class = "button">Applications</a>
				<a href = "../workorders.jsp" class = "button">Work Orders</a>
				<a href = "../students.jsp" class = "button">Students</a>
				<a href = "index.jsp" class = "button">Configuration</a>
				<a href = "../../index.html" class = "button u-pull-right">Sign Out</a>
			</div>
		</div>
	</div>

	<div class = "container" style = "margin-top: 40px;">
		<h5>System Users</h5>
		<table class = "u-full-width">
			<tr><th>ID</th><th>First Name</th><th>Last Name</th><th>Email</th><th></th></tr>
			<tr>
				<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
   String getUsers = "SELECT * FROM managers";
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   
   try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password");  
	
   ps = con.prepareStatement(getUsers);
	
	ResultSet user = ps.executeQuery(); 
   	
   while(user.next())
   {
   	String id = user.getString("ID");
	String fname = user.getString("fname");
	String lname = user.getString("lname");
	String email = user.getString("email");
	out.println("<td>"+id+"</td><td>"+fname+"</td><td>"+lname+"</td><td>"+email+"</td><td><a href = 'deleteManager.jsp?m_id="+id+"' name = 'm_id' class = 'button'>Remove</a></td></tr>");
   }
} 
   catch (SQLException e)
{
	out.println("ERROR:"+e.getMessage());
}
finally
{
	if(ps != null)
		ps.close();
	
	if(con != null)
		con.close();
}
%>
			</tr>
		</table>
		<a href = 'newmanager.jsp' class = "button">Add User</a>
	</div>
	
</body>
</html>
