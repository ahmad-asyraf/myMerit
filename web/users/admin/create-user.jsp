<%@page import="java.sql.*"%>
<%@page import="com.mvc.util.DBConnection"%>
<%
    String username = (String) session.getAttribute("username");
    String position = (String) session.getAttribute("position");
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
        <form action="<%= request.getContextPath()%>/controller/create-user.jsp" method="POST">
            <div class="wrapper">
                <div class="registration_form">
                    <div class="title">
                        REGISTER USER
                    </div>
                    <div class="form_wrap">
                        <div class="input_wrap">
                            <label for="fullname">Fullname</label>
                            <input type="text" id="fullname" name="fullName" required="">
                        </div>

                        <div class="input_wrap">
                            <label for="matric">Matric Number</label>
                            <input type="text" id="matric" name="matric" required="">
                        </div>

                        <div class="input_wrap">
                            <label for="username">Username</label>
                            <input type="text" id="username" name="username" required="">
                        </div>

                        <div class="input_wrap">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="password" required="">
                        </div>

                        <div class="input_wrap">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" required="">
                        </div>

                        <div class="input_wrap mb-0">
                            <label>Position</label>
                            <ul>
                                <li>
                                    <label class="radio_wrap">
                                        <input type="radio" name="position" value="admin" class="input_radio" checked>
                                        <span>Admin</span>
                                    </label>
                                </li>
                                <li>
                                    <label class="radio_wrap">
                                        <input type="radio" name="position" value="staff" class="input_radio" checked>
                                        <span>Staff</span>
                                    </label>
                                </li>
                                <li>
                                    <label class="radio_wrap">
                                        <input type="radio" name="position" value="member" class="input_radio" checked>
                                        <span>Club Member</span>
                                    </label>
                                </li>
                                <li>
                                    <label class="radio_wrap">
                                        <input type="radio" name="position" value="student" class="input_radio" checked>
                                        <span>Student</span>
                                    </label>
                                </li>
                            </ul>
                        </div>
                        <div class="input-wrap mb-3">
                            <label>Club</label>
                            <select name="clubName" class="form-select">
                                <option selected disabled>Select</option>
                                <%
                                    String sql = "SELECT club FROM admin";
                                    PreparedStatement ps = con.getConnection().prepareStatement(sql);
                                    ResultSet rs = ps.executeQuery();
                                    while (rs.next()) {
                                %>
                                <option value="<%=rs.getString("club")%>"><%=rs.getString("club")%></option>
                                <%
                                    }
                                    con.closeConnection();
                                %>
                            </select>  
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
