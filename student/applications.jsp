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

	<!--NAVIGATION BAR-->
	<div class = "container" style = "padding: 20px 40px 20px 40px">
		<div class = "row">
			<div class = "six columns">
				<% HttpSession sess = request.getSession(); out.println("<h5>Signed in as "+(String)sess.getAttribute("name")+"</h2>"); %>
			</div>
			<div class = "u-pull-right">
				<h5>Student</h5>
			</div>
		</div>
		<div class = "row">
			<div class = "twelve columns u-pull-right">
				<a href = "index.jsp" class = "button">News Feed</a>
				<a href = "applications.jsp" class = "button">Your Application</a>
				<a href = "workorders.jsp" class = "button">Your Work Orders</a>
				<a href = "../index.html" class = "button">Sign out</a>
			</div>
		</div>
	</div>

	<div class = "container" style = "margin-top: 40px;">
		<h4>Your Applications</h4>
		<%
		   String ID = (String)sess.getAttribute("ID");
		   String getInfo = "Select applicationNum, ID, currentStatus FROM applications WHERE ID = ?";
		   
		   java.sql.Connection con = null;
		   PreparedStatement ps = null;
		   
		   try
		{
			Class.forName("com.mysql.jdbc.Driver"); 
			con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password"); 
			
		   ps = con.prepareStatement(getInfo);
		   ps.setString(1, ID);
			
			ResultSet rs=ps.executeQuery(); 
			
		   out.println("<table class = 'u-full-width'>");
           out.println("<tr> <th>Application #</th> <th>Status</th> <th></th></tr>");
		   while(rs.next())
		   {
                String ID = rs.getString("ID");
				String applicationNum = rs.getString("applicationNum");
				String status = rs.getString("currentStatus");

				out.println("<tr> <td>"+applicationNum+"</td> <td>"+status+"</td> <a href = "application.jsp?ID=ID" class = 'button'>View</a> </tr>");
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
		
		<a href = "newapplication.jsp" class = "button">Submit new application</a>

	</div>

</body>
</html>
