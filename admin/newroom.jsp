<!DOCTYPE html>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<html>

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
				<a href = "students.jsp" class = "button">Students</a>
				<a href = "config/index.jsp" class = "button">Configuration</a>
				<a href = "../index.html" class = "button u-pull-right">Sign Out</a>
			</div>
		</div>
	</div>
	
	<div class = "container" style = "margin-top: 40px">
		<h4>Add a room</h4>
		<form action="../scripts/addRoom.jsp">
			<div class="row">
				<div class="u-full-width">
				
				<label for="building">Building</label>
				<select  class = "u-full-width" name = "building">
					<%
						String getBuildings = "SELECT building_name FROM buildings";
						java.sql.Connection con = null;
						PreparedStatement ps = null;
							
						try{
							   Class.forName("com.mysql.jdbc.Driver"); 
							   con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password"); 
							
							ps = con.prepareStatement(getBuildings);
							
							ResultSet rs=ps.executeQuery(); 
						   
						   while(rs.next())
						   {
								String name = rs.getString("building_name");
								out.println("<option value='"+name+"'>"+name+"</option>");
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
				</select>
				
				<label for="style">Room Type</label>
				<select  class = "u-full-width" name = "style">
							<%
								String getStyles = "SELECT roomStyle FROM style";
								con = null;
								ps = null;
							
						try{
							   Class.forName("com.mysql.jdbc.Driver"); 
							   con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password"); 
							
							ps = con.prepareStatement(getStyles);
							
							ResultSet rs=ps.executeQuery(); 
						   
						   while(rs.next())
						   {
								String style = rs.getString("roomStyle");
								out.println("<option value='"+style+"'>"+style+"</option>");
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
				</select>
				
				<label for="roomnumber">Room Type</label>
				<input class = "u-full-width" name = "roomnumber" type = "text"></input>
				<input class="button-primary" value="Add room" type="submit">
				
		</form>
	</div>

	</body>
</html>