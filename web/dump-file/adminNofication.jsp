<%@page import="java.sql.PreparedStatement"%>
<%@ include file = "dbcon.jsp" %>
<%    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>FYP</title>
        <link rel="stylesheet" href="activityReg.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
    </head>
    <body>

        <div class="wrapper">
            <div class="navbar navbar_1">
                <div class="logo">myMeritStar<span>Alert</span></div>
                <ul class="menu">
                    <li><a href="adminClub.jsp" >Manage Club</a></li>
                    <li><a href="admin2.jsp" >Register User</a></li>
                    <li><a href="admin3.jsp" >Manage User</a></li>
                    <li><a href="" >Notification</a></li>
                    <li><a href="main.jsp" >Logout</a></li>
                </ul>
            </div>

        </div>

    <html>


        <body>

            <div class="title">
                LIST OF CLUBS
            </div>

            <!-- Adding a table at the center of the page -->

            <table class="w3-table"> 
                <!-- Table Heading -->
                <thead> 
                    <tr> 

                        <th>Name</th> 
                        <th>Description</th> 
                        <th>Faculty</th> 
                        <th>Email</th> 
                        <th>Accept</th>
                        <th>Reject</th>
                </thead> 

                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    String myURL = "jdbc:mysql://localhost:3306/mymerit";
                    Connection myConnection = DriverManager.getConnection(myURL, "root", "");
                    Statement myStatement = myConnection.createStatement();
                    String myQuery = "SELECT  pdgID, pdgName, pdgDes, pdgFaculty, pdgEmail FROM pending";
                    ResultSet myResultSet = myStatement.executeQuery(myQuery);
                    while (myResultSet.next()) {
                        out.print("<tr>");
                        out.print("<td>" + myResultSet.getString(2) + "</td>");
                        out.print("<td>" + myResultSet.getString(3) + "</td>");
                        out.print("<td>" + myResultSet.getString(4) + "</td>");
                        out.print("<td>" + myResultSet.getString(5) + "</td>");
                        out.print("<td>" + "<a href='accept?pdgID=" + myResultSet.getInt(1) + "'>Accept</a></td>");
                        out.print("<td>" + "<a href='" + myResultSet.getString(1) + "'>Reject</a></td>");
                        out.print("</tr>");
                    }
                    myConnection.close();
                    out.print("</tbody>");
                    out.print("</table>");
                %>

            </div>
    </body>
</html>
