<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ include file="removalFunctions.jsp" %>
<%
   //gets room id
   int roomID = Integer.parseInt(request.getParameter("roomID"));

   java.sql.Connection con = null;
   PreparedStatement ps = null;
   PreparedStatement findResident = null;
   
   try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password"); 
	//calls delete room function
        deleteRoom(con, roomID);
	
   	response.sendRedirect("http://35.183.2.143:8080/SoftwareEngineeringProjectFall2017/admin/config/building.jsp?buildingName="+buildingName);   
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
