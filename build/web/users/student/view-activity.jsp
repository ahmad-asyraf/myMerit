<%@page import="java.sql.*"%>
<%@page import="com.mvc.util.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }

    DBConnection connection = new DBConnection();
    Statement statement = null;
    ResultSet resultSet = null;
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
                <h1><b><center>LIST OF ACTIVITY</b></h1></center>
            </div>
        </header>

        <div class="container">
            <table class="table"> 
                <!-- Table Heading -->
                <thead> 
                    <tr> 
                        <th>#</th> 
                        <th>Name</th> 
                        <th>Club</th>
                        <th>Description</th> 
                        <th class="text-nowrap">Date Start </th>
                        <th class="text-nowrap">Date End</th>
                        <th class="text-nowrap">Platform</th>
                        <th class="text-nowrap">Place</th>
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

                            Class.forName("com.mysql.jdbc.Driver");
                            String myURL = "jdbc:mysql://localhost:3306/mymerit";
                            Connection myConnection = DriverManager.getConnection(myURL, "root", "");

                            try {

                                PreparedStatement myStatement = myConnection.prepareStatement("SELECT acID,username FROM studentactivity WHERE username=?");
                                myStatement.setString(1, username);
                                ResultSet myResultSet = myStatement.executeQuery();
                                ResultSet rs = null;

                                while (myResultSet.next()) {
                                    PreparedStatement myStatement1 = myConnection.prepareStatement("SELECT * FROM activity WHERE acID=?");
                                    myStatement1.setInt(1, myResultSet.getInt("acID"));
                                    rs = myStatement1.executeQuery();

                                    while (rs.next()) {

                                        name = rs.getString("name");
                                        club = rs.getString("club");
                                        des = rs.getString("des");
                                        datestart = rs.getString("datestart");
                                        dateend = rs.getString("dateend");
                                        platform = rs.getString("platform");
                                        place = rs.getString("place");
                        %>
                        <td class="align-middle"><%= i++%></td>
                        <td class="align-middle"><%=name%></td> 
                        <td class="align-middle"><%=club%></td>
                        <td class="align-middle"><%=des%></td> 
                        <td class="text-nowrap align-middle"><%=datestart%></td>
                        <td class="text-nowrap align-middle"><%=dateend%></td>
                        <td class="align-middle"><%=platform%></td>
                        <td class="align-middle"><%=place%></td>
                    </tr>
                    <%
                                }
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </tbody>
            </table>          
        </div>
    </body>
</html>

