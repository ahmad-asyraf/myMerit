<%@page import="java.sql.*"%>
<%@page import="com.mvc.util.DBConnection"%>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }

    DBConnection con = new DBConnection();

    String id = request.getParameter("id");
    String clubName = "";
    String desc = "";
    String faculty = "";
    String clubEmail = "";

    String sql = "SELECT * FROM admin WHERE clubID=" + id;
    PreparedStatement ps = con.getConnection().prepareStatement(sql);
    ResultSet rs = ps.executeQuery(sql);
    while (rs.next()) {
        clubName = rs.getString("club");
        desc = rs.getString("des");
        faculty = rs.getString("faculty");
        clubEmail = rs.getString("email");
    }
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

        <form action="<%= request.getContextPath()%>/controller/edit-club.jsp" method="POST">
            <div class="wrapper">
                <div class="registration_form">
                    <div class="title">
                        EDIT CLUB
                    </div>
                    <div class="form_wrap">
                        <div class="input_wrap">
                            <label for="fullname">Club Name</label>
                            <input type="text" id="clubName" name="clubName" value="<%=clubName%>" required="">
                        </div>

                        <div class="input_wrap">
                            <label for="matric">Description</label>
                            <input type="text" id="desc" name="desc" value="<%=desc%>" required="">
                        </div>

                        <div class="input_wrap">
                            <label for="username">Faculty</label>
                            <input type="text" id="faculty" name="faculty" value="<%=faculty%>" required="">
                        </div>

                        <div class="input_wrap">
                            <label for="password">Club Email</label>
                            <input type="email" id="clubEmail" name="clubEmail" value="<%=clubEmail%>" required="">
                        </div>

                        <div class="input_wrap">
                            <input type="hidden" name="clubID" value="<%=id%>">
                            <button type="submit" class="submit_btn">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>

