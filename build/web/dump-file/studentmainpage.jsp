<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
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
        <title>FYP</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
        <link rel="stylesheet"  href="adminpage1.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            body{
                margin-top:20px;
                color: #1a202c;
                text-align: left;
                background-color: white;
            }
            .main-body {
                padding: 15px;
            }
            .card {
                box-shadow: 0 1px 3px 0 rgba(0,0,0,.1), 0 1px 2px 0 rgba(0,0,0,.06);
            }

            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: white;
                background-clip: border-box;
                border: 0 solid rgba(0, 0, 0, 0.125);
                border-radius: .25rem;
            }

            .card-body {
                flex: 1 1 auto;
                min-height: 1px;
                padding: 1rem;
            }

            .gutters-sm {
                margin-right: -8px;
                margin-left: -8px;
            }

            .gutters-sm>.col, .gutters-sm>[class*=col-] {
                padding-right: 8px;
                padding-left: 8px;
            }
            .mb-3, .my-3 {
                margin-bottom: 1rem!important;
            }

            .bg-gray-300 {
                background-color: white;
            }
            .h-100 {
                height: 100%!important;
            }
            .shadow-none {
                box-shadow: none!important;
            }
        </style>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            String myURL = "jdbc:mysql://localhost/mymerit";
            Connection myConnection = DriverManager.getConnection(myURL, "root", "");
            String username = request.getParameter("username");

            PreparedStatement myStatement = myConnection.prepareStatement("SELECT fullname,matric,email,phone,address,faculty,course,image FROM register WHERE username=?");
            myStatement.setString(1, username);
            ResultSet myResultSet = myStatement.executeQuery();

            String fullname = "", matric = "", email = "", phone = "", address = "", faculty = "", course = "", image = "";

            while (myResultSet.next()) {
                fullname = myResultSet.getString(1);
                matric = myResultSet.getString(2);
                email = myResultSet.getString(3);
                phone = myResultSet.getString(4);
                address = myResultSet.getString(5);
                faculty = myResultSet.getString(6);
                course = myResultSet.getString(7);

                byte[] imageData = myResultSet.getBytes(8);
                image = Base64.getEncoder().encodeToString(imageData);
            }
        %> 
        <form class="form" action="processStudentPage" method="post" enctype="multipart/form-data">
            <div class="wrapper">
                <div class="navbar navbar_1">
                    <div class="logo">myMeritStar<span>Alert</span></div>
                    <ul class="menu">
                        <li><a href="studentPage.jsp?username=<%=username%>" >Main Page</a></li>
                        <li><a href="studentmainpage.jsp?username=<%=username%>">Profile</a></li>
                        <li><a href="" >Merit</a></li>
                        <li><a href="activityJoin.jsp?username=<%=username%>" >Activity Join</a></li>
                        <li><a href="mainpage.jsp?username=<%=username%>" >Logout</a></li>
                    </ul>
                </div>
            </div>
            <div class="container">
                <div class="main-body">
                    <div class="row gutters-sm">
                        <div class="col-md-4 mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex flex-column align-items-center text-center">
                                        <img src="data:image/png;base64,<%=image%>" alt="Admin" class="rounded-circle" width="150">
                                        <div class="mt-3">
                                            <h4><%=fullname%></h4>
                                            <p class="text-secondary mb-1"><%=matric%></p>
                                            <p class="text-muted font-size-sm"><%=course%></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-8">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Full Name</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary"><%=fullname%>
                                        </div>
                                    </div>
                                    <hr>

                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Matric Number</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary"> <%=matric%>
                                        </div>
                                    </div>
                                    <hr>

                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Email</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary"> <%=email%>
                                        </div>
                                    </div>
                                    <hr>

                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Phone(+60)</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary"><%=phone%>
                                        </div>
                                    </div>
                                    <hr>

                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Address</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary"> <%=address%>
                                        </div>
                                    </div>
                                    <hr>

                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Faculty</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary"> <%=faculty%>
                                        </div>
                                    </div>
                                    <hr>

                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Course</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary"> <%=course%>
                                        </div>
                                    </div>
                                    <hr>

                                    <div class="row">
                                        <div class="col-sm-12">
                                            <a class="btn btn-info " target="__blank" href="studenteditprofile.jsp?id=<%=username%>">Edit</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>