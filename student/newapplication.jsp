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
		<h4>Apply to Residence</h4>
		<a href = "https://www.lakeheadu.ca/current-students/residence" class = 'button'>Residence/Housing Information</a>
		<h6>Please fill out the following form. It contains some questions to help ensure you are given
			a room that works best for you.</h6>
		<form action="../scripts/submitApplication.jsp">
			<div class="row">
				<div class="u-full-width">
				
					<label for="priority">Do you want a roommate?</label>
					<select class="u-full-width" id="priority" name="priority">
						<option>Doesn't matter.</option>
						<option>Yes, I want a roommate.</option>
						<option>No, I want to live alone.</option>
					</select>
					
					<label for="year">Do you need peace and quiet to study?</label>
					<select class = "u-full-width" name = "buildingType" >
						<option>Doesn't matter.</option>
						<option>Yes, definitely.</option>
						<option>No.</option>
					</select>
					
					<label for="priority">Which type of room would you prefer?</label>
					<select class="u-full-width" id="style" name="style">
						<%
								String getStyles = "SELECT roomStyle FROM style";
								java.sql.Connection con = null;
								PreparedStatement ps = null;
							
						try{
							   Class.forName("com.mysql.jdbc.Driver"); 
							   con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password");  
							
							ps = con.prepareStatement(getStyles);
							
							ResultSet rs=ps.executeQuery(); 
						   //gets all the types of room styles
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
					
					
					<input class="button-primary" value="Submit your application" type="submit">
				</div>
			</div>
		</form>
	</div>
		

	</body>

</html>
