<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
   String ID = request.getParameter("ID");
   String getInfo = "Select applicationNum, ID, status FROM application WHERE ID = ?";
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   
   try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/residencedatabase","root","Pointe2006"); 
	
   ps = con.prepareStatement(getInfo);
   ps.setString(1, ID);
	
	ResultSet rs=ps.executeQuery(); 
   
   while(rs.next())
   {
        String applicationNum = rs.getString("applicationNum");
        String studentID = rs.getString("ID");
        String status = rs.getString("status");
        out.println(applicationNum + " "+studentID + " "+status);
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