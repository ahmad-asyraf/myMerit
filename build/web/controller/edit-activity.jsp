<%-- 
    Document   : edit-activity
    Created on : 13 May 2023, 2:01:41 pm
    Author     : Asyraf
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mvc.util.DBConnection"%>
<%
    String activityName = request.getParameter("activityName");
    String clubName = request.getParameter("clubName");
    String desc = request.getParameter("desc");
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
    String activityID = request.getParameter("activityID");
    String contextPath = request.getContextPath();

    DBConnection con = new DBConnection();

    String sql = "UPDATE activity SET name=?, club=?, des=?, datestart=?, dateend=? WHERE acID=?";
    PreparedStatement ps = con.getConnection().prepareStatement(sql);
    ps.setString(1, activityName);
    ps.setString(2, clubName);
    ps.setString(3, desc);
    ps.setString(4, startDate);
    ps.setString(5, endDate);
    ps.setString(6, activityID);

    int row = ps.executeUpdate();
    if (row > 0) {
        out.print("<script type=\"text/javascript\">");
        out.print("alert('Activity edited successfully!');");
        out.print("location='" + contextPath + "/users/admin/manage-activity.jsp';");
        out.print("</script>");
    } else {
        out.print("<script type=\"text/javascript\">");
        out.print("alert('Failed to edit activity!');");
        out.print("location='" + contextPath + "/users/admin/edit-activity.jsp';");
        out.print("</script>");
    }
    con.closeConnection();
%>