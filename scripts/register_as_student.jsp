<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  



<%					//getting the values
String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String password = request.getParameter("password");
String email_address = request.getParameter("email_address");
        
        try   
        {   
            /** 连接数据库参数 **/  
            String driverName = "com.mysql.jdbc.Driver"; //driver name
          
            Class.forName(driverName).newInstance();  
            Connection conn = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password");
            
            String insert_sql = "insert into students values(?, ?, ?, ?, ?, ?, 'no')";  
            PreparedStatement ps = conn.prepareStatement(insert_sql);    
            ps.setString(2, fname);
            ps.setString(3, lname);
            ps.setString(4, email_address);
            ps.setString(5, password);
            ps.setInt(6, 1);
   
            try {   
                ps.executeUpdate();
                response.sendRedirect("../index.html");
            }catch(Exception e)     {  
                e.printStackTrace();  
            }  
              
            ps.close();                 
            conn.close();   
        }catch (Exception e) {  
                e.printStackTrace();  
        }  
%>

  </body>  
</html> 