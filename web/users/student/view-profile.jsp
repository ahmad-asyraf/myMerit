<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="com.mvc.util.DBConnection"%>
<%@page import="java.sql.*"%>
<%@page errorPage="../../controller/error.jsp" %>
<%
    String username = (String) session.getAttribute("username");
    String position = (String) session.getAttribute("position");
    if (username == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }

    DBConnection connection = new DBConnection();

    String sql = "SELECT fullname,matric,email,phone,address,faculty,course,image FROM register WHERE username=?";
    PreparedStatement ps = connection.getConnection().prepareStatement(sql);
    ps.setString(1, username);
    ResultSet rs = ps.executeQuery();

    String fullname = "", matric = "", email = "", phone = "", address = "", faculty = "", course = "", image = "";

    while (rs.next()) {
        fullname = rs.getString(1);
        matric = rs.getString(2);
        email = rs.getString(3);
        phone = rs.getString(4);
        address = rs.getString(5);
        faculty = rs.getString(6);
        course = rs.getString(7);

        byte[] imageData = rs.getBytes(8);
        image = Base64.getEncoder().encodeToString(imageData);
    }
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="../../layout/header.jsp" %>
        <style>
            @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap");
            div, h4, h5, h6, p {
                font-family: "Poppins", sans-serif;
            }
        </style>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="../../layout/navbar.jsp" %>
        </div>
        <form class="form" action="processStudentPage" method="post" enctype="multipart/form-data">
            <div class="container">
                <div class="main-body">
                    <div class="row gutters-sm">
                        <div class="col-md-4 mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex flex-column align-items-center text-center">
                                        <img src="data:image/png;base64,<%=image%>" alt="profile-image" class="rounded-circle" width="150">
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
                                <div class="card-header">Account Details</div>
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
                                            <a class="btn btn-info " target="__blank" href="<%= request.getContextPath()%>/users/student/edit-profile.jsp?id=<%=username%>">Edit</a>
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