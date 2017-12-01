<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
   //gets the student ID and room ID
   String ID = request.getParameter("studentID");
   String roomID = request.getParameter("roomID");
   int roomIDINT = Integer.parseInt(roomID);
   //creates prepared statements for inserting  students into the residents table, and updating the student's info in student table
   String insertInfo = "INSERT INTO residents VALUES (?, ?)";
   String setResident = "UPDATE students SET assigned_room = 'yes' WHERE s_id = ?";
   
   //creates conncetions
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   PreparedStatement assignRoom = null;
   
   try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password");  

    ps = con.prepareStatement(setResident);
    //sets to the student ID and executes
    ps.setString(1, ID);
    
    ps.executeUpdate();

    //sets the student ID and room ID and inserts
    assignRoom = con.prepareStatement(insertInfo);
    assignRoom.setInt(1, roomIDINT);
    assignRoom.setString(2, ID);
        
    assignRoom.executeUpdate();
   
   //redirects to main page
   response.sendRedirect("http://35.183.2.143:8080/SoftwareEngineeringProjectFall2017/scripts/manager.jsp");
   }
   catch (SQLException e)
{
	out.println("ERROR:"+e.getMessage());
}
finally
{
	if(ps != null)
		ps.close();
   
   if(assignRoom != null)
        assignRoom.close();
	
	if(con != null)
		con.close();
}
%>
