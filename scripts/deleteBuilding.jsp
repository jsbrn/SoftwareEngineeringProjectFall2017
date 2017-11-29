<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ include file="/deleteRoom.jsp" %>
<%
   String buildingName = request.getParameter("buildingName");
   String checkForRooms = "SELECT roomID FROM rooms where building = ?"
   String deleteBuilding = "DELETE FROM buildings WHERE building_name = ?"
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   
   try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password"); 
	
	 ps = con.prepareStatement(checkForRooms);
     ps.setString(1, buildingName);
     ResultSet rs = ps.executeQuery();
     
     while(rs.next())
    {
        String roomID = rs.getString("roomID");
        deleteRoom(con, roomID);
    }
     
    PreparedStatement delete = con.prepareStatement(deleteBuilding);
    delete.setString(1, buildingName);
    delete.executeUpdate();
	
	
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
