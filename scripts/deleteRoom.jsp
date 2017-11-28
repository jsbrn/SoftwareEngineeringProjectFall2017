<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
   String roomNum = request.getParameter("roomNum");
   String building = request.getParameter("building");
   String deleteInfo = "DELETE FROM rooms WHERE roomNum = ? AND building = ?";
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   
   try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password"); 
	
   ps = con.prepareStatement(deleteInfo);
   ps.setString(1, roomNum);
   ps.setString(2, building);
	
	ps.executeUpdate(); 
   	response.sendRedirect("http://35.183.2.143:8080/SoftwareEngineeringProjectFall2017/jsp/manager.jsp");   
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
