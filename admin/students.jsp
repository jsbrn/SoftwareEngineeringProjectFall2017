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
				<a href = "index.jsp" class = "button">News Feed</a>
				<a href = "applications.jsp" class = "button">Applications</a>
				<a href = "workorders.jsp" class = "button">Work Orders</a>
				<a href = "students.jsp" class = "button">Students</a>
				<a href = "config/index.jsp" class = "button">Configuration</a>
				<a href = "../index.html" class = "button">Sign Out</a>
			</div>
		</div>
	</div>

	<div class = "container" style = "margin-top: 40px;">
		<h5>Registered Students</h5>
		<table class = "u-full-width">
			<tr><th>ID</th><th>First Name</th><th>Last Name</th><th>Room ID</th></tr>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
//queries information about all students
   String getStudents = "SELECT * FROM students";
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   
   try
  {
    Class.forName("com.mysql.jdbc.Driver"); 
    con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password");  
	
    ps = con.prepareStatement(getStudents);
	
    ResultSet students = ps.executeQuery(); 
    out.println("<tr>");
    //prints information into table
    while(students.next())
      {
        String id = students.getString("s_id");
        String fname = students.getString("fname");
        String lname = students.getString("lname");
	out.println("<td>"+id+"</td><td>"+fname+"</td><td>"+lname+"</td>");
	//if student has a room, put an evict button next to their name that kicks them out of their room when pressed
	if( students.getString("assigned_room").equals("yes"))
	{
		PreparedStatement roomInfo = con.prepareStatement("SELECT roomID FROM residents WHERE residentID = ?");
		roomInfo.setString(1, id);
		ResultSet residentRoom = roomInfo.executeQuery();
		while(residentRoom.next())
		{
			int currentRoom = residentRoom.getInt("roomID");
			out.println("<td>"+currentRoom+"</td><td><a href = '../scripts/evictStudent.jsp?studentID="+id+"' name = 'studentID' class = 'button'>Evict</a> </td>");
		}
	}
	else
	//otherwise put an 'assign room' button that allows admin to assign them to a room
	{
		out.println("<td> <a href = 'roomassignment.jsp?studentID="+id+"'name = 'studentID'  class = 'button u-pull-right'>Assign to a room</a></td>");
	}
	out.println("</tr>");
        
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
		</table>
	</div>
	
</body>
</html>
