<%-- 
    Document   : delete-user
    Created on : 12 May 2023, 9:13:15 pm
    Author     : Asyraf
--%>

<%@page import="com.mvc.util.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
    String userID = request.getParameter("id");
    DBConnection con = new DBConnection();
    String contextPath = request.getContextPath();

    String sql = "DELETE FROM register WHERE registerID=?";
    PreparedStatement ps = con.getConnection().prepareStatement(sql);
    ps.setString(1, userID);

    int i = ps.executeUpdate();
    if (i > 0) {
        out.print("<script type=\"text/javascript\">");
        out.print("alert('User deleted successfully!');");
        out.print("location='" + contextPath + "/users/admin/manage-user.jsp';");
        out.print("</script>");
    } else {
        out.print("<script type=\"text/javascript\">");
        out.print("alert('Failed to delete user!');");
        out.print("location='" + contextPath + "/users/admin/manage-user.jsp';");
        out.print("</script>");
    }
    con.closeConnection();
%>


