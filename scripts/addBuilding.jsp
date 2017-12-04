<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
   //gets building name
   String buildingName = request.getParameter("building");
   //inserts building into table
   String insertInfo = "INSERT INTO buildings VALUES (?, 'no')";
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   
   try
   {
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password"); 
	
   	ps = con.prepareStatement(deleteInfo);
   	ps.setString(1, building);
	
	ps.executeUpdate(); 
   	response.sendRedirect("http://localhost:8080/SoftProj/admin/index.jsp");   
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
