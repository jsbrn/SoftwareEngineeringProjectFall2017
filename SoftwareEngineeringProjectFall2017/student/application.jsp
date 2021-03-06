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
		<h4>Application Details</h4>
		<%
           String ID = request.getParameter("ID");
		   String getInfo = "Select * FROM applications WHERE ID = ?";
		   
		   java.sql.Connection con = null;
		   PreparedStatement ps = null;
		   
		   try
		{
			Class.forName("com.mysql.jdbc.Driver"); 
			con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password"); 
			
		   ps = con.prepareStatement(getInfo);
		   ps.setString(1, ID);
			
			ResultSet rs=ps.executeQuery(); 
			
           rs.next();
           String applicationNum = rs.getString("applicationNum");
           String requested_style = rs.getString("requested_style");
           String currentStatus = rs.getString("currentStatus");
           
           out.println("<p><b>Application Number:</b>"+applicationNum+"<br><b>ID: </b>"+ID+"<b>Requested Style:</b>"+requested_style+"<br><b>Current Status:</b>"+currentStatus+"</p></a>");
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
		
		<a href = "applications.jsp" class = "button">Back</a>

	</div>

</body>
</html>
