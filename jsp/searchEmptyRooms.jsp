<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
   String type = request.getParameter("roomType");
   String getInfo = "Select roomNum, building, FROM rooms WHERE NOT EXISTS resident AND roomStyle = ?";
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   
   try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password");  
	
   ps = con.prepareStatement(getInfo);
   ps.setString(1, type);
	
	ResultSet rs=ps.executeQuery(); 
   
   while(rs.next())
   {
        String roomNum = rs.getString("roomNum");
        String building = rs.getString("building");
        out.println(roomNum + " "+building);
   }
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