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
String club=request.getParameter("club");
String des=request.getParameter("des");
String faculty=request.getParameter("faculty");

int clubID = Integer.parseInt(id);

 Connection connection = DBConnection.getConnection();

    try
    {
        PreparedStatement ps =connection.prepareStatement("Update admin set club=?,des=?,faculty=? where clubID=?");
        ps.setString(1, club);
        ps.setString(2, des);
        ps.setString(3, faculty);
        ps.setInt(4, clubID);
        int i = ps.executeUpdate();
        if(i > 0)
        {
            out.print("<script type=\"text/javascript\">");
            out.print("alert('Record Updated Successfully');");
            out.print("location='adminClub.jsp';");
            out.print("</script>");
        }
        else
        {
            out.print("<script type=\"text/javascript\">");
            out.print("alert('Record Failed Update');");
            out.print("location='editClub.jsp';");
            out.print("</script>");
        } 
    }
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
%>