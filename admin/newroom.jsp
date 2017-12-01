<!DOCTYPE html>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<html>
<body>


<div class>  
<form action="../scripts/addRoom.jsp" method="post">

Room Number: <input type="text" name="roomNum" />
Building Name:<input type = "text" name="building"/>
Room Style: <select name = "style">
    <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
    <%
        String getStyles = "SELECT roomStyle FROM style";
        java.sql.Connection con = null;
        PreparedStatement ps = null;
    
try{
       Class.forName("com.mysql.jdbc.Driver"); 
	   con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password"); 
	
    ps = con.prepareStatement(getStyles);
	
	ResultSet rs=ps.executeQuery(); 
   
   while(rs.next())
   {
        String style = rs.getString("roomStyle");
        out.println("<option value='"+style+"'>"+style+"</option>");
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
    
    </select>

<input type="submit" />

</form>
    
</div>
</body>

</html>
