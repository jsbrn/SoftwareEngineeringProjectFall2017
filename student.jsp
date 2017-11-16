<!DOCTYPE html>
<html lang = "en">
<head>
    <meta charset = "utf-8">
    <title>Main</title>
    
</head>
<body>
    <a href="index.html">Log Out</a>
    <h1>Student Home Page</h1>
    

<%
   HttpSession sess = request.getSession();
   out.println("<h2>Welcome, "+(String)sess.getAttribute("name")+"!</h2><br>");
   
   if(sess.getAttribute("studentType").equals("yes"))
   {
        out.println("<a href='enterWorkOrder.html'>Submit Work order</a>");
   }
   else
   {
        out.println("<a href='enterApplicationInfo.jsp'>Register</a> <a href='viewApplications.jsp'>View Applications</a>");
   }
   %>
    
    <a href="search.html">Search</a>
    
</body>
    
</html>