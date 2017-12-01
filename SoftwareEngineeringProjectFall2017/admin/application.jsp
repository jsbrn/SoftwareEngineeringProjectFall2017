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
				<a href = "applications.jsp" class = "button">Applications</a>
				<a href = "workorders.jsp" class = "button">Work Orders</a>
				<a href = "students.jsp" class = "button">Students</a>
				<a href = "config/index.jsp" class = "button">Configuration</a>
				<a href = "../index.html" class = "button u-pull-right">Sign Out</a>
			</div>
		</div>
	</div>
</body>
</html>		

<%

           String appNum = request.getParameter("num");
		   String getInfo = "Select * FROM applications WHERE applicationNum = ?";
		   
		   java.sql.Connection con = null;
		   PreparedStatement ps = null;
		   
		   try
		{
			Class.forName("com.mysql.jdbc.Driver"); 
			con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password"); 
			
		   ps = con.prepareStatement(getInfo);
            ps.setString(1, appNum);
			
			ResultSet rs=ps.executeQuery(); 
   
            rs.next();
                int num = rs.getInt("applicationNum");
				String ID = rs.getString("ID");
				String style = rs.getString("requested_style");
				String building = rs.getString("quiet_house");
                String status = rs.getString("currentStatus");
                
   
   out.println("<div class = 'container' style = 'margin-top: 40px;'>");
                out.println("<p><b> Application #: </b>"+num+"<br><b> Student ID:  </b>"+ID+"<b> Requested Style: </b>"+style+"<br><b> Building: </b>"+building+"<b> Current Status: </b>"+status+"</p></a>");
   
   out.println("</table></div>");
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
