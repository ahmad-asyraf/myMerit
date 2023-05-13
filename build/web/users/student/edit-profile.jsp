<%@page import="com.mvc.util.DBConnection"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }

    DBConnection con = new DBConnection();
//    String id = request.getParameter("id");

    String id = "";
    String fullname = "";
    String matric = "";
    String email = "";
    String phone = "";
    String address = "";
    String faculty = "";
    String course = "";
    String image = "";
    try {

        PreparedStatement ps = con.getConnection().prepareStatement("SELECT * FROM register WHERE username=?");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            id = rs.getString("registerID");
            fullname = rs.getString("fullname");
            matric = rs.getString("matric");
            email = rs.getString("email");
            phone = rs.getString("phone");
            address = rs.getString("address");
            faculty = rs.getString("faculty");
            course = rs.getString("course");

            byte[] imageData = rs.getBytes("image");
            image = Base64.getEncoder().encodeToString(imageData);

        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="../../layout/header.jsp" %>
        <style type="text/css">
            body{
                margin-top:20px;
                background-color:white;
                color:#000000;
            }
            .img-account-profile {
                height: 10rem;
            }
            .rounded-circle {
                border-radius: 50% !important;
            }
            .card {
                box-shadow: 0 0.15rem 1.75rem 0 rgb(33 40 50 / 15%);
            }
            .card .card-header {
                font-weight: 500;
            }
            .card-header:first-child {
                border-radius: 0.35rem 0.35rem 0 0;
            }
            .card-header {
                padding: 1rem 1.35rem;
                margin-bottom: 0;
                background-color: rgba(255, 255, 255, 0.03);
                border-bottom: 1px solid rgba(255, 255, 255, 0.125);
            }
            .form-control, .dataTable-input {
                display: block;
                width: 100%;
                padding: 0.875rem 1.125rem;
                font-size: 0.875rem;
                font-weight: 400;
                line-height: 1;
                color: #000000;
                background-color: #fff;
                background-clip: padding-box;
                border: 1px solid #c5ccd6;
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                border-radius: 0.35rem;
                transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            }
        </style>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="../../layout/navbar.jsp" %>
        </div>

        <form action="<%= request.getContextPath()%>/controller/student-edit.jsp" class="form" method="POST"> 
            <div class="container-xl px-4">
                <hr class="mt-0 mb-4">
                <div class="row">
                    <div class="col-xl-4">
                        <div class="card mb-4 mb-xl-0">
                            <div class="card-header">Profile Picture</div>
                            <div class="card-body text-center">
                                <img class="img-account-profile rounded-circle mb-2" src="data:image/png;base64,<%=image%>" alt="" id="preview-image">
                                <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 5 MB</div>
                                <div class="input-image">
                                    <input type="file" id="file-input" name="image" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-8">
                        <div class="card mb-4">
                            <div class="card-header">Edit Account</div>
                            <div class="card-body">

                                <div class="mb-3">
                                    <label class="small mb-1" for="fullname">Fullname</label>
                                    <input class="form-control" type="text" id="fullname" name="fullname" value="<%=fullname%>" >
                                </div>

                                <div class="mb-3">
                                    <label class="small mb-1" for="matric">Matric Number</label>
                                    <input class="form-control" type="text" id="matric" name="matric" value="<%=matric%>" >
                                </div>

                                <div class="mb-3">
                                    <label class="small mb-1" for="email">Email</label>
                                    <input class="form-control" type="text" id="email" name="email" value="<%=email%>" >
                                </div>

                                <div class="mb-3">
                                    <label class="small mb-1" for="phone">Phone Number</label>
                                    <input class="form-control" type="text" id="phone" name="phone" placeholder="Enter your phone number" value="<%=phone%>">
                                </div>

                                <div class="mb-3">
                                    <label class="small mb-1" for="address">Address</label>
                                    <input class="form-control" type="text" id="address" name="address" placeholder="Enter your address" value="<%=address%>">
                                </div>

                                <div class="mb-3">
                                    <label class="small mb-1" for="faculty">Faculty</label>
                                    <input class="form-control" type="text" id="faculty" name="faculty" placeholder="Enter your faculty" value="<%=faculty%>">
                                </div>

                                <div class="mb-3">
                                    <label class="small mb-1" for="course">Course</label>
                                    <input class="form-control" type="text" id="course" name="course" placeholder="Enter your course" value="<%=course%>">
                                </div>

                                <input type="hidden" name="id" value="<%=id%>">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <script type="text/javascript"></script>
    </body>
</html>