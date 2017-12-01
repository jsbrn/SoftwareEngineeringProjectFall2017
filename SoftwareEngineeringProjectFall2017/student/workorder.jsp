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
           int noteNum = Integer.parseInt(request.getParameter("num"));
		   String getInfo = "Select * FROM notes WHERE noteNum = ?";
		   
		   java.sql.Connection con = null;
		   PreparedStatement ps = null;
		   
		   try
		{
			Class.forName("com.mysql.jdbc.Driver"); 
			con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password"); 
			
		   ps = con.prepareStatement(getInfo);
		   ps.setInt(1, noteNum);
			
			ResultSet rs=ps.executeQuery(); 
			
           rs.next();
           String ID = rs.getString("ID");
           String noteText = rs.getString("noteText");
           String priority = rs.getString("priority");
           String subject = rs.getString("subject");
           String status = rs.getString("status");
           
           out.println("<div class = 'container' style = 'margin-top: 40px;'>");
       out.println("<p><b>Work Order Number:</b>"+noteNum+"<br><b>Student ID: </b>"+ID+"<br><b>Message: </b>"+noteText+"<br><b>Priority:</b>"+priority+"<br><b>Subject: </b>"+subject+"<br><b>Status: </b>"+status+"<br></p></a>");
       out.println("<b><a href = '../scripts/resolveWorkOrder.jsp?workOrderID="+noteNum+"' name = 'workOrderID' class = 'button'>Mark as resolved</a></b>");
       out.println("</div>");
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
	
	<% String workOrderID = request.getParameter("workOrderID");%>
	<div class = "container" style = "margin-top: 40px; padding-bottom: 10px;">
		<h4>Conversation</h4>
		<!--submit new message-->
		<form action="../scripts/postWorkOrderMessage.jsp">
			<div class="row">
				<div class="u-full-width">
					<label for="msg">Send a message...</label>
					<textarea class="u-full-width" placeholder="Enter your message..." id="msg" name="msg"></textarea>
					<% out.println("<input class='button-primary' name = 'idHolder' value='Send' type='submit'>");%>
				</div>
			</div>
		</form>
		
		<%
		   String getMessages = "SELECT messageText, author, timeSent  FROM messages WHERE workOrderID = ?";
		   String getWorkOrders = "SELECT * FROM notes WHERE noteNum = ?";
		   
		   
		   
		   java.sql.Connection conn = null;
		   PreparedStatement pps = null;
		   PreparedStatement orders = null;
		   
		   try
		{
			Class.forName("com.mysql.jdbc.Driver"); 
			conn = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password");  
			
		   pps = conn.prepareStatement(getMessages);
		   pps.setString(1, workOrderID);
		   
		   orders = conn.prepareStatement(getWorkOrders);
		   orders.setString(1, workOrderID);
			
			ResultSet messages = pps.executeQuery(); 
			
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
		   
		   ResultSet workOrders = orders.executeQuery();
		   
		   while(workOrders.next())
		{
			String subject = workOrders.getString("subject");
			int num = workOrders.getInt("noteNum");
			String desc = workOrders.getString("noteText");
		}
		   
		} 
		   catch (SQLException e)
		{
			out.println("ERROR:"+e.getMessage());
		}
		finally
		{
			if(pps != null)
				pps.close();
			
			if(conn != null)
				conn.close();
		}
		%>
		
	</div>

</body>
</html>

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
