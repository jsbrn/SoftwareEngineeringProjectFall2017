<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
   String status, room = null, building = null, style = null, addToRoom = null, getStudent = null, setResident = null;
   String ID = request.getParameter("appID");
   boolean accepted = false;
   
   if(request.getParameter("accept") != null)
   {
        status = "accepted";
        addToRoom = "UPDATE rooms SET resident_id = ? WHERE roomNum = ? AND building = ?";
        getStudent = "SELECT * FROM applications WHERE applicationNum = ?";
        setResident = "UPDATE students SET assigned_room = 'yes' WHERE s_id = ?";
        accepted = true;
   }
   else
   {
        status = "declined";
   }
   
   String insertInfo = "UPDATE applications SET currentStatus = ? WHERE applicationNum = ?";
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   PreparedStatement add = null;
   PreparedStatement student = null;
   PreparedStatement assignRoom = null;
   
   try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password");  

   if(accepted)
   {
        student = con.prepareStatement(getStudent);
        student.setString(1, ID);
        ResultSet studentSet = student.executeQuery();
        String studentID = null;
        
        while(studentSet.next())
   {
        studentID = studentSet.getString("ID");
        room = studentSet.getString("requested_num");
        building = studentSet.getString("requested_building");
   }
        add = con.prepareStatement(addToRoom);
        add.setString(1, studentID);
        add.setString(2, room);
        add.setString(3, building);
   
        assignRoom = con.prepareStatement(setResident);
        assignRoom.setString(1, studentID);
        
	assignRoom.executeUpdate();
        add.executeUpdate();
   }
   
   ps = con.prepareStatement(insertInfo);
   ps.setString(1, status);
   ps.setString(2, ID);
	
	ps.executeUpdate();
	response.sendRedirect("http://35.183.2.143:8080/SoftwareEngineeringProjectFall2017/jsp/manager.jsp"); 
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
