<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="layout/header.jsp" %>
    </head>
    <body>
        <div class="wrapper">
            <div class="navbar navbar_1">
                <div class="logo">myMeritStar<span>Alert</span></div>
                <ul class="menu">
                    <li><a href="index.html" >Home</a></li>
                    <li><a href="login.jsp">Login</a></li>
                    <li><a href="contact.html">Contact</a></li>
                </ul>
            </div>
        </div>

        <div class="wrapper">
            <div class="registration_form">
                <div class="title">
                    Registration Form
                </div>

                <div class="form_wrap">
                    <form action="<%= request.getContextPath()%>/controller/user-register.jsp" method="POST" source="custom" style="padding: 10px;">
                        <div class="input_wrap">
                            <label for="fullname">Fullname</label>
                            <input type="text" id="fullname" name="fullname" required="">
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

                        <div class="input_wrap">
                            <label>Position</label>
                            <ul>
                                <li>
                                    <label class="radio_wrap">
                                        <input type="radio" name="position" value="student" class="input_radio" checked>
                                        <span>Student</span>
                                    </label>
                                </li>
                                <li>
                                    <label class="radio_wrap">
                                        <input type="radio" name="position" value="member" class="input_radio">
                                        <span>Member</span>
                                    </label>
                                </li>
                                <li>
                                    <label class="radio_wrap">
                                        <input type="radio" name="position" value="staff" class="input_radio">
                                        <span>Staff</span>
                                    </label>
                                </li>
                                <li>
                                    <label class="radio_wrap">
                                        <input type="radio" name="position" value="admin" class="input_radio">
                                        <span>Admin</span>
                                    </label>
                                </li>
                            </ul>
                        </div>

                        <div class="input_wrap">
                            <button type="submit" class="submit_btn">Register Now</button>
                        </div>

                        <div class="input_wrap">
                            <a href="login.jsp" class="input_wrap">Already have account?</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- End page content -->

        <!--JavaScript-->
        <script>
            function myFunction() {
                var x = document.getElementById("password");
                if (x.type === "password") {
                    x.type = "text";
                } else {
                    x.type = "password";
                }
            }
        </script>
        <script>
            // Script to open and close sidebar
            function w3_open() {
                document.getElementById("mySidebar").style.display = "block";
                document.getElementById("myOverlay").style.display = "block";
            }

            function w3_close() {
                document.getElementById("mySidebar").style.display = "none";
                document.getElementById("myOverlay").style.display = "none";
            }
        </script>
    </body>
</html>

