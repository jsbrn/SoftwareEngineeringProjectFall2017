<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
   String roomNum = request.getParameter("roomNum");
   String building = request.getParameter("building");
   String date = request.getParameter("date");
   String time = request.getParameter("time");
   String insertInfo = "INSERT INTO maintenance VALUES (?, ?, ?, ?)";
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   
   try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password");  
	
   ps = con.prepareStatement(insertInfo);
   ps.setString(1, roomNum);
   ps.setString(2, building);
   ps.setString(3, date);
   ps.setString(4, time);
	
	ps.executeUpdate(); 
   	response.sendRedirect("http://35.183.2.143:8080/SoftwareEngineeringProjectFall2017/admin/index.jsp");   
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
