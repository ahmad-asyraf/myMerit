<%-- 
    Document   : view-merit
    Created on : 13 May 2023, 2:31:47 am
    Author     : Asyraf
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mvc.util.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
    String username = (String) session.getAttribute("username");
    String position = (String) session.getAttribute("position");
    if (username == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
    
    DBConnection con = new DBConnection();
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="../../layout/header.jsp" %>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="../../layout/navbar.jsp" %>
        </div>

        <header id="portfolio">
            <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
            <div class="w3-container">
                <h1><b><center>LIST OF MERIT</b></h1></center>
            </div>
        </header>

        <div class="container">
            <table class="table"> 
                <!-- Table Heading -->
                <thead> 
                    <tr class="text-nowrap"> 
                        <th>#</th> 
                        <th>Program Name</th> 
                        <th>Club</th>
                        <th class="text-nowrap">Date Start</th>
                        <th class="text-nowrap">Date End</th>
                        <th class="text-nowrap">Platform</th>
                        <th class="text-nowrap">Merit</th>
                    </tr> 
                </thead> 
                <tbody>
                    <tr>
                        <%
                            int i = 1;
                            String name = "";
                            String club = "";
                            String des = "";
                            String datestart = "";
                            String dateend = "";
                            String platform = "";
                            String place = "";
                            int merit;

                            String sql = "SELECT acID,username FROM studentactivity WHERE username=?";
                            PreparedStatement ps = con.getConnection().prepareStatement(sql);
                            ps.setString(1, username);
                            ResultSet myResultSet = ps.executeQuery();
                            ResultSet rs = null;
                            int total = 0;

                            while (myResultSet.next()) {
                                PreparedStatement ps1 = con.getConnection().prepareStatement("SELECT * FROM activity WHERE acID=?");
                                ps1.setInt(1, myResultSet.getInt("acID"));
                                rs = ps1.executeQuery();

                                while (rs.next()) {

                                    name = rs.getString("name");
                                    club = rs.getString("club");
                                    des = rs.getString("des");
                                    datestart = rs.getString("datestart");
                                    dateend = rs.getString("dateend");
                                    platform = rs.getString("platform");
                                    place = rs.getString("place");
                                    merit = Integer.parseInt(rs.getString("activitymerit"));
                                    total += merit;
                        %>
                        <td class="align-middle"><%= i++%></td>
                        <td class="align-middle"><%=name%></td> 
                        <td class="align-middle"><%=club%></td>
                        <td class="text-nowrap align-middle"><%=datestart%></td>
                        <td class="text-nowrap align-middle"><%=dateend%></td>
                        <td class="align-middle"><%=platform%></td>
                        <td class="align-middle text-center"><%=merit%></td>
                    </tr>
                    <%
                            }
                        }
                        con.closeConnection();
                    %>
                </tbody>
                <tfoot>
                    <tr class="table-primary text-center">
                        <th colspan="6">Total</th>
                        <td><%=total%></td>
                    </tr>
                </tfoot>
            </table>          
        </div>
    </body>
</html>


