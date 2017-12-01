<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
   HttpSession sess = request.getSession();
   String student = (String)sess.getAttribute("ID");
   String text = request.getParameter("noteText");
   String priority = request.getParameter("priority");
   String subject = request.getParameter("subject");
   String setInfo = "INSERT INTO notes (ID, noteText, priority, subject) VALUES (?, ?, ?, ?)";
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   
   try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password"); 
	
   ps = con.prepareStatement(setInfo);
   ps.setString(1, student);
   ps.setString(2, text);
   ps.setString(3, priority);
   ps.setString(4, subject);
	
   ps.executeUpdate();
   response.sendRedirect("http://35.183.2.143:8080/SoftwareEngineeringProjectFall2017/student/index.jsp");
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
