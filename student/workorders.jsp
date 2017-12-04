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
		<%
			//gets student's id
			String studentID = (String)sess.getAttribute("ID");
			//query to get a particular note for the given id
			String getInfo = "Select * FROM notes WHERE ID = ?";
			   
			   java.sql.Connection con = null;
			   PreparedStatement ps = null;
			   
			   try
			{
				Class.forName("com.mysql.jdbc.Driver"); 
				con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password"); 
				
			   ps = con.prepareStatement(getInfo);
			   ps.setString(1, studentID);
			
			   //prints the information about the results of the query into a table
			   ResultSet rs=ps.executeQuery(); 
			   out.println("<table class = 'gridtable' style = 'width: 100%'>");
				out.println("<tr> <th>Work Order #</th> <th> Subject </th> <th>Note Text</th> <th> Priority </th> <th> </th> </tr>");
			   while(rs.next())
			   {
					String num = rs.getString("noteNum");
					String text = rs.getString("noteText");
					String priority = rs.getString("priority");
					String subject = rs.getString("subject");
					out.println("<tr> <td>"+num+"</td> <td>"+subject+"</td> <td>"+text+"</td> <td>"+priority+"</td><td><a href = 'workorder.jsp?workOrderID="+num+"' name = 'workOrderID' class = 'button'>View</submit></td></tr>");
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
