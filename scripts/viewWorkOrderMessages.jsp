<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
   String workOrderID = request.getParameter("workOrderID");
   String getMessages = "SELECT messageText, author, timeSent  FROM messages WHERE workOrderID = ?";
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   
   try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password");  
	
   ps = con.prepareStatement(getMessages);
   ps.setString(1, workOrderID);
	
	ResultSet messages = ps.executeQuery(); 
   	
   while(messages.next())
   {
        String text = messages.getString("messageText");
        String author = messages.getString("author");
       	TimeStamp time = messages.getTimeStamp("timeSent");
        
        //input display stuff here
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
