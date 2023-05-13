<%@page import="com.mvc.util.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
    String clubID = request.getParameter("id");
    DBConnection con = new DBConnection();
    String contextPath = request.getContextPath();

    String sql = "DELETE FROM admin WHERE clubID=?";
    PreparedStatement ps = con.getConnection().prepareStatement(sql);
    ps.setString(1, clubID);

    int i = ps.executeUpdate();
    if (i > 0) {
        out.print("<script type=\"text/javascript\">");
        out.print("alert('Record Delete Successfully');");
        out.print("location='" + contextPath + "/admin/main-page.jsp';");
        out.print("</script>");
    } else {
        out.print("<script type=\"text/javascript\">");
        out.print("alert('Record Failed Update');");
        out.print("location='" + contextPath + "/admin/main-page.jsp';");
        out.print("</script>");
    }
    con.closeConnection();
%>

