<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
   HttpSession sess = request.getSession();
   String ID = (String)sess.getAttribute("ID");
   String roomNum = request.getParameter("roomNum");
   String buildingType = request.getParameter("buildingType");
   String style = request.getParameter("style");
   //String specialRequest = request.getParameter("customField");
   int inYear = 0;
   int inputRoom = 0;
   String status = "pending";
   
   String insertInfo = "INSERT INTO applications (ID, requested_style, currentStatus, quiet_house) VALUES (?, ?, ?, ?)";
   String assignRoom = "INSERT INTO residents VALUES(?, ?)";
   String updateStudent = "UPDATE students SET assigned_room = 'yes' WHERE s_id = ?";
   String findBuilding = "SELECT building_name WHERE quietBuilding = ?";
   String findRoom = "SELECT roomID FROM rooms WHERE style = ? AND NOT EXISTS (SELECT roomID FROM residents WHERE rooms.roomID = residents.roomID)";
   String getYearLevel = "SELECT in_year FROM students WHERE s_id = ?";
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   
   try
{

    Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password");
	
   
   //if(specialRequest.isEmpty())
   //{
        PreparedStatement year = con.prepareStatement(getYearLevel);
        year.setString(1, ID);
        ResultSet results = year.executeQuery();
        while(results.next())
        {
            inYear = results.getInt("in_year");
        //}
   
        if(inYear == 1)
        {
            style = "Basic Single";
        }
   
        PreparedStatement emptyRooms = null;
        String buildingName = null;
   
        if(buildingType == "yes" || buildingType == "no")
        {
            PreparedStatement kindOfBuilding = con.prepareStatement(findBuilding);
            kindOfBuilding.setString(1, buildingType);
            
            ResultSet building = kindOfBuilding.executeQuery();
            if(building.next())
            {
                buildingName = building.getString("building_name");
                findRoom = "SELECT roomID FROM rooms WHERE style = ? AND building = ? AND NOT EXISTS (SELECT roomID FROM residents WHERE rooms.roomID = residents.roomID)";
            }
        }

        
        
   
        emptyRooms = con.prepareStatement(findRoom);
        emptyRooms.setString(1, style);
   
        if(buildingName != null)
        {
            emptyRooms.setString(2, buildingName);
        }
        
        ResultSet rooms = emptyRooms.executeQuery();
        
        while(rooms.next())
        {
            inputRoom = rooms.getInt("roomID");
        }
   
         PreparedStatement insertIntoRoom = con.prepareStatement(assignRoom);
        PreparedStatement update = con.prepareStatement(updateStudent);
            
        insertIntoRoom.executeUpdate();
        update.executeUpdate();
   }
   
	
   ps = con.prepareStatement(insertInfo);
   ps.setString(1, ID);
   ps.setString(2, style);
   ps.setString(3, status);
   //ps.setString(4, specialRequest);
   ps.setString(5, buildingType);
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
