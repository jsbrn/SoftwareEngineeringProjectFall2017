<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ include file="removalFunctions.jsp" %>
<%
   int workOrderID = Integer.parseInt(request.getParameter("workOrderID"));
   String removeWorkOrder = "DELETE FROM notes WHERE noteNume = ?";
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   
   try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password"); 

    ps = con.prepareStatement(removeWorkOrder);
    ps.setString(1, workOrderID);
	
   	response.sendRedirect("http://35.183.2.143:8080/SoftwareEngineeringProjectFall2017/student/index.jsp");   
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
