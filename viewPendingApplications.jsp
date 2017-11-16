<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
   String getInfo = "Select * FROM applications WHERE currentStatus = 'pending'";
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   
   try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/residencedatabase","root","Pointe2006"); 
	
   ps = con.prepareStatement(getInfo);
	
	ResultSet rs=ps.executeQuery(); 
   	
   out.println("<table border='1'>");
   out.println("<tr> <th>Student ID</th> <th>Application #</th> <th>Requested Style</th> <th>Requested Building</th> <th>Room Number</th></tr>");
   while(rs.next())
   {
        String studentID = rs.getString("ID");
        String applicationNum = rs.getString("applicationNum");
        String style = rs.getString("requested_style");
        String building = rs.getString("requested_building");
        String num = rs.getString("requested_num");

        out.println("<tr> <td>"+studentID+"</td><td>"+applicationNum+"</td> <td>"+style+"</td> <td>"+building+"</td><td>"+num+"</td></tr>");
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
    
    <html lang = "en">
<head>
    <meta charset = "utf-8">
    <title>Main</title>
    
</head>
<body>
    <form action = "reviewApplication.jsp">
    Select application to review:<select name = "appID">
    <%
        String getApplications = "SELECT applicationNum FROM applications WHERE currentStatus = 'pending'";

        PreparedStatement getApps = null;
    
try{
	
    getApps = con.prepareStatement(getApplications);
	
	ResultSet rs=getApps.executeQuery(); 
   
   while(rs.next())
   {
        String ID = rs.getString("applicationNum");
        out.println("<option value='"+ID+"'>"+ID+"</option>");
   }
} 
   catch (SQLException e)
{
	out.println("ERROR:"+e.getMessage());
}
finally
{
	if(getApps != null)
		getApps.close();
    if(con != null)
		con.close();
}
   %>
    
    </select>
    <input type="submit" name = "accept" value="Accept"/>
    <input type="submit" name = "decline" value="Decline"/>
        </form>
    </body>
</html>