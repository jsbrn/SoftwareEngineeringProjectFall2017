<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ include file="removalFunctions.jsp" %>
<%
   int workOrderID = Integer.parseInt(request.getParameter("workOrderID"));
   boolean as_admin = Boolean.parseBoolean(request.getParameter("admin"));
   String setResolved = "UPDATE notes set status = ? noteNum = ?";
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   
   try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password"); 

    ps = con.prepareStatement(setResolved);
    ps.setString(1, "resolved");
    ps.setString(1, workOrderID);
	
   	response.sendRedirect("http://35.183.2.143:8080/SoftwareEngineeringProjectFall2017/"+(as_admin ? "admin" : "student")+"/workorder.jsp?num=.jsp");   
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
