<!DOCTYPE html>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<html lang = "en">
<head>
    <meta charset = "utf-8">
    <title>Lakehead University Residence</title>
    <link rel="stylesheet" type="text/css" media="screen" href="stylesheet.css">
	<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet"> 
</head>
<body>

<center><h2>Applications</h2></center>
<div class = "detail-card">

	<%
	   HttpSession sess = request.getSession();
	   String ID = (String)sess.getAttribute("ID");
	   String getInfo = "Select applicationNum, ID, currentStatus FROM applications WHERE ID = ?";
	   
	   java.sql.Connection con = null;
	   PreparedStatement ps = null;
	   
	   try
	{
		Class.forName("com.mysql.jdbc.Driver"); 
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/residencedatabase","root","Pointe2006"); 
		
	   ps = con.prepareStatement(getInfo);
	   ps.setString(1, ID);
		
		ResultSet rs=ps.executeQuery(); 
		
	   out.println("<table class = "gridtable" style = "width: 100%">");
		out.println("<tr> <th>Application #</th> <th>Status</th></tr>");
	   while(rs.next())
	   {
			String applicationNum = rs.getString("applicationNum");
			String status = rs.getString("currentStatus");

			out.println("<tr> <td>"+applicationNum+"</td> <td>"+status+"</td></tr>");
	   }
	   out.println("</table>");
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

</div>

</body>
</html>