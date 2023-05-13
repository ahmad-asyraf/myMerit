<%@page import="java.sql.PreparedStatement"%>
<%@ include file = "dbcon.jsp" %>
<%
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
                    <li><a href="main.jsp" >HOME</a></li>
                </ul>
            </div>

        </div>



    <html>
        <head>
            <link rel="stylesheet"
                  href="https://www.w3schools.com/w3css/4/w3.css">
        </head>



        <div class="u-form u-login-control u-form-1">
            <form action="processPending" class="u-clearfix u-form-custom-backend u-form-spacing-10 u-form-vertical u-inner-form" source="custom" name="form-1" style="padding: 10px;" method="post">
                <div class="w3-container w3-center">
                </div>


                <div class="wrapper">
                    <div class="registration_form">
                        <div class="title">
                            REGISTER CLUB
                        </div>
                        <div class="form_wrap">
                            <div class="input_grp">

                            </div>
                            <div class="input_wrap">

                                <div class="input_wrap">
                                    <label for="pdgName">Club Name</label>
                                    <input type="text" id="pdgName" name="pdgName">
                                </div>

                                <div class="input_wrap">
                                    <label for="pdgDes">Club Description</label>
                                    <input type="text" id="pdgDes" name="pdgDes">
                                </div>

                                <div class="input_wrap">
                                    <label for="pdgFaculty">Faculty</label>
                                    <input type="text" id="pdgFaculty" name="pdgFaculty">
                                </div>

                                <div class="input_wrap">
                                    <label for="pdgEmail">Email</label>
                                    <input type="text" id="pdgEmail" name="pdgEmail">
                                </div>

                                <div class="input_wrap">
                                    <input type="submit" value="submit" class="submit_btn" >
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>

