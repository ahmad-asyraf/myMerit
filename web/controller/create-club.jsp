<%-- 
    Document   : register-user
    Created on : 12 May 2023, 7:34:27 pm
    Author     : Asyraf
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mvc.util.DBConnection"%>
<%
    String clubName = request.getParameter("clubName");
    String desc = request.getParameter("desc");
    String faculty = request.getParameter("faculty");
    String clubEmail = request.getParameter("clubEmail");
    String contextPath = request.getContextPath();

    DBConnection con = new DBConnection();

    String sql = "INSERT INTO admin (club, des, faculty, email) VALUES (?,?,?,?)";
    PreparedStatement ps = con.getConnection().prepareStatement(sql);
    ps.setString(1, clubName);
    ps.setString(2, desc);
    ps.setString(3, faculty);
    ps.setString(4, clubEmail);

    int row = ps.executeUpdate();
    if (row > 0) {
        out.print("<script type=\"text/javascript\">");
        out.print("alert('Club created successfully!');");
        out.print("location='" + contextPath + "/users/admin/main-page.jsp';");
        out.print("</script>");
    } else {
        out.print("<script type=\"text/javascript\">");
        out.print("alert('Failed to create club!');");
        out.print("location='" + contextPath + "/users/admin/create-club.jsp';");
        out.print("</script>");
    }
    con.closeConnection();
%>
