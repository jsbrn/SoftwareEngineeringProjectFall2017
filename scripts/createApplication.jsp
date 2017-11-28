<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
   HttpSession sess = request.getSession();
   String ID = (String)sess.getAttribute("ID");
   String roomNum = request.getParameter("roomNum");
   String building = request.getParameter("building");
   String style = request.getParameter("style");
   String insertInfo = "INSERT INTO applications VALUES (?, ?, ?, ?, ?, ?)";
   
   int randomNum = (int)(Math.random() * 100);
   String appNumber = String.valueOf(randomNum);
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   
   try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password"); 
	
   ps = con.prepareStatement(insertInfo);
   ps.setString(1, appNumber);
   ps.setString(2, ID);
   ps.setString(3, style);
   ps.setString(4, roomNum);
   ps.setString(5, building);
   ps.setString(6, "pending");
	
	ps.executeUpdate();
   response.sendRedirect("http://35.183.2.143:8080/SoftwareEngineeringProjectFall2017/pages/student.jsp");
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
