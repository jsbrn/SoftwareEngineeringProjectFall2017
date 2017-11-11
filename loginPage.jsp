<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
   String username = request.getParameter("username");
   String password = request.getParameter("password");
   String insertInfo = "SELECT * FROM STUDENT WHERE email = ? AND password = ?";
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   
   try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/residencedatabase","root","Pointe2006"); 
	
   ps = con.prepareStatement(insertInfo);
   ps.setString(1, username);
   ps.setString(2, password);
	
	ResultSet rs=ps.executeQuery();
   if(rs = null)
   {
        out.println("Error: incorrect username or password");
   }
   else{
        response.sendRedirect("student.html");
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