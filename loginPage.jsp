<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
   String userType = null;
   String idField = null;
   String redirectURL = null;
   if(request.getParameter("s_login")!=null)
   {
    userType = "students";
    idField = "s_id";
    redirectURL = "http://localhost:8080/SoftProj/jsp/student.jsp";
   }
   else if (request.getParameter("m_login")!=null)
   {
    userType = "managers";
    idField = "ID";
    redirectURL = "http://localhost:8080/SoftProj/jsp/manager.jsp";
   }
   String username = request.getParameter("username");
   String password = request.getParameter("password");
   String insertInfo = "SELECT * FROM "+userType+" WHERE email = ? AND pword = ?";
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   
   try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/residencedatabase","root","Pointe2006"); 
	
   ps = con.prepareStatement(insertInfo);
   ps.setString(1, username);
   ps.setString(2, password);
	
	ResultSet rs=ps.executeQuery();
   if(!rs.next())
   {
        out.println("Error: incorrect username or password");
   }
   else{
        HttpSession sess = request.getSession();
        String id = rs.getString(idField);
        String name = rs.getString("fname");
        if(userType.equals("students"))
   {
        String sType = rs.getString("assigned_room");
        sess.setAttribute("studentType", sType);
   }
   
        sess.setAttribute("ID", id);
        sess.setAttribute("name", name);
        response.sendRedirect(redirectURL);   
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
	
	if(con != null)
		con.close();
}
%>