<%@page import="com.mvc.util.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/mymerit";%>
<%!String user = "root";%>
<%!String psw = "";%>

<%
String id = request.getParameter("id");
String fullname=request.getParameter("fullname");
String matric=request.getParameter("matric");
String username=request.getParameter("username");
String password=request.getParameter("password");
String email=request.getParameter("email");

int registerID = Integer.parseInt(id);

 Connection connection = DBConnection.getConnection();

    try
    {
        PreparedStatement ps =connection.prepareStatement("Update register set fullname=?,matric=?,username=?,password=?,email=? where registerID=?");
        ps.setString(1, fullname);
        ps.setString(2, matric);
        ps.setString(3, username);
        ps.setString(4, password);
        ps.setString(5, email);
        ps.setInt(6, registerID);
        int i = ps.executeUpdate();
        if(i > 0)
        {
            out.print("<script type=\"text/javascript\">");
            out.print("alert('Record Updated Successfully');");
            out.print("location='admin3.jsp?id="+id+"';");
            out.print("</script>");
        }
        else
        {
            out.print("<script type=\"text/javascript\">");
            out.print("alert('Record Failed Update');");
            out.print("location='editForm.jsp?id="+id+"';");
            out.print("</script>");
        } 
    }
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
%>
