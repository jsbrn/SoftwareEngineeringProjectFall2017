<!DOCTYPE html>
<html lang = "en">
<head>
    <meta charset = "utf-8">
    <title>Main</title>
    
</head>
<body>

    <form action = "viewRooms.jsp">
        <select name = "style">
        <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
    <%
        String getStyles = "SELECT roomStyle FROM style";
        java.sql.Connection con = null;
        PreparedStatement ps = null;
    
try{
       Class.forName("com.mysql.jdbc.Driver"); 
	   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/residencedatabase","root","Pointe2006"); 
	
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
    

    
</body>
    
</html>