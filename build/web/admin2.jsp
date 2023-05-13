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
        <head>

            <!-- Adding W3.CSS file through external link -->
            <link rel="stylesheet"
                  href="https://www.w3schools.com/w3css/4/w3.css">
        </head>



        <body>

            <form action="registerMember.jsp" source="custom" name="form" style="padding: 10px;">
                <div class="wrapper">
                    <div class="registration_form">
                        <div class="title">
                            Registration Form
                        </div>

                        <form>
                            <div class="form_wrap">
                                <div class="input_grp">

                                </div>
                                <div class="input_wrap">
                                    <label for="fullname">Fullname</label>
                                    <input type="text" id="fullname" name="fullname">
                                </div>

                                <div class="input_wrap">
                                    <label for="matric">Matric Number</label>
                                    <input type="text" id="matric" name="matric">
                                </div>

                                <div class="input_wrap">
                                    <label for="username">Username</label>
                                    <input type="text" id="username" name="username">
                                </div>

                                <div class="input_wrap">
                                    <label for="password">Password</label>
                                    <input type="text" id="password" name="password">
                                </div>

                                <div class="input_wrap">
                                    <label for="email">Email</label>
                                    <input type="email" id="email" name="email">
                                </div>

                                <div class="input_wrap">
                                    <label>Position</label>
                                    <ul>
                                        <li>
                                            <label class="radio_wrap">
                                                <input type="radio" name="position" value="admin" class="input_radio" checked>
                                                <span>Admin</span>
                                            </label>
                                            <label class="radio_wrap">
                                                <input type="radio" name="position" value="staff" class="input_radio" checked>
                                                <span>Staff</span>
                                            </label>
                                            <label class="radio_wrap">
                                                <input type="radio" name="position" value="member" class="input_radio" checked>
                                                <span>Club Member</span>
                                                </div>


                                                <div class="input_wrap">
                                                    <label  id="club" >Club</label>

                                                    <select name="club">
                                                        <option >Select</option>
                                                        <% try {
                                                                Class.forName("com.mysql.jdbc.Driver");
                                                                String myURL = "jdbc:mysql://localhost/mymerit";
                                                                Connection myConnection = DriverManager.getConnection(myURL, "root", "");
                                                                Statement myStatement = myConnection.createStatement();
                                                                String myQuery = "SELECT club FROM admin";
                                                                ResultSet myResultSet = myStatement.executeQuery(myQuery);
                                                                while (myResultSet.next()) {
                                                        %>
                                                        <option value="<%=myResultSet.getString("club")%>"><%=myResultSet.getString("club")%></option>
                                                        <%
                                                                }
                                                            } catch (Exception e) {
                                                            }
                                                        %>


                                                    </select>        
                                                    <div class="input_wrap">
                                                        <br>
                                                        <input href="admin2 "type="submit" value="Register Now" class="submit_btn" name="btn_register">
                                                    </div>


                                                </div>
                                                </form>


                                                </body>
                                                </html>


