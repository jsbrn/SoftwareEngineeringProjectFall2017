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

	<div class = "container" style = "margin-top: 40px;">
		<h4>Registered Students</h4>
		<%
				String studentID = (String)sess.getAttribute("ID");
			   String getInfo = "Select * FROM students WHERE s_id = ?";
			   
			   java.sql.Connection con = null;
			   PreparedStatement ps = null;
			   
			   try
			{
				Class.forName("com.mysql.jdbc.Driver"); 
				con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password"); 
				
			   ps = con.prepareStatement(getInfo);
			   ps.setString(1, studentID);
				
				ResultSet rs=ps.executeQuery(); 
				
			   out.println("<table class = 'gridtable' style = 'width: 100%'>");
				out.println("<tr> <th>Work Order #</th> <th> Subject </th> <th>Note Text</th> <th> Priority </th> <th> </th> </tr>");
			   while(rs.next())
			   {
					String num = rs.getString("email");
					String text = rs.getString("noteText");
					String priority = rs.getString("priority");
					String subject = rs.getString("subject");
					//out.println("<tr> <td>"+num+"</td> <td>"+subject+"</td> <td>"+text+"</td> <td>"+priority+"</td><td><a href = 'workorder.jsp' name = 'workOrderID' value = '"+num+"' class = 'button'>View</a></td></tr>");
					out.println(num);
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
		<a href = "newworkorder.jsp" class = "button">Submit new work order</a>
	</div>
	
</body>
</html>
