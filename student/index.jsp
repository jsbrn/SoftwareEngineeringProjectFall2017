<!DOCTYPE html>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
< jsp:include page ="studentNavBar.jsp" />
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

	
	<div class = "container" style = "margin-top: 40px; padding-bottom: 0px;">
		<h4>News Feed</h4>
		<!--conversation-->
		<table class = "u-full-width">
			<!--GENERATE THE NEWS FEED ENTRIES-->
			<%
			   String getMessages = "SELECT messageText, author, timeSent FROM messages WHERE workOrderID IS NULL ORDER BY timeSent DESC";
			   
			   java.sql.Connection con = null;
			   PreparedStatement ps = null;
			   
			   try
			{
				Class.forName("com.mysql.jdbc.Driver"); 
				con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password");  
				
			   ps = con.prepareStatement(getMessages);
				
				ResultSet messages = ps.executeQuery(); 
				
				int size = 0;
			   while(messages.next())
			   {
					String text = messages.getString("messageText");
					String author = messages.getString("author");
					String time = messages.getString("timeSent");
					out.println("<tr><td><img src = '../css/admin.png'></img></td>");
					out.println("<td><p>"+text+"<br><i>Posted by <b>"+author+"</b> at "+time+"</i></p></td>");
					out.println("</tr>");
					size++;
			   }
			   if (size == 0) out.println("Nothing to see here.");
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
		</table>
	</div>
	</div>

</body>
    
</html>
