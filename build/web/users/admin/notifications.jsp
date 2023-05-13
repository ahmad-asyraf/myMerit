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
                <h1><b><center>NOTIFICATIONS</b></h1></center>
            </div>
        </header>

        <!-- Adding a table at the center of the page -->

        <div class="container">
            <table class="table table-striped"> 
                <!-- Table Heading -->
                <thead> 
                    <tr>
                        <th>#</th>
                        <th>Name</th> 
                        <th>Description</th> 
                        <th>Faculty</th> 
                        <th>Email</th> 
                        <th>Accept</th>
                        <th>Reject</th>
                </thead> 
                <tbody>
                    <%
                        int i = 1;
                        String sql = "SELECT  pdgID, pdgName, pdgDes, pdgFaculty, pdgEmail FROM pending";
                        PreparedStatement ps = con.getConnection().prepareStatement(sql);
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                    %>
                    <tr class="align-middle">
                        <td><%=i++%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><a href="<%%>/controller/accept.jsp" onclick="return confirm('Accept this permission?');" class="btn btn-sm btn-primary">Accept</a></td>
                        <td><a href="<%%>/controller/reject.jsp" onclick="return confirm('Reject this permission?');" class="btn btn-sm btn-danger">Reject</a></td>
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
