<%-- 
    Document   : create-user
    Created on : 12 May 2023, 8:40:53 pm
    Author     : Asyraf
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mvc.util.DBConnection"%>
<%
    String fullName = request.getParameter("fullName");
    String matric = request.getParameter("matric");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String position = request.getParameter("position");
    String clubName = request.getParameter("clubName");
    String contextPath = request.getContextPath();

    DBConnection con = new DBConnection();

    String sql = "INSERT INTO register (fullname, matric, username, password, position, email, club) VALUES (?,?,?,?,?,?,?)";
    PreparedStatement ps = con.getConnection().prepareStatement(sql);
    ps.setString(1, fullName);
    ps.setString(2, matric);
    ps.setString(3, username);
    ps.setString(4, password);
    ps.setString(5, position);
    ps.setString(6, email);
    ps.setString(7, clubName);

    int row = ps.executeUpdate();
    if (row > 0) {
        out.print("<script type=\"text/javascript\">");
        out.print("alert('User created successfully!');");
        out.print("location='" + contextPath + "/users/admin/manage-user.jsp';");
        out.print("</script>");
    } else {
        out.print("<script type=\"text/javascript\">");
        out.print("alert('Failed to create user!');");
        out.print("location='" + contextPath + "/users/admin/create-user.jsp';");
        out.print("</script>");
    }
    con.closeConnection();
%>
