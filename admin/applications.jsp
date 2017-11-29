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
	<h2>Student Applications</h2>
	</center>

	<div class = "detail-card">
		
		<form action = "../scripts/reviewApplication.jsp">
			Select application to review:<select name = "appID">
			<%
				String getApplications = "SELECT applicationNum FROM applications WHERE currentStatus = 'pending'";
               java.sql.Connection con = null;
				PreparedStatement getApps = null;
			
		try{
			
               Class.forName("com.mysql.jdbc.Driver"); 
	       con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password");
			getApps = con.prepareStatement(getApplications);
			
			ResultSet rs=getApps.executeQuery(); 
		   
		   while(rs.next())
		   {
				String ID = rs.getString("applicationNum");
				out.println("<option value='"+ID+"'>"+ID+"</option>");
		   }
		} 
		   catch (SQLException e)
		{
			out.println("ERROR:"+e.getMessage());
		}
		finally
		{
			if(getApps != null)
				getApps.close();
		}
		   %>
			
			</select>
			<input type="submit" name = "accept" value="Accept"/>
			<input type="submit" name = "decline" value="Decline"/>
        </form>
		
		
				<%
				   String getInfo = "Select * FROM applications WHERE currentStatus = 'pending'";
				   
				   PreparedStatement ps = null;
				   
				   try
				{
					Class.forName("com.mysql.jdbc.Driver"); 
					con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password"); 
					
				   ps = con.prepareStatement(getInfo);
					
					ResultSet rs=ps.executeQuery(); 
					
				   out.println("<table class = 'gridtable' style = 'width: 100%'>");
				   out.println("<tr> <th>Student ID</th> <th>Application #</th> <th>Requested Style</th> <th>Requested Building</th> <th>Room Number</th></tr>");
				   while(rs.next())
				   {
						String studentID = rs.getString("ID");
						String applicationNum = rs.getString("applicationNum");
						String style = rs.getString("requested_style");
						String building = rs.getString("requested_building");
						String num = rs.getString("requested_num");

						out.println("<tr> <td>"+studentID+"</td><td>"+applicationNum+"</td> <td>"+style+"</td> <td>"+building+"</td><td>"+num+"</td></tr>");
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
                   if(con!=null)
                        con.close();
					
				}
				%>
		
		
	</div>
</body>
</html>