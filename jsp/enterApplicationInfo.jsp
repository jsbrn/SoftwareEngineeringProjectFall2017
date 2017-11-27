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
	
	<div class = 'container nobg'>
		<center><img src = "../css/logo.png"></img></center>
	</div>

	<div class = "container" style = "margin-top: 40px;">
		<h4>Apply to Residence</h4>
		<form action="../jsp/createWorkOrder.jsp>
			<div class="row">
				<div class="u-full-width">
				
					<label for="priority">Roommate?</label>
					<select class="u-full-width" id="priority" name="priority">
						<option>Doesn't matter.</option>
						<option>Yes, I want a roommate.</option>
						<option>No, I want to live alone.</option>
					</select>
					
					<label for="priority">Room style?</label>
					<select class="u-full-width" id="priority" name="priority">
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
					</select>
					
					<input class="button-primary" value="Apply" type="submit">
				</div>
			</div>
		</form>
	</div>
		

	</body>

</html>
