<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
   HttpSession sess = request.getSession();
   String ID = (String)sess.getAttribute("ID");
   String roomNum = request.getParameter("roomNum");
   String building = request.getParameter("building");
   String style = request.getParameter("style");
   String specialRequest = request.getParameter("customField");
   int inYear = null;
   int inputRoom = null;
   String status = "pending";
   
   String insertInfo = "INSERT INTO applications VALUES (?, ?, ?, ?, ?, ?)";
   String assignRoom = "INSERT INTO residents VALUES(?, ?)";
   String updateStudent = "UPDATE students SET assigned_room = 'yes' WHERE s_id = ?"
   String findRoom = "SELECT roomID FROM rooms WHERE style = ? AND NOT EXISTS (SELECT roomID FROM residents WHERE rooms.roomID = residents.roomId)";
   String getYearLevel = "SELECT in_year FROM students WHERE s_id = ?"
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   
   try
{

    Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password");
	
   
   if(specialRequest.isEmpty())
   {
        PreparedStatement year = con.prepareStatement(getYearLevel);
        year.setString(1, ID);
        ResultSet results = year.executeQuery();
        while(results.next())
        {
            inYear = results.getInt("in_year");
        }
   
        if(inYear == 1)
        {
            style = "Basic Single"
        }
        PreparedStatement emptyRooms = con.prepareStatement(findRooms);
        emptyRooms.setString(1, style);
        
        ResultSet rooms = emptyRooms.executeQuery();
        
        while(rooms.next())
        {
            inputRoom = rooms.getInt(roomID);
        }
   
         PreparedStatement insertIntoRoom = con.prepareStatement(assignRoom);
        PreparedStatement update = con.prepareStatement(updateStudent);
            
        insertIntoRoom.executeUpdate();
        update.executeUpdate();
   }
   
	
   ps = con.prepareStatement(insertInfo);
   ps.setString(1, appNumber);
   ps.setString(2, ID);
   ps.setString(3, style);
   ps.setString(4, roomNum);
   ps.setString(5, building);
   ps.setString(6, status);
   ps.executeUpdate();
   
   response.sendRedirect("http://35.183.2.143:8080/SoftwareEngineeringProjectFall2017/student/index.jsp");
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
