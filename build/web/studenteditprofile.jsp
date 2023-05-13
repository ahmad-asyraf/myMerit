<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%
    Class.forName("com.mysql.jdbc.Driver");
    String myURL = "jdbc:mysql://localhost:3306/mymerit";
    Connection myConnection = DriverManager.getConnection(myURL, "root", "");
    String id = request.getParameter("id");

    String fullname = "";
    String matric = "";
    String email = "";
    String phone = "";
    String address = "";
    String faculty = "";
    String course = "";
    String image = "";
    try {

        PreparedStatement myStatement = myConnection.prepareStatement("SELECT * FROM register WHERE username=?");
        myStatement.setString(1, id);
        ResultSet myResultSet = myStatement.executeQuery();

        while (myResultSet.next()) {
            fullname = myResultSet.getString("fullname");
            matric = myResultSet.getString("matric");
            email = myResultSet.getString("email");
            phone = myResultSet.getString("phone");
            address = myResultSet.getString("address");
            faculty = myResultSet.getString("faculty");
            course = myResultSet.getString("course");

            byte[] imageData = myResultSet.getBytes("image");
            image = Base64.getEncoder().encodeToString(imageData);

        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
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

    <% String username = request.getParameter("username");%>

    <div class="wrapper">
        <div class="navbar navbar_1">
            <div class="logo">myMeritStar<span>Alert</span></div>
            <ul class="menu">
                <li><a href="studentPage.jsp?username=<%=username%>" >Main Page</a></li>
                <li><a href="studentmainpage.jsp?username=<%=username%>">Profile</a></li>
                <li><a href="" >Merit</a></li>
                <li><a href="activityJoin.jsp?username=<%=username%>" >Activity Join</a></li>
                <li><a href="main.jsp?username=<%=username%>" >Logout</a></li>
            </ul>
        </div>
    </div>

    <body>
        <form action="processStudentPage?id=<%=id%>" class="form" method="POST"> 
            <div class="container-xl px-4 mt-4">
                <hr class="mt-0 mb-4">
                <div class="row">
                    <div class="col-xl-4">
                        <div class="card mb-4 mb-xl-0">
                            <div class="card-header">Profile Picture</div>
                            <div class="card-body text-center">
                                <img class="img-account-profile rounded-circle mb-2" src="data:image/png;base64,<%=image%>" alt="" id="preview-image">
                                <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 5 MB</div>
                                <div class="input-image">
                                    <input type="file" id="file-input" name="image" required />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-8">
                        <div class="card mb-4">
                            <div class="card-header">Account Details</div>
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
                                <button class="sumbit" class="add_btn" >Submit</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <script type="text/javascript"></script>
    </body>
</html>