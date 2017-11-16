<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
   String newRoomNum = request.getParameter("newRoomNum");
   String newBuilding = request.getParameter("newBuilding");
   String newStyle = request.getParameter("newStyle");
   String newResident = request.getParameter("newResident");
   String [] currentRoomInfo = {"Deer Lake Ridge", "1"};
   String deleteInfo = "UPDATE rooms SET roomNum = ?, building = ?, resident_id = ?, roomStyle = ? WHERE roomNum = ? AND building = ?";
   String getOldInfo = "SELECT * FROM rooms WHERE roomNum = ? AND building = ?";
   
   if(newRoomNum.isEmpty())
       newRoomNum = currentRoomInfo[1];
   if(newBuilding.isEmpty())
        newBuilding = currentRoomInfo[0];
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   PreparedStatement oldRoom = null;
   
   try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/residencedatabase","root","Pointe2006"); 
   
   oldRoom = con.prepareStatement(getOldInfo);
   oldRoom.setString(1, "1");
   oldRoom.setString(2, "Deer Lake Ridge");
   
   ResultSet rs = oldRoom.executeQuery();
   while(rs.next())
   {
        if(newStyle.isEmpty())
            newStyle = rs.getString("style");
        if(newResident.isEmpty())
            newResident = rs.getString("resident_id");
   }
	
   ps = con.prepareStatement(deleteInfo);
   ps.setString(1, newRoomNum);
   ps.setString(2, newBuilding);
   ps.setString(4, newStyle);
   ps.setString(3, newResident);
   ps.setString(5, "1");
   ps.setString(6, "Deer Lake Ridge");
   out.println(newResident.length());
	
	ps.executeUpdate(); 
   	response.sendRedirect("http://localhost:8080/SoftProj/jsp/manager.jsp");   
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