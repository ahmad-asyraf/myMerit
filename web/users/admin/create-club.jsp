<%-- 
    Document   : create-club
    Created on : 12 May 2023, 7:24:40 pm
    Author     : Asyraf
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mvc.util.DBConnection"%>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }

    DBConnection con = new DBConnection();
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="../../layout/header.jsp" %>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="../../layout/admin-navbar.jsp" %>
        </div>
        <form action="<%= request.getContextPath()%>/controller/create-club.jsp" method="POST">
            <div class="wrapper">
                <div class="registration_form">
                    <div class="title">
                        REGISTER CLUB
                    </div>
                    <div class="form_wrap">
                        <div class="input_wrap">
                            <label for="fullname">Club Name</label>
                            <input type="text" id="clubName" name="clubName" required="">
                        </div>

                        <div class="input_wrap">
                            <label for="matric">Description</label>
                            <input type="text" id="desc" name="desc" required="">
                        </div>

                        <div class="input_wrap">
                            <label for="username">Faculty</label>
                            <input type="text" id="faculty" name="faculty" required="">
                        </div>

                        <div class="input_wrap">
                            <label for="password">Club Email</label>
                            <input type="email" id="clubEmail" name="clubEmail" required="">
                        </div>

                        <div class="input_wrap">
                            <button type="submit" class="submit_btn">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>

