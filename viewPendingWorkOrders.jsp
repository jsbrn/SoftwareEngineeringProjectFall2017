<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
   String getInfo = "Select * FROM notes";
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   
   try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password"); 
	
   ps = con.prepareStatement(getInfo);
	
	ResultSet rs=ps.executeQuery(); 
   	
   out.println("<table border='1'>");
	out.println("<tr> <th>Note #</th> <th>Student ID</th> <th>Note Text</th></tr>");
   while(rs.next())
   {
        String num = rs.getString("noteNum");
        String studentID = rs.getString("ID");
        String text = rs.getString("noteText");

        out.println("<tr> <td>"+num+"</td><td>"+studentID+"</td> <td>"+text+"</td></tr>");
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
