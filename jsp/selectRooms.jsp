<!DOCTYPE html>
<html lang = "en">
<head>
    <meta charset = "utf-8">
    <title>Lakehead University Residence</title>
    <link rel="stylesheet" type="text/css" media="screen" href="../css/stylesheet.css">
	<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet"> 
</head>
<body>

	<center><h2>View Rooms</h2><br></center>

	<div class = "login-card">
    <form action = "viewRooms.jsp">
				Choose a room type: <select name = "style">
				<%@ page import ="java.sql.*" %>
		<%@ page import ="javax.sql.*" %>
			<%
				String getStyles = "SELECT roomStyle FROM style";
				java.sql.Connection con = null;
				PreparedStatement ps = null;
			
		try{
			   Class.forName("com.mysql.jdbc.Driver"); 
			   con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password");  
			
			ps = con.prepareStatement(getStyles);
			
			ResultSet rs=ps.executeQuery(); 
		   
		   while(rs.next())
		   {
				String style = rs.getString("roomStyle");
				out.println("<option value='"+style+"'>"+style+"</option>");
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
			</select><br><br>
		<input style = "width: 100%" type="submit" />
	</form>
    </div>

    
</body>
    
</html>