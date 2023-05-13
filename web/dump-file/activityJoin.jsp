<%@page import="java.sql.*"%>
<%@ include file = "dbcon.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%  Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>FYP</title>
        <link rel="stylesheet" href="adminpage2.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
    </head>
    <body>
        <% String username = request.getParameter("username");%>
        <div class="wrapper">
            <div class="navbar navbar_1">
                <div class="logo">myMeritStar<span>Alert</span></div>
                <ul class="menu">
                    <li><a href="studentPage.jsp?username=<%=username%>" >Main Page</a></li>
                    <li><a href="studentmainpage.jsp?username=<%=username%>">Profile</a></li>
                    <li><a href="" >Merit</a></li>
                    <li><a href="activityJoin.jsp?username=<%=username%>" >Activity Join</a></li>
                    <li><a href="main.jsp?username=<%=username%>" >Logout</a></li>
                </ul>
            </div>
        </div>

        <header id="portfolio">
            <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
            <div class="w3-container">
                <h1><b><center>LIST OF ACTIVITY</b></h1></center>
            </div>
        </header>

        <div class="w3-container w3-center">
            <table class="w3-table"> 
                <!-- Table Heading -->
                <thead> 
                    <tr> 
                        <th>Name</th> 
                        <th>Club</th>
                        <th>Description</th> 
                        <th>Date Start </th>
                        <th>Date End</th>
                        <th>Platform</th>
                        <th>Place</th>
                    </tr> 
                </thead> 
                <%
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
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
                <td><%=name%></td> 
                <td><%=club%></td>
                <td><%=des%></td> 
                <td><%=datestart%></td>
                <td><%=dateend%></td>
                <td><%=platform%></td>
                <td><%=place%></td>
            </table>          
        </div>
    </body>
</html>

