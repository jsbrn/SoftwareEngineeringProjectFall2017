<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
  //gets student ID from form
   String ID = request.getParameter("studentID");
   //prepared statements to delete student from residents table and changes the assigned status in student's table
   String deleteStudent = "DELETE FROM residents WHERE residentID = ?";
   String changeResident = "UPDATE students SET assigned_room = 'no' WHERE s_id = ?";
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   PreparedStatement assignRoom = null;
   
   try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password");  

    ps = con.prepareStatement(setResident);
    ps.setString(1, ID);
    ps.executeUpdate();

    assignRoom = con.prepareStatement(insertInfo);
    assignRoom.setString(1, sID);
    assignRoom.setString(2, roomID);
        
    assignRoom.executeUpdate();
   
   response.sendRedirect("http://35.183.2.143:8080/SoftwareEngineeringProjectFall2017/scripts/manager.jsp");
   
   catch (SQLException e)
{
	out.println("ERROR:"+e.getMessage());
}
finally
{
	if(ps != null)
		ps.close();
   
   if(assignRoom != null)
        assignRoom.close();
	
	if(con != null)
		con.close();
}
%>
