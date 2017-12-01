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
				<a href = "index.jsp" class = "button">News Feed</a>
				<a href = "applications.jsp" class = "button">Applications</a>
				<a href = "workorders.jsp" class = "button">Work Orders</a>
				<a href = "students.jsp" class = "button">Students</a>
				<a href = "config/index.jsp" class = "button">Configuration</a>
				<a href = "../index.html" class = "button">Sign Out</a>
			</div>
		</div>
	</div>

	<div class = "container" style = "margin-top: 40px;">
		<h4>Work Orders</h4>
		<%
           int noteNum = Integer.parseInt(request.getParameter("workOrderID"));
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
           
       out.println("<p><b>Work Order Number:</b>"+noteNum+"<br><b>Student ID: </b>"+ID+"<br><b>Message: </b>"+noteText+"<br><b>Priority:</b>"+priority+"<br><b>Subject: </b>"+subject+"<br><b>Status: </b>"+status+"<br></p></a>");
		out.println("<a href = 'workorder.jsp?workOrderID="+noteNum+"&admin=true' class = 'button'>Mark as resolved</a>");
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
            <% String workOrderID = request.getParameter("num");%>
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
		   String getMessages = "SELECT messageText, author, timeSent  FROM messages WHERE workOrderID = ?  ORDER BY timeSent DESC";
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
