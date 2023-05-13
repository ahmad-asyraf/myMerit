<%@page import="com.mvc.util.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/mymerit";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
    String id = request.getParameter("id");
    
    String name=request.getParameter("name");
    String club=request.getParameter("club");
    String des=request.getParameter("des");
    String datestart=request.getParameter("datestart");
    String dateend=request.getParameter("dateend");
    
    int acID = Integer.parseInt(id);
    
    Connection connection = DBConnection.getConnection();

    try
    {
        PreparedStatement ps =connection.prepareStatement("Update activity set name=?,club=?,des=?,datestart=?,dateend=? where acID=?");
        ps.setString(1, name);
        ps.setString(2, club);
        ps.setString(3, des);
        ps.setString(4, datestart);
        ps.setString(5, dateend);
        ps.setInt(6, acID);
        int i = ps.executeUpdate();
        if(i > 0)
        {
            out.print("<script type=\"text/javascript\">");
            out.print("alert('Record Updated Successfully');");
            out.print("location='manageactivity.jsp?id="+id+"';");
            out.print("</script>");
        }
        else
        {
            out.print("<script type=\"text/javascript\">");
            out.print("alert('Record Failed Update');");
            out.print("location='activityForm.jsp?id="+id+"';");
            out.print("</script>");
        } 
    }
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
%>
