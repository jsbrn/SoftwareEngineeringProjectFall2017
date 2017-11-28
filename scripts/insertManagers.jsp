<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
   String ID = request.getParameter("m_id");
   String fname = request.getParameter("fname");
   String lname = request.getParameter("lname");
   String email = request.getParameter("email");
   String password = request.getParameter("password");
   String insertInfo = "INSERT INTO managers VALUES (?, ?, ?, ?, ?)";
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   
   try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password"); 
	
   ps = con.prepareStatement(insertInfo);
   ps.setString(1, ID);
   ps.setString(2, fname);
   ps.setString(3, lname);
   ps.setString(4, email);
   ps.setString(5, password);
	
	ps.executeUpdate(); 
   	response.sendRedirect("http://35.183.2.143:8080/SoftwareEngineeringProjectFall2017/pages/manager.jsp");   
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
