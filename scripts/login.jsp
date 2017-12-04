<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
   HttpSession sess = request.getSession();
   String userType = null;
   String idField = null;
   String redirectURL = null;
   //if they pressed the student login button
   if(request.getParameter("s_login")!=null)
   {
   //user type is student, id type is s_id, and they are redirected to the student's page
    userType = "students";
    idField = "s_id";
    redirectURL = "../student/index.jsp";
   }
   //if they clicked manager login button
   else if (request.getParameter("m_login")!=null)
   {
   //user type is manager, id type is m_id, and they are redirected to the manager's page
    userType = "managers";
    idField = "ID";
    redirectURL = "../admin/index.jsp";
   }
   //gets username and password
   String username = request.getParameter("username");
   String password = request.getParameter("password");
   //queries for user with appropriate username and password
   String insertInfo = "SELECT * FROM "+userType+" WHERE email = ? AND pword = ?";
   
   java.sql.Connection con = null;
   PreparedStatement ps = null;
   
   try
   {
	Class.forName("com.mysql.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password");  
	
   	ps = con.prepareStatement(insertInfo);
   	ps.setString(1, username);
   	ps.setString(2, password);
	
	ResultSet rs=ps.executeQuery();
   	if(!rs.next())
   	{
        out.println("Error: incorrect username or password");
   	}
   	else
	{
	//get id and first name
        String id = rs.getString(idField);
        String name = rs.getString("fname");
	
	//if they are a student
        if(userType.equals("students"))
       {
   	//save in the session if they have a room
        String sType = rs.getString("assigned_room");
        sess.setAttribute("studentType", sType);
       }
   	//save the type of user, id, and name in the session
   	sess.setAttribute("userType", userType);
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
