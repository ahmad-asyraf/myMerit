<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String acID=request.getParameter("id");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mymerit", "root", "admin");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM activity WHERE acID="+acID);
if(i > 0)
        {
            out.print("<script type=\"text/javascript\">");
            out.print("alert('Record Updated Successfully');");
            out.print("location='manageactivity.jsp';");
            out.print("</script>");
        }
        else
        {
            out.print("<script type=\"text/javascript\">");
            out.print("alert('Record Failed Update');");
            out.print("location='manageactivity.jsp';");
            out.print("</script>");
        } 
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>