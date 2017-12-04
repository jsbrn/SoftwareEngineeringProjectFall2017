<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
   //gets manager's id
   String ID = request.getParameter("m_id");
   //deletes them from managers table
   String deleteInfo = "DELETE FROM managers WHERE ID = ?";
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   
   try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password"); 
	
   	ps = con.prepareStatement(deleteInfo);
   	ps.setString(1, ID);
	
	ps.executeUpdate(); 
   	response.sendRedirect("http://35.183.2.143:8080/SoftwareEngineeringProjectFall2017/admin/config/users.jsp");   
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
