<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
   //gets room, building, and style to input into table
   String roomNum = request.getParameter("roomNum");
   String building = request.getParameter("building");
   String style = request.getParameter("style");
   //query to insert values into rooms table
   String insertInfo = "INSERT INTO rooms (roomNum, building, roomStyle) VALUES (?, ?, ?)";
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   
   try
   {
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password");  
	
   	ps = con.prepareStatement(insertInfo);
   	ps.setString(1, roomNum);
   	ps.setString(2, building);
   	ps.setString(3, style);
	
	ps.executeUpdate(); 
   	response.sendRedirect("http://35.183.2.143:8080/SoftwareEngineeringProjectFall2017/admin/config/buildings.jsp");   
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
