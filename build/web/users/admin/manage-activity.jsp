<%@page import="java.sql.*"%>
<%@page import="com.mvc.util.DBConnection"%>
<%
    String username = (String) session.getAttribute("username");
    String position = (String) session.getAttribute("position");
    if (username == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }

    DBConnection con = new DBConnection();
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="../../layout/header.jsp" %>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="../../layout/admin-navbar.jsp" %>
        </div>

        <header id="portfolio">
            <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
            <div class="w3-container">
                <h1><b><center>LIST OF ACTIVITY</b></h1></center>
            </div>
        </header>

        <!-- Adding a table at the center of the page -->

        <div class="container">
            <div class="text-end mb-1">
                <a class="btn btn-primary" href="<%= request.getContextPath()%>/users/admin/create-activity.jsp">Create Activity</a>
            </div>
            <table class="table table-striped"> 
                <!-- Table Heading -->
                <thead class="table-primary"> 
                    <tr> 
                        <th>ID</th> 
                        <th>Name</th> 
                        <th>Club</th>
                        <th>Description</th> 
                        <th>Date Start </th>
                        <th>Date End</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr> 
                </thead> 
                <tbody>
                    <%
                        String sql = "SELECT * FROM activity";
                        PreparedStatement ps = con.getConnection().prepareStatement(sql);
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                    %>
                    <tr class="align-middle">
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td class="text-nowrap"><%=rs.getString(5)%></td>
                        <td class="text-nowrap"><%=rs.getString(6)%></td>
                        <td><a href="<%= request.getContextPath()%>/users/admin/edit-activity.jsp?id=<%=rs.getString(1)%>" class="btn btn-sm btn-primary">Edit</a></td>
                        <td><a href="<%= request.getContextPath()%>/controller/delete-activity.jsp?id=<%=rs.getString(1)%>" onclick="return confirm('Confirm to delete this activity?');" class="btn btn-sm btn-danger">Delete</a></td>
                    </tr>
                    <%
                        }
                        con.closeConnection();
                    %>
                </tbody>
            </table>          
        </div>
    </body>
</html>
