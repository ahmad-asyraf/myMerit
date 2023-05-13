<%@page import="java.sql.*"%>
<%@page import="com.mvc.util.DBConnection"%>
<%@page errorPage="../../controller/ErrorPage.jsp" %>
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
                <h1><b><center>LIST OF USERS</center></b></h1>
            </div>
        </header>

        <!-- Adding a table at the center of the page -->

        <div class="container">
            <div class="text-end mb-1">
                <a class="btn btn-primary" href="<%= request.getContextPath()%>/users/admin/create-user.jsp">Create User</a>
            </div>
            <table class="table table-striped"> 
                <!-- Table Heading -->
                <thead class="table-primary"> 
                    <tr> 
                        <th>ID</th> 
                        <th>Name</th> 
                        <th>Matric Number</th> 
                        <th>Username</th>
                        <th>Position</th>
                        <th>Email</th>
                        <th>Club</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr> 
                </thead> 
                <tbody>
                    <%
                        String sql = "SELECT * FROM register";
                        PreparedStatement ps = con.getConnection().prepareStatement(sql);
                        ResultSet rs = ps.executeQuery(sql);
                        while (rs.next()) {
                    %>
                    <tr class="align-middle">
                        <td><%= rs.getString(1)%></td>
                        <td><%= rs.getString(2)%></td>
                        <td><%= rs.getString(3)%></td>
                        <td><%= rs.getString(4)%></td>
                        <td><%= rs.getString(6)%></td>
                        <td><%= rs.getString(7)%></td>
                        <td><%= rs.getString(8)%></td>
                        <td><a href="<%= request.getContextPath()%>/users/admin/edit-user.jsp?id=<%= rs.getString(1)%>" class="btn btn-sm btn-primary">Edit</a></td>
                        <td><a href="<%= request.getContextPath()%>/controller/delete-user.jsp?id=<%= rs.getString(1)%>" onclick="return confirm('Confirm to delete this club?');" class="btn btn-sm btn-danger">Delete</a></td>
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
