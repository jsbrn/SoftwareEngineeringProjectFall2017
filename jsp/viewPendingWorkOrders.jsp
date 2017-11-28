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
	<h2>Work Orders</h2>
	</center>
	
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
				<a href = "student.jsp" class = "button">News Feed</a>
				<a href = "viewApplications.jsp" class = "button">Your Application</a>
				<a href = "viewPendingWorkOrders.jsp" class = "button">Your Work Orders</a>
				<a href = "../index.html" class = "button">Sign out</a>
			</div>
		</div>
	</div>

	<div class = "detail-card">
		<%
		   String getInfo = "Select * FROM notes";
		   
		   java.sql.Connection con = null;
		   PreparedStatement ps = null;
		   
		   try
		{
			Class.forName("com.mysql.jdbc.Driver"); 
			con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password"); 
			
		   ps = con.prepareStatement(getInfo);
			
			ResultSet rs=ps.executeQuery(); 
			
		   out.println("<table class = 'gridtable' style = 'width: 100%'>");
			out.println("<tr> <th>Note #</th> <th>Student ID</th> <th>Note Text</th></tr>");
		   while(rs.next())
		   {
				String num = rs.getString("noteNum");
				String studentID = rs.getString("ID");
				String text = rs.getString("noteText");

				out.println("<tr> <td>"+num+"</td><td>"+studentID+"</td> <td>"+text+"</td></tr>");
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
