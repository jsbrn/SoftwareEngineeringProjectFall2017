<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
   String ID = request.getParameter("ID");
   String roomNum = request.getParameter("roomNum");
   String building = request.getParameter("building");
   String insertInfo = "INSERT INTO application VALUES (?, ?, ?, ?, ?)";
   
   Random rand = new Random();
   int n = rand.nextInt() + 1000;
   String appNumber = ""+n
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   
   try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/residencedatabase","root","Pointe2006"); 
	
   ps = con.prepareStatement(insertInfo);
   ps.setString(2, roomNum);
   ps.setString(3, building);
   ps.setString(4, "pending");
   ps.setString(5, ID);
   ps.setString(1, appNumber);
	
	ResultSet rs=ps.executeQuery(); 
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