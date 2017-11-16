<!DOCTYPE html>
<html lang = "en">
<head>
    <meta charset = "utf-8">
    <title>Main</title>
    
</head>
<body>
    <a href="index.html">Log Out</a>
    <h1>Manager Home Page</h1>
    

<%
   HttpSession sess = request.getSession();
   out.println("Welcome, "+(String)sess.getAttribute("name")+"!<br>");
   %>
    
    <a href="insertRoom.jsp">Add room</a>
    <a href="deleteRoom.html">Delete room</a>
    <a href="enterEditInfo.jsp">Edit room</a>
    <a href="viewPendingApplications.jsp">View pending applications</a>
    <a href="viewPendingWorkOrders.jsp">View pending work orders</a>
    <a href="selectRooms.jsp">View rooms</a>
    
</body>
    
</html>