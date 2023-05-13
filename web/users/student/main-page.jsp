<%@page import="java.sql.*"%>
<%@page import="java.util.Base64"%>
<%@page import="com.mvc.util.DBConnection"%>
<%@page errorPage="../../controller/ErrorPage.jsp" %>
<%
    String username = (String) session.getAttribute("username");
    String position = (String) session.getAttribute("position");
    if (username == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }

    DBConnection con = new DBConnection();
    String sql = "SELECT * FROM activity ORDER BY acID DESC";
    PreparedStatement ps = con.getConnection().prepareStatement(sql);
//    String myQuery = "SELECT name,club,des,datestart,dateend,platform,place,activitymerit,total,image FROM activity";
    ResultSet rs = ps.executeQuery();

%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="../../layout/header.jsp" %>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="../../layout/navbar.jsp" %>
        </div>

        <section id="our-stories" class="Our-stories pt-5 pb-5">
            <div class="container">
                <div class="section-header">
                    <h3 class="elementary-title">ACTIVITY</h3>		
                </div><!--section-header-->
                <div class="row">
                    <%                        while (rs.next()) {
                            rs.getString(1);
                            rs.getString(3);

                            byte[] imageData = rs.getBytes(10);
                            String base64Image = Base64.getEncoder().encodeToString(imageData);
                    %>
                    <div class="post-item col-md-3 mb-5">
                        <figure class="zoom-effect">
                            <a href="#" class="zoom-in"><img src="data:image/png;base64,<%=base64Image%>" alt="stories" class="blogImg" width="582" height="461" ></a>
                        </figure>
                        <div class="post-title-wrap">
                            <div class="post-meta"><a href="#">Description</a></div>
                            <h3 class="post-title"><a href="single-post.html"><%=rs.getString(2)%></a></h3>				
                            <p>
                                <%=rs.getString(4)%>
                            <form action="<%= request.getContextPath()%>/controller/join-activity.jsp" method="POST" onsubmit="return confirm('Are you sure to join this program?');">
                                <input type="hidden" name="acID" value="<%=rs.getString(1)%>">
                                <input type="hidden" name="username" value="<%=username%>">
                                <button type="submit" href="<%= request.getContextPath()%>/users/student/view-activity.jsp" class="btn btn-link">Join</button>
                            </form>
                            </p>
                        </div>
                    </div>
                    <%
                        }
                        con.closeConnection();
                    %>	
                </div>
            </div>
        </section>

        <script src="../../js/jquery-1.11.0.min.js"></script>
        <script src="../../plugins/bootstrap-5.1.3/js/bootstrap.bundle.min.js"></script>
        <script src="../../js/plugins.js"></script>
        <script src="../../js/script.js"></script>
    </body>
</html>

