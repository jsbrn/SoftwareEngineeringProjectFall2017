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
		<h4>Building Details</h4>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
   String bName = request.getParameter("buildingName");
   String getBuildings = "SELECT * FROM buildings WHERE building_name = ?";
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   
   try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password");  
	
   ps = con.prepareStatement(getBuildings);
   ps.setString(1, bName);
	
	ResultSet building = ps.executeQuery(); 
   	
   while(building.next())
   {
        String name = building.getString("building_name");
	String type = building.getString("quietBuilding");
        out.println("<b>Name: "+name+"</b><br>");
	out.println("<b>Quiet building:"+type+" </b><br>");
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
	
}
%>
	</div>
	
	<div class = "container" style = "margin-top: 40px;">
		<a href = 'newroom.jsp' class = 'button'>Add New Room</a>
		<h5>Rooms</h5>
		<table class = "u-full-width">
		<th> <tr> Room ID </tr> <tr> Room # </tr> <tr> Building </tr> <tr> Style </tr> </th>
			<%
   String getRooms = "SELECT * FROM rooms WHERE building = ?";
   
   PreparedStatement fr = null;
   
   try
{
	
   fr = con.prepareStatement(getRooms);
   fr.setString(1, bName);
	
	ResultSet rooms = fr.executeQuery(); 
   
   while(rooms.next())
   {
        int roomNum = rooms.getInt("roomNum");
	String building = rooms.getString("building");
	String style = rooms.getString("roomStyle");
	int id = rooms.getInt("roomID");
        out.println("<tr> <td>"+id+"</td><td>"+roomNum+"</td><td>"+building+"</td><td>"+style+"</td><td><a href = '../../scripts/deleteRoom.jsp?buildingName="+building+"&roomID="+id+"' name = 'roomID' class = 'button'>X</a></td></tr>");
   }
   
} 
   catch (SQLException e)
{
	out.println("ERROR:"+e.getMessage());
}
finally
{
	if(fr != null)
		ps.close();
	
	if(con != null)
		con.close();
}
%>
		</table>
	</div>
	
</body>
</html>
