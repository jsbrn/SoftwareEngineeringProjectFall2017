<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import = "java.util.Date" %>
<%
   //gets name, message being sent, and session
   HttpSession sess = request.getSession();
   String name = (String)sess.getAttribute("name");
   String msg = request.getParameter("message");
   //inserts message into table
   String insertInfo = "INSERT INTO messages (messageText, author, timeSent) VALUES (?, ?, ?)";
   //creates a timestamp of the current time
   Timestamp currentTime = new Timestamp(new Date().getTime());
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   
   try
   {
   	Class.forName("com.mysql.jdbc.Driver"); 
   	con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password"); 
	
   	ps = con.prepareStatement(insertInfo);

   	ps.setString(1, msg);
   	ps.setString(2, name);
   	ps.setTimestamp(3, currentTime);
	
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
