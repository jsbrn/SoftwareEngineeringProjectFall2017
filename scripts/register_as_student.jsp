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
int year = Integer.parseInt(request.getParameter("year"));
int id = 1;
int ids[] = new int[1000];
int counter=0;
boolean clear = false;
int i = 0;
        
try{   
   /** 连接数据库参数 **/  
   String driverName = "com.mysql.jdbc.Driver"; //driver name
   
   Class.forName(driverName).newInstance();
   Connection conn = DriverManager.getConnection("jdbc:mysql://cs3415proj.cowuyyafmbq3.ca-central-1.rds.amazonaws.com:3306/cs3415proj","user","password");
            
   String check_sql = "SELECT * FROM students";
   PreparedStatement check = conn.prepareStatement(check_sql);
   
   ResultSet rs = check.executeQuery();
   
   while(rs.next()){
        ids[counter] = rs.getInt("s_id");
        counter++;
   }
   do{
        clear = true;
        i = 0;
        do{
            if (id == ids[i]){
                id++;
                clear = false;
            }
            i++;
        } while (i != ids.length);
    } while (clear == false);
   
   
   
    
   
    String insert_sql = "insert into students (s_id, fname, lname, email, pword, in_year, assigned_room) values(?, ?, ?, ?, ?, ?, ?)";  
    
    PreparedStatement ps = conn.prepareStatement(insert_sql); 
    ps.setString(1, Integer.toString(id));
    ps.setString(2, fname);
    ps.setString(3, lname);
    ps.setString(4, email_address);
    ps.setString(5, password);
    ps.setInt(6, year);
    ps.setString(7, "no");
         
    ps.executeUpdate();
    response.sendRedirect("../index.html");
    
                
    ps.close();                 
    conn.close();   
    }catch (Exception e) {  
        e.printStackTrace();  
    }  
%>

  </body>  
</html> 