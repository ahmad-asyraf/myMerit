<%@page import="java.sql.*"%>
<%@page import="com.mvc.util.DBConnection"%>
<%
    String username = (String) session.getAttribute("username");
    String position = (String) session.getAttribute("position");
    if (username == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
    
    DBConnection con = new DBConnection();

    String id = request.getParameter("id");

    String fullname = "";
    String matric = "";
    String password = "";
    String email = "";

    String sql = "SELECT * FROM register WHERE registerID=" + id;
    PreparedStatement ps = con.getConnection().prepareStatement(sql);
    ResultSet rs = ps.executeQuery();
    while (rs.next()) {
        fullname = rs.getString("fullname");
        matric = rs.getString("matric");
        username = rs.getString("username");
        password = rs.getString("password");
        email = rs.getString("email");
    }
    con.closeConnection();
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="../../layout/header.jsp" %>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="../../layout/admin-navbar.jsp" %>
        </div>
        <form action="<%= request.getContextPath()%>/controller/edit-user.jsp" method="POST">
            <div class="wrapper">
                <div class="registration_form">
                    <div class="title">
                        EDIT USER
                    </div>
                    <div class="form_wrap">
                        <div class="input_wrap">
                            <label for="fullname">Fullname</label>
                            <input type="text" id="fullname" name="fullName" value="<%=fullname%>" required="">
                        </div>

                        <div class="input_wrap">
                            <label for="matric">Matric Number</label>
                            <input type="text" id="matric" name="matric" value="<%=matric%>" required="">
                        </div>

                        <div class="input_wrap">
                            <label for="username">Username</label>
                            <input type="text" id="username" name="username" value="<%=username%>" required="">
                        </div>

                        <div class="input_wrap">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="password" value="<%=password%>" required="">
                        </div>

                        <div class="input_wrap">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" value="<%=email%>" required="">
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
                            <select name="clubName" class="form-control">
                                <option selected disabled>Select</option>
                                <%
                                    String sql1 = "SELECT club FROM admin";
                                    PreparedStatement ps1 = con.getConnection().prepareStatement(sql1);
                                    ResultSet rs1 = ps1.executeQuery();
                                    while (rs1.next()) {
                                %>
                                <option value="<%=rs1.getString("club")%>"><%=rs1.getString("club")%></option>
                                <%
                                    }
                                    con.closeConnection();
                                %>
                            </select>  
                        </div>
                        <div class="input_wrap">
                            <input type="hidden" name="id" value="<%=id%>">
                            <button type="submit" class="submit_btn">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>


