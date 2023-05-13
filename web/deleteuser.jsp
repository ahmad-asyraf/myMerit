<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String registerID=request.getParameter("id");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mymerit", "root", "admin");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM register WHERE registerID="+registerID);
out.println("Data Deleted Successfully!");
 response.sendRedirect("admin3.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>