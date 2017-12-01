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
		<h4>Your Work Orders</h4>
		<table class = 'u-full-width'>
			<tr><td><b>Subject</b></td><td><b>Priority</b></td><td><b>Status</b></td><td></td></tr>
			<tr>
				<td>Please help me [example work order]</td><td>High</td><td>Unresolved</td>
				<td><a href = "" class = 'button'>View</a></td>
			</tr>
		</table>
		<a href = "newworkorder.jsp" class = "button">Submit new work order</a>
	</div>

</body>
</html>

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>		

<%
        String studentID = (String)sess.getAttribute("ID");
		   String getInfo = "Select * FROM notes WHERE ID = ?";
		   
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
			out.println("<tr> <th>Work Order #</th> <th> Subject </th> <th>Note Text</th> <th> Priority </th> </tr>");
		   while(rs.next())
		   {
				String num = rs.getString("noteNum");
				String text = rs.getString("noteText");
				String priority = rs.getString("priority");
				String subject = rs.getString("subject");
				out.println("<tr> <td>"+num+"</td> <td>"+subject+"</td> <td>"+text+"</td> <td>"+priority+"</td></tr>");
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
