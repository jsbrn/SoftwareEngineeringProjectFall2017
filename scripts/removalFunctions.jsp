<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
    
        <%!
        public void removeStudent(String residentID, java.sql.Connection con)
        {
           try
        {
            String removeResident = "DELETE FROM residents WHERE residentID = ?";
            String updateStudent = "UPDATE students SET assigned_room = 'no' WHERE s_id = ?";
            PreparedStatement remove = con.prepareStatement(removeResident);
		    remove.setString(1, residentID);
		    remove.executeUpdate();
		
		    PreparedStatement update = con.prepareStatement(updateStudent);
		    update.setString(1, residentID);
            update.executeUpdate();
        }
        catch (SQLException e)
        {
            
        }
        }
        %>
    
    <%!
        public void deleteRoom(java.sql.Connection con, int roomID)
        {
        try{
            String checkForResident = "SELECT residentID FROM residents WHERE roomID = ?";
            String deleteInfo = "DELETE FROM rooms WHERE roomID = ?";
        
            PreparedStatement findResident = con.prepareStatement(checkForResident);
	        findResident.setInt(1, roomID);
	        ResultSet resident = findResident.executeQuery();
            
            while(resident.next())
	       {
                String residentID = resident.getString("residentID");
                removeStudent(residentID, con);
            }
            
            PreparedStatement ps = con.prepareStatement(deleteInfo);
   	        ps.setInt(1, roomID);
	
	        ps.executeUpdate();
        }
        catch (Exception e)
        {
            
        }
        }
        %>
