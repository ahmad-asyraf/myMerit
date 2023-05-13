<%-- 
    Document   : processRegisterActivity
    Created on : 11 May 2023, 9:51:20 pm
    Author     : Asyraf
--%>

<%@page import="com.mvc.util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, java.util.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>

<%
    String name = request.getParameter("name");
    String club = request.getParameter("club");
    String desc = request.getParameter("desc");
    String dateStart = request.getParameter("dateStart");
    String dateEnd = request.getParameter("dateEnd");
    String platform = request.getParameter("platform");
    String place = request.getParameter("place");
    String merit = request.getParameter("merit");
    String participant = request.getParameter("participant");
    String contextPath = request.getContextPath();
//    String image = request.getParameter("image");

    DBConnection con = new DBConnection();
    PreparedStatement ps = null;
//    InputStream inputStream = null;
//    Part filePart = request.getPart("image"); // get the image from the form

//    if (filePart != null) {
//        // obtains input stream of the image
//        inputStream = filePart.getInputStream();
//    }
    String sql = "INSERT INTO activity (name, club, des, datestart, dateend, platform, place, activitymerit, total) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    ps = con.getConnection().prepareStatement(sql);
    ps.setString(1, name);
    ps.setString(2, club);
    ps.setString(3, desc);
    ps.setString(4, dateStart);
    ps.setString(5, dateEnd);
    ps.setString(6, platform);
    ps.setString(7, place);
    ps.setString(8, merit);
    ps.setString(9, participant);

//    if (inputStream != null) {
//        // fetches input stream of the upload file for the blob column
//        ps.setBlob(11, inputStream);
//    }
    // sends the statement to the database server
    int row = ps.executeUpdate();
    if (row > 0) {
        out.print("<script type=\"text/javascript\">");
        out.print("alert('Activity created successfully!');");
        out.print("location='" + contextPath + "/users/admin/manage-activity.jsp';");
        out.print("</script>");
    } else {
        out.print("<script type=\"text/javascript\">");
        out.print("alert('Failed to create activity!');");
        out.print("location='" + contextPath + "/users/admin/create-activity.jsp';");
        out.print("</script>");
    }
    con.closeConnection();
%>

