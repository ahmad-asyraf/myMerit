<%-- 
    Document   : delete-activity
    Created on : 13 May 2023, 2:38:51 pm
    Author     : Asyraf
--%>

<%@page import="com.mvc.util.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
    String activityID = request.getParameter("id");
    DBConnection con = new DBConnection();
    String contextPath = request.getContextPath();

    String sql = "DELETE FROM activity WHERE acID=?";
    PreparedStatement ps = con.getConnection().prepareStatement(sql);
    ps.setString(1, activityID);

    int i = ps.executeUpdate();
    if (i > 0) {
        out.print("<script type=\"text/javascript\">");
        out.print("alert('Activity deleted successfully!');");
        out.print("location='" + contextPath + "/users/admin/manage-activity.jsp';");
        out.print("</script>");
    } else {
        out.print("<script type=\"text/javascript\">");
        out.print("alert('Failed to delete activity!');");
        out.print("location='" + contextPath + "/users/admin/manage-activity.jsp';");
        out.print("</script>");
    }
    con.closeConnection();
%>


