<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
   HttpSession sess = request.getSession();
   String student = (String)sess.getAttribute("ID");
   String text = request.getParameter("noteText");
   String setInfo = "INSERT INTO notes VALUES (?, ?, ?)";
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   
   int randomNum = (int)(Math.random() * 100);
   String noteNumber = String.valueOf(randomNum);
   
   try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/residencedatabase","root","Pointe2006"); 
	
   ps = con.prepareStatement(setInfo);
   ps.setString(1, noteNumber);
   ps.setString(2, student);
   ps.setString(3, text);
	
   ps.executeUpdate();
   response.sendRedirect("http://localhost:8080/SoftProj/jsp/student.jsp");
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