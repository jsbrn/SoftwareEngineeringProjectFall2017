<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import = "java.util.Date" %>
<%
   HttpSession sess = request.getSession();
   String name = (String)sess.getAttribute("name");
   String type = (String)sess.getAttribute("userType");
   String idString = request.getParameter("workOrderID");
   int ID = Integer.parseInt(idString);
   String message = request.getParameter("msg");
   String deleteInfo = "INSERT INTO messages (workOrderID, messageText, author, timeSent) VALUES (?, ?, ?, ?)";
   String redirectURL = null;
   Timestamp currentTime = new Timestamp(new Date().getTime());
   
      if(type.equals("students"))
   {
    redirectURL = "http://35.183.2.143:8080/SoftwareEngineeringProjectFall2017/student/workorder.jsp?workOrderID="+ID;
   }
   else if (type.equals("managers"))
   {
    redirectURL = "http://35.183.2.143:8080/SoftwareEngineeringProjectFall2017/admin/workorder.jsp?workOrderID="+ID;
   }
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   
   try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password"); 
	
   ps = con.prepareStatement(deleteInfo);
   ps.setInt(1, ID);
   ps.setString(2, message);
   ps.setString(3, name);
   ps.setTimestamp(4, currentTime);
	
	ps.executeUpdate(); 
   	response.sendRedirect(redirectURL);   
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
