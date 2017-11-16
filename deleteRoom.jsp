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
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/residencedatabase","root","Pointe2006"); 
	
   ps = con.prepareStatement(deleteInfo);
   ps.setString(1, roomNum);
   ps.setString(2, building);
	
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