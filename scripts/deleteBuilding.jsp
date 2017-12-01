<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ include file="removalFunctions.jsp" %>
<%
   String buildingName = request.getParameter("buildingName");
   String checkForRooms = "SELECT roomID FROM rooms where building = ?";
   String deleteBuilding = "DELETE FROM buildings WHERE building_name = ?";
   
   PreparedStatement removeBuilding = null;
   java.sql.Connection con = null;
   
   try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password"); 
	
	 removeBuilding = con.prepareStatement(checkForRooms);
     removeBuilding.setString(1, buildingName);
     ResultSet rs = removeBuilding.executeQuery();
     
     while(rs.next())
    {
        int roomID = rs.getInt("roomID");
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
	if(removeBuilding != null)
		removeBuilding.close();
	
	if(con != null)
		con.close();
}
%>
