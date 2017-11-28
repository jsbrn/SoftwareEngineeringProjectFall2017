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

	<center>
	<br><div class = "login-card"><img src = "../css/logo.png"></img></div><br><br><br>
	<h2>View Rooms</h2></center>

	<div class = "detail-card">

		<%
		   String type = request.getParameter("style");
		   String getInfo = "Select roomNum, building, resident_id FROM rooms WHERE roomStyle = ?";
		   
		   java.sql.Connection con = null;
		   PreparedStatement ps = null;
		   
		   try
		{
			Class.forName("com.mysql.jdbc.Driver"); 
			con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password");  
			
		   ps = con.prepareStatement(getInfo);
		   ps.setString(1, type);
			
			ResultSet rs=ps.executeQuery(); 
		   
		   out.println("<table class = 'gridtable' style = 'width: 100%'>");
		   out.println("<tr> <th>Building</th> <th>Room Number</th> <th>Resident ID</th></tr>");
		   
		   while(rs.next())
		   {
				String roomNum = rs.getString("roomNum");
				String building = rs.getString("building");
				String student = rs.getString("resident_id");
				out.println("<tr> <td>"+building+"</td><td>"+roomNum+"</td> <td>"+student+"</td> </tr>");
		   }
		   out.println("</table>");
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
		</div>
	</body>
</html>