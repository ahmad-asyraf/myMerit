
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
int clubID= Integer.parseInt(request.getParameter("id"));
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mymerit", "root", "admin");
PreparedStatement st1 = conn.prepareStatement("DELETE FROM admin WHERE clubID=?");
st1.setInt(1, clubID);
Statement st=conn.createStatement();

int result = st1.executeUpdate();

if (result > 0)
{
    out.println("Data Deleted Successfully!");
}


 response.sendRedirect("admin.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>