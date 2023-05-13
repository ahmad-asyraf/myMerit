<%@page import="java.sql.Connection"%>
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
        <link rel="stylesheet" href="adminpage2.css">
        <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
    </head>
    <body>
        
        <%            String username = request.getParameter("username");
        %>

        <div class="wrapper">
            <div class="navbar navbar_1">
                <div class="logo">myMeritStar<span>Alert</span></div>
                <ul class="menu">
                    <li><a href="activitypage.jsp?username=<%=username%>" >Register Club</a></li>
                    <li><a href="manageactivity.jsp?username=<%=username%>" >Manage Activity</a></li>
                    <li><a href="mainpage.jsp?username=<%=username%>" >Logout</a></li>
                </ul>
            </div>

        </div>


    <html>
        <head>

            <!-- Adding W3.CSS file through external link -->
            <link rel="stylesheet"
                  href="https://www.w3schools.com/w3css/4/w3.css">
        </head>



        <body>

            <header id="portfolio">

                <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
                <div class="w3-container">
                    <h1><b><center>LIST OF ACTIVITY</b></h1></center>

                </div>
            </header>


        <body>


            <!-- Adding a table at the center of the page -->

            <div class="w3-container w3-center">
                <table class="w3-table"> 
                    <!-- Table Heading -->
                    <thead> 
                        <tr> 
                            <th>Id.</th> 
                            <th>Name</th> 
                            <th>Club</th>
                            <th>Description</th> 
                            <th>Date Start </th>
                            <th>Date End</th>
                            <th>Edit</th>
                            <th>Delete<th>

                        </tr> 
                    </thead> 

                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        String myURL = "jdbc:mysql://localhost/mymerit";
                        Connection myConnection = DriverManager.getConnection(myURL, "root", "");
                        Statement myStatement = myConnection.createStatement();
                        String myQuery = "SELECT acID,name,club,des,datestart,dateend FROM activity";
                        ResultSet myResultSet = myStatement.executeQuery(myQuery);
                        while (myResultSet.next()) {
                            out.print("<tr>");
                            out.print("<td>" + myResultSet.getString(1) + "</td>");
                            out.print("<td>" + myResultSet.getString(2) + "</td>");
                            out.print("<td>" + myResultSet.getString(3) + "</td>");
                            out.print("<td>" + myResultSet.getString(4) + "</td>");
                            out.print("<td>" + myResultSet.getString(5) + "</td>");
                            out.print("<td>" + myResultSet.getString(6) + "</td>");
                            out.print("<td>" + "<a href='activityForm.jsp?id=" + myResultSet.getString(1) + "'>edit</a></td>");
                            out.print("<td>" + "<a href='deleteactivity.jsp?id=" + myResultSet.getString(1) + "'>delete</a></td>");
                            out.print("</tr>");
                        }
                        myConnection.close();
                        out.print("</tbody>");
                        out.print("</table>");
                    %>


                </table>          
            </div>
        </body>
    </html>
