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
                    <li><a href="mainpage.jsp">Home</a></li>
                    <li><a href="login.jsp">Login</a></li>
                    <li><a href="contact.html">Contact</a></li>
                </ul>
            </div>
        </div>	

        <form action="<%= request.getContextPath()%>/controller/user-login.jsp" method="POST" source="custom" name="form" style="padding: 10px;">
            <div class="wrapper">
                <div class="registration_form">
                    <div class="title">
                        WELCOME
                    </div>
                    <div class="form_wrap">
                        <div class="input_wrap">
                            <div class="input_wrap">
                                <label for="username">Username</label>
                                <input type="text" id="username" name="username">
                            </div>

                            <div class="input_wrap">
                                <label for="password">Password</label>
                                <input type="password" id="password" name="password">
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
                                            <span>Club Member</span>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="radio_wrap">
                                            <input type="radio" name="position" value="staff" class="input_radio">
                                            <span>Staff</span>
                                        </label>
                                    </li><!-- comment -->
                                    <li>
                                        <label class="radio_wrap">
                                            <input type="radio" name="position" value="admin" class="input_radio">
                                            <span>Admin</span>
                                        </label>
                                    </li>
                                </ul>
                            </div>

                            <div class="input_wrap">
                                <input type="submit" value="Login Now" class="submit_btn" name="btn_register">
                            </div>

                            <div class="input_wrap">
                                <a href="register.jsp" class="input_wrap">Don't have account?</a>
                                <br>
                                <br>
                                <p><a href="" class="input_wrap">Forget Password?</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

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
    </body>
</html>

