<%-- 
    Document   : edit-club
    Created on : 12 May 2023, 8:12:54 pm
    Author     : Asyraf
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mvc.util.DBConnection"%>
<%
    String clubName = request.getParameter("clubName");
    String desc = request.getParameter("desc");
    String faculty = request.getParameter("faculty");
    String clubEmail = request.getParameter("clubEmail");
    String clubID = request.getParameter("clubID");
    String contextPath = request.getContextPath();

    DBConnection con = new DBConnection();

    String sql = "UPDATE admin SET club=?, des=?, faculty=?, email=? WHERE clubID=?";
    PreparedStatement ps = con.getConnection().prepareStatement(sql);
    ps.setString(1, clubName);
    ps.setString(2, desc);
    ps.setString(3, faculty);
    ps.setString(4, clubEmail);
    ps.setString(5, clubID);

    int row = ps.executeUpdate();
    if (row > 0) {
        out.print("<script type=\"text/javascript\">");
        out.print("alert('Club edited successfully!');");
        out.print("location='" + contextPath + "/users/admin/main-page.jsp';");
        out.print("</script>");
    } else {
        out.print("<script type=\"text/javascript\">");
        out.print("alert('Failed to edit club!');");
        out.print("location='" + contextPath + "/users/admin/edit-club.jsp';");
        out.print("</script>");
    }
    con.closeConnection();
%>
