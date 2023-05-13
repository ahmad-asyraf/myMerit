<%-- 
    Document   : join-activity
    Created on : 12 May 2023, 11:45:58 am
    Author     : Asyraf
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mvc.util.DBConnection"%>
<%= request.getParameter("acID")%>
<%= request.getParameter("username")%>
<%
    String acID = request.getParameter("acID");
    String username = request.getParameter("username");
    String contextPath = request.getContextPath();

    DBConnection con = new DBConnection();

    String sql_check = "SELECT * FROM studentactivity WHERE acID=? AND username=?";
    PreparedStatement ps_check = con.getConnection().prepareStatement(sql_check);
    ps_check.setString(1, acID);
    ps_check.setString(2, username);

    ResultSet rs = ps_check.executeQuery();
    if (rs.next()) {
        // Record already exists, show error message
        out.print("<script type=\"text/javascript\">");
        out.print("alert('Already registered');");
        out.print("location='" + contextPath + "/users/student/view-activity.jsp';");
        out.print("</script>");
    } else {
        // Record does not exist, insert a new record
        String sql = "INSERT INTO studentactivity (acID, username) VALUES (?, ?)";
        PreparedStatement ps = con.getConnection().prepareStatement(sql);
        ps.setString(1, acID);
        ps.setString(2, username);

        int row = ps.executeUpdate();

        if (row > 0) {
            out.print("<script type=\"text/javascript\">");
            out.print("alert('Success');");
            out.print("location='" + contextPath + "/users/student/view-activity.jsp';");
            out.print("</script>");
        } else {
            out.print("<script type=\"text/javascript\">");
            out.print("alert('Failed');");
            out.print("location='" + contextPath + "/users/student/view-activity.jsp';");
            out.print("</script>");
        }
    }
    con.closeConnection();
%>
