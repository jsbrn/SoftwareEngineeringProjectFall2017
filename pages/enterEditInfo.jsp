<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
   String type = request.getParameter("style");
   String getInfo = "Select * FROM rooms";
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   
   try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password"); 
	
   ps = con.prepareStatement(getInfo);
	
	ResultSet rs=ps.executeQuery(); 
   
   out.println("<table border='1'>");
   out.println("<tr> <th>Building</th> <th>Room Number</th> <th>Resident ID</th> <th>Edit</th></tr>");
   
   while(rs.next())
   {
        String roomNum = rs.getString("roomNum");
        String building = rs.getString("building");
        String student = rs.getString("resident_id");
        out.println("<tr> <td>"+building+"</td><td>"+roomNum+"</td> <td>"+student+"</td> <td><input type='radio' name = 'roomToEdit' value = '"+building+"_"+roomNum+"'/></td></tr>");
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
	
}
%>
    <html>
    <body>
        <p>Leave any fields you do not wish to change blank</p>
        <form action = "editRoom.jsp">
            Room number: <input type = "text" name = "newRoomNum"/>
            Building: <input type = "text" name = "newBuilding"/>
            Resident's ID <input type = "text" name = "newResident"/>
            Style: <select name = "newStyle">
    <%
        String getStyles = "SELECT roomStyle FROM style";
        PreparedStatement rs = null;
    
try{
    rs = con.prepareStatement(getStyles);
	
	ResultSet styles=rs.executeQuery(); 
   
   while(styles.next())
   {
        String Rstyle = styles.getString("roomStyle");
        out.println("<option value='"+Rstyle+"'>"+Rstyle+"</option>");
   }
} 
   catch (SQLException e)
{
	out.println("ERROR:"+e.getMessage());
}
finally
{
	if(rs != null)
		rs.close();
    if(con != null)
		con.close();
}
   %>
    
            </select>
            <input type = "submit"/>
        </form>
        </body>
    </html>
