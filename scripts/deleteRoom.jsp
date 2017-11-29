<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
   String roomID = request.getParameter("roomID");
   String checkForResident = "SELECT residentID FROM residents WHERE room_id = ?";
   String deleteInfo = "DELETE FROM rooms WHERE roomID = ?";
   String removeResident = "DELETE FROM residents WHERE residentID = ?";
   String updateStudent = "UPDATE students SET assigned_room = 'no' WHERE s_id = ?";
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   PreparedStatement findResident = null;
   
   try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password"); 
	
	findResident = con.prepareStatment(checkForResident);
	findResident.setString(1, roomID);
	ResultSet resident = findResident.executeQuery();
	
	while(resident.next())
	{
		residentID = resident.getString("residentID");
		PreparedStatement remove = con.prepareStatement(removeResident):
		remove.setString(1, residentID);
		remove.executeUpdate();
		
		PreparedStatement update = con.prepareStatement(updateStudent);
		update.setString(1, residentID);
	}
   	
	ps = con.prepareStatement(deleteInfo);
   	ps.setString(1, roomID);
	
	ps.executeUpdate(); 
	
	
   	response.sendRedirect("http://35.183.2.143:8080/SoftwareEngineeringProjectFall2017/admin/index.jsp");   
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
