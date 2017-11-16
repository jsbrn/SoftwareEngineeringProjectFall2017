<!DOCTYPE html>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<html lang = "en">
<head>
    <meta charset = "utf-8">
    <title>Lakehead University Residence</title>
    <link rel="stylesheet" type="text/css" media="screen" href="stylesheet.css">
	<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet"> 
</head>

	<body>
	
	<center><h2>Apply to Residence</h2></center>

	<div class = "login-card">
		<form action="createApplication.jsp" method="post">

		Room Number: <input style = "width: 98%" type="text" name="roomNum" /><br><br>
		Building Name: <input type = "text" style = "width: 98%" name = "building"/><br><br>
		Room Style: <select style = "width: 100%" name = "style"><br><br>
			<%
				String getStyles = "SELECT roomStyle FROM style";
				java.sql.Connection con = null;
				PreparedStatement ps = null;
			
		try{
			   Class.forName("com.mysql.jdbc.Driver"); 
			   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/residencedatabase","root","Pointe2006"); 
			
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

		<center><input style = "width: 100%" type="submit" /></center>

		</form>
	</div>
		

	</body>

</html>