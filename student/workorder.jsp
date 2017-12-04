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

	<!--GET WORK ORDER DETAILS-->
	<% 
	//gets the id of the given work order
	String workOrderID = request.getParameter("workOrderID");%>

	<div class = "container" style = "margin-top: 40px;">
		<h4>Work Order Details</h4>
		<p>
	<%
		//queries for getting messages and work order information
		   String getMessages = "SELECT messageText, author, timeSent  FROM messages WHERE workOrderID = ? ORDER BY timeSent DESC";
		   String getWorkOrders = "SELECT * FROM notes WHERE noteNum = ?";
		   
		   java.sql.Connection con = null;
		   PreparedStatement pr = null;
		   PreparedStatement orders = null;
		   
		   try
		{
		Class.forName("com.mysql.jdbc.Driver"); 
		con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password");
			
		   pr = con.prepareStatement(getMessages);
		   pr.setString(1, workOrderID);
		   
		   orders = con.prepareStatement(getWorkOrders);
		   orders.setString(1, workOrderID);
		   
		   ResultSet workOrders = orders.executeQuery();
		   //gets work order information and displays it
		   workOrders.next();
			String subject = workOrders.getString("subject");
			int num = workOrders.getInt("noteNum");
			String desc = workOrders.getString("noteText");
            		String status = workOrders.getString("status");
            		String ID = workOrders.getString("ID");
            		String priority = workOrders.getString("priority");
               		out.println("<b>Student ID: </b>"+ID+"<br><b>Subject:</b> "+subject+"<br> <b>ID: </b>"+num+"<br> <b>Description: </b>"+desc+"<br><b>Status: </b>"+status+"<br><b>Priority: </b>"+priority+"</p>");
			out.println("<a href = 'workorder.jsp?workOrderID="+num+"&admin=false' class = 'button'>Mark as resolved</a>");
		} 
		   catch (SQLException e)
		{
			out.println("ERROR:"+e.getMessage());
		}
		%>
	</div>
	
	<div class = "container" style = "margin-top: 40px; padding-bottom: 10px;">
		<h4>Conversation</h4>
		<!--submit new message-->
		<form action="../scripts/postWorkOrderMessage.jsp">
			<div class="row">
				<div class="u-full-width">
					<label for="msg">Send a message...</label>
					<textarea class="u-full-width" placeholder="Enter your message..." id="msg" name="msg"></textarea>
					<% out.println("<input class='button-primary' name = 'idHolder' value='"+workOrderID+"' type='submit'>");%>
				</div>
			</div>
		</form>
		<%
					
			ResultSet messages = pr.executeQuery(); 
			//gets message information and displays in form
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
		   %>
		
	</div>

</body>
</html>

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
