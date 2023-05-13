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



    <body>

        <header id="portfolio">

            <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
            <div class="w3-container">
                <h1><b><center>LIST OF USER</center></b></h1>

            </div>
        </header>

        <!-- Adding a table at the center of the page -->

        <div class="w3-container w3-center">
            <table class="w3-table"> 
                <!-- Table Heading -->
                <thead> 
                    <tr> 
                        <th>Id.</th> 
                        <th>Name</th> 
                        <th>Matric Number</th> 
                        <th>Username</th>
                        <th>Position</th>
                        <th>Email</th>
                        <th>Club</th>
                        <th>Edit</th>
                        <th>Delete<th>

                    </tr> 
                </thead> 

                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    String myURL = "jdbc:mysql://localhost/mymerit";
                    Connection myConnection = DriverManager.getConnection(myURL, "root", "");
                    Statement myStatement = myConnection.createStatement();
                    String myQuery = "SELECT registerID, fullname,matric,username,position,email,club FROM register";
                    ResultSet myResultSet = myStatement.executeQuery(myQuery);
                    while (myResultSet.next()) {
                        out.print("<tr>");
                        out.print("<td>" + myResultSet.getString(1) + "</td>");
                        out.print("<td>" + myResultSet.getString(2) + "</td>");
                        out.print("<td>" + myResultSet.getString(3) + "</td>");
                        out.print("<td>" + myResultSet.getString(4) + "</td>");
                        out.print("<td>" + myResultSet.getString(5) + "</td>");
                        out.print("<td>" + myResultSet.getString(6) + "</td>");
                        out.print("<td>" + myResultSet.getString(7) + "</td>");
                        out.print("<td>" + "<a href='editForm.jsp?id=" + myResultSet.getString(1) + "'>edit</a></td>");
                        out.print("<td>" + "<a href='deleteuser.jsp?id=" + myResultSet.getString(1) + "'>delete</a></td>");
                        out.print("</tr>");
                    }
                    myConnection.close();
                    out.print("</tbody>");
                    out.print("</table>");
                %>


            </table>

            <%
                int registerID = 0;
                try {
                    statement = conn.createStatement();
                    String sql = "select * from register where registerID=" + registerID;
                    resultSet = statement.executeQuery(sql);
                    while (resultSet.next()) {
            %>

            <form method="post" action="editProcess.jsp">
                <div class="row mb-3">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">registerID</label>
                    <div class="col-sm-10">
                        <input type="hidden" name="registerID" value="<%=resultSet.getString("registerID")%>">
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">FullName</label>
                    <div class="col-sm-10">
                        <input type="text" name="fullname" value="<%=resultSet.getString("fullname")%>">
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Matric</label>
                    <div class="col-sm-10">
                        <input type="text" name="matric" value="<%=resultSet.getString("matric")%>">
                    </div>
                </div>
                <div class="input_wrap">
                    <label>Position</label>
                    <label class="radio_wrap">
                        <input type="radio" name="position" value="admin" class="input_radio" checked>
                        <span>Admin</span>
                    </label>
                    <label class="radio_wrap">
                        <input type="radio" name="position" value="club" class="input_radio" checked>
                        <span>Club Member</span>
                    </label>
                    <label class="radio_wrap">
                        <input type="radio" name="position" value="staff" class="input_radio" checked>
                        <span>Staff</span>
                    </label>



                </div>
                <div class="row mb-3">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Club</label>
                    <div class="col-sm-10">
                        <input type="text" name="club" value="<%=resultSet.getString("club")%>">
                    </div>
                </div>

                <div class="text-center">
                    <input type="submit" value="Submit">
                </div>
            </form>

            <%
                    }
                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>


        </div>
    </body>
</html>
