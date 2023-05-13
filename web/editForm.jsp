<%@page import="com.mvc.util.DBConnection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String id = request.getParameter("id");
    Connection connection = DBConnection.getConnection();
    Statement statement = null;
    ResultSet resultSet = null;

    String fullname = "";
    String matric = "";
    String username = "";
    String password = "";
    String email = "";
    try {

        statement = connection.createStatement();
        String sql = "select * from register where registerID=" + id;
        resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
            fullname = resultSet.getString("fullname");
            matric = resultSet.getString("matric");
            username = resultSet.getString("username");
            password = resultSet.getString("password");
            email = resultSet.getString("email");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

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
                    <li><a href="admin.jsp" >Add Club</a></li>
                    <li><a href="admin2.jsp" >Register User</a></li>
                    <li><a href="admin3.jsp" >Manage User</a></li>
                    <li><a href="" >Issue</a></li>
                    <li><a href="mainpage.jsp" >Logout</a></li>
                </ul>
            </div>

        </div>


    <html>
        <head>
            <link rel="stylesheet"
                  href="https://www.w3schools.com/w3css/4/w3.css">
        </head>



        <body>


            <div class="wrapper">
                <div class="registration_form">
                    <form action="registerAdmin.jsp" source="custom" name="form" style="padding: 10px;">
                        <div class="title">
                            Edit User
                        </div>
                        <div class="form_wrap">
                            <div class="input_wrap">
                                <label for="fullname">Fullname</label>
                                <input type="text" value="<%=fullname%>" id="fullname" name="fullname">
                            </div>

                            <div class="input_wrap">
                                <label for="matric">Matric Number</label>
                                <input type="text" value="<%=matric%>" id="matric" name="matric">
                            </div>

                            <div class="input_wrap">
                                <label for="username">Username</label>
                                <input type="text" value="<%=username%>" id="username" name="username">
                            </div>

                            <div class="input_wrap">
                                <label for="password">Password</label>
                                <input type="text" value="<%=password%>" id="password" name="password">
                            </div>

                            <div class="input_wrap">
                                <label for="email">Email</label>
                                <input type="email" value="<%=email%>" id="email" name="email">
                            </div>

                            <div class="input_wrap">
                                <input type="hidden" value="<%=id%>" name="id">
                                <input type="submit" value="Finish Edit" class="submit_btn" name="btn_register">
                            </div>


                        </div>
                    </form>


                    <!-- End page content -->
                </div>
            </div>

        </body>
    </html>


