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
		<h4>Work Order Details</h4>
		<p>
		<b>Subject:</b> Please help me :(<br>
		<b>ID:</b> 34534675<br>
		<b>Description:</b> my sink broke what else is there to say</p>
		<a class = "button">Mark as resolved</a>
	</div>
	
	<% String workOrderID = request.getParameter("workOrderID"); %>
	<div class = "container" style = "margin-top: 40px; padding-bottom: 10px;">
		<h4>Conversation</h4>
		<!--submit new message-->
		<form action="../scripts/postWorkOrderMessage.jsp">
			<div class="row">
				<div class="u-full-width">
					<label for="msg">Send a message...</label>
					<textarea class="u-full-width" placeholder="Enter your message..." id="msg" name="msg"></textarea>
					<% out.println("<input class='button-primary' value="+workOrderID+"name = idHolder type="submit">"); %>
				</div>
			</div>
		</form>
		
		<%
		   String getMessages = "SELECT messageText, author, timeSent  FROM messages WHERE workOrderID = ?";
		   
		   java.sql.Connection con = null;
		   PreparedStatement ps = null;
		   
		   try
		{
			Class.forName("com.mysql.jdbc.Driver"); 
			con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password");  
			
		   ps = con.prepareStatement(getMessages);
		   ps.setString(1, workOrderID);
			
			ResultSet messages = ps.executeQuery(); 
			
		   while(messages.next())
		   {
				String text = messages.getString("messageText");
				String author = messages.getString("author");
				String time = messages.getString("timeSent");
				
				//input display stuff here
				out.println("<table class = 'u-full-width' name = 'idHolder' value = "+workOrderID+">");
				out.println("<tr><td></td><td><p><b>"+author+"</b>: "+text+"</p></td><td>"+time+"</td></tr>");
				out.println("</table>");
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
		
	</div>

</body>
</html>

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
