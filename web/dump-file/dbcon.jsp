

<%@ page import="java.sql.*"  %>
<%

    
Connection conn=null;
ResultSet result=null;
Statement stmt=null;

try {
  Class c=Class.forName("com.mysql.jdbc.Driver");
}
catch(Exception e){
  out.write("Error!!!!!!" + e);
}
try {
  conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mymerit","root","admin");
  
}
catch(SQLException e) {
 e.printStackTrace();
}
%>
