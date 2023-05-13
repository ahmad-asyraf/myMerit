<%@page import="com.mvc.util.DBConnection"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.*"%>
<%@ include file = "dbcon.jsp" %>
<%    String user = (String) session.getAttribute("username");
    Statement statement = null;
    ResultSet resultSet = null;

    DBConnection con = new DBConnection();
    String sql = "SELECT name,club,des,datestart,dateend,platform,place,activitymerit,total,image FROM activity";
    PreparedStatement ps = con.getConnection().prepareStatement(sql);
//    String myQuery = "SELECT name,club,des,datestart,dateend,platform,place,activitymerit,total,image FROM activity";
    ResultSet myResultSet = ps.executeQuery();

%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>
        <title>FYP</title>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="format-detection" content="telephone=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="author" content="">
        <meta name="keywords" content="">
        <meta name="description" content="">

        <link rel="stylesheet" type="text/css" href="css/vendor.css">
        <link href="plugins/bootstrap-5.1.3/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/main.css">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display&family=Roboto:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">

        <!-- script ================================================== -->
        <script src="js/modernizr.js"></script>
    </head>
    <body>
        <% String username = request.getParameter("username");%>
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

        <section id="our-stories" class="Our-stories pt-5 pb-5">
            <div class="container">
                <div class="section-header">
                    <h3 class="elementary-title">ACTIVITY</h3>		
                </div><!--section-header-->
                <div class="row">
                    <%
                        while (myResultSet.next()) {
                            myResultSet.getString(1);
                            myResultSet.getString(3);

                            byte[] imageData = myResultSet.getBytes(10);
                            String base64Image = Base64.getEncoder().encodeToString(imageData);
                    %>
                    <div class="post-item col-md-3 mb-5">
                        <figure class="zoom-effect">
                            <a href="#" class="zoom-in"><img src="data:image/png;base64,<%=base64Image%>" alt="stories" class="blogImg" width="582" height="461" ></a>
                        </figure>
                        <div class="post-title-wrap">
                            <div class="post-meta"><a href="#">Description</a></div>
                            <h3 class="post-title"><a href="single-post.html"><%=myResultSet.getString(1)%></a></h3>				
                            <p><%=myResultSet.getString(3)%><a href="activityJoin.jsp?username=<%=username%>" class="btn-link">Join</a></p>
                        </div>
                    </div>
                    <%
                        }
                        con.closeConnection();
                    %>	
                </div>
            </div>
        </section>

        <script src="js/jquery-1.11.0.min.js"></script>
        <script src="plugins/bootstrap-5.1.3/js/bootstrap.bundle.min.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/script.js"></script>
    </body>
</html>

