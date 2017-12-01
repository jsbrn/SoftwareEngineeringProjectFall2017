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
		<h4>Your Applications</h4>
		<%
		   String ID = (String)sess.getAttribute("ID");
		   String getInfo = "Select applicationNum, ID, currentStatus FROM applications WHERE ID = ?";
		   
		   java.sql.Connection con = null;
		   PreparedStatement ps = null;
		   
		   try
		{
			Class.forName("com.mysql.jdbc.Driver"); 
			con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password"); 
			
		   ps = con.prepareStatement(getInfo);
		   ps.setString(1, ID);
			
			ResultSet rs=ps.executeQuery(); 
			
		   out.println("<table class = 'u-full-width'>");
           out.println("<tr> <th>Application #</th> <th>Status</th> <th></th></tr>");
		   while(rs.next())
		   {
                String studentID = rs.getString("ID");
				String applicationNum = rs.getString("applicationNum");
				String status = rs.getString("currentStatus");
           

				out.println("<tr> <td>"+applicationNum+"</td> <td>"+status+"</td> <td><a href = 'application.jsp?ID="+studentID+"' class = 'button'>View</a> </td></tr>");
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
		
		if(sess.getAttribute("studentType").equals("no"))
			out.println("<a href = 'newapplication.jsp' class = 'button'>Submit new application</a>");
		%>
		
		

	</div>

</body>
</html>
