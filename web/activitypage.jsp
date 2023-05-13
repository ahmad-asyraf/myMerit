<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ include file = "dbcon.jsp" %>
<%    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <title>FYP</title>
        <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
        <link rel="stylesheet" href="adminpage1.css" />
    </head>

    <body>

        <% String username = request.getParameter("username");%>

        <div class="wrapper">
            <div class="navbar navbar_1">
                <div class="logo">myMeritStar<span>Alert</span></div>
                <ul class="menu">
                    <li><a href="activitypage.jsp?username=<%=username%>" >Register Activity</a></li>
                    <li><a href="manageactivity.jsp?username=<%=username%>">Manage Activity</a></li>
                    <li><a href="mainpage.jsp?username=<%=username%>" >Logout</a></li>
                </ul>
            </div>
        </div>

    <center>
        <section class="container">
            <header>REGISTER ACTIVITY</header>

            <form class="form" action="register-activity.jsp" method="POST">
                <div class="input-box">
                    <label>Activity Name</label>
                    <input type="text" name="name" placeholder="Activity name" required />
                </div>

                <div class="input-box address">
                    <label>Club Name</label>
                    <div class="column">
                        <div class="select-box">
                            <select name="club">
                                <%
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        String myURL = "jdbc:mysql://localhost:3306/mymerit";
                                        Connection myConnection = DriverManager.getConnection(myURL, "root", "");
                                        PreparedStatement myStatement = myConnection.prepareStatement("SELECT club FROM admin");
                                        //                                myStatement.setString(1, username);
                                        ResultSet myResultSet = myStatement.executeQuery();
                                        while (myResultSet.next()) {
                                %>
                                <option value="<%=myResultSet.getString("club")%>"><%=myResultSet.getString("club")%></option>
                            <!--<input type="text" name="club" value="<%=myResultSet.getString("club")%>">-->

                                <%
                                        }
                                        myResultSet.close();
                                        myStatement.close();
                                        myConnection.close();
                                    } catch (SQLException | ClassNotFoundException e) {
                                        e.printStackTrace();
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="input-box">
                    <label>Description</label>
                    <input type="text" name="desc" placeholder="Description" required />
                </div>

                <div class="input-box">
                    <label>Total Student</label>
                    <input type="text" name="participant" placeholder="Total Student "required />
                </div>

                <div class="input-box address">
                    <label>Platform</label>
                    <div class="column">
                        <div class="select-box">
                            <select name="platform">
                                <option hidden>Platform</option>
                                <option name="online">Online</option>
                                <option name="physics">Physical</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="input-box">
                    <label>Place</label>
                    <input type="text" name="place" placeholder="Place" required />
                </div>

                <div class="column">
                    <div class="input-box">
                        <%
                            Calendar calendar = Calendar.getInstance();
                            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                            String tarikh = dateFormat.format(calendar.getTime());
                        %>

                        <input type="hidden" value="<%=tarikh%>" id="temtDate">
                        <label>Start Date</label>
                        <input type="hidden" id="updateDate">
                        <input type="date" id="start" name="dateStart" placeholder="Enter birth date" required />
                    </div>

                    <div class="input-box">
                        <label>End Date</label>
                        <input type="hidden" id="updateDateEnd">
                        <input type="date" id="end" name="dateEnd" placeholder="Enter birth date" required />
                    </div>
                </div>

                <div class="input-box">
                    <label>Merit</label>
                    <input type="text" name="merit" placeholder="merit" required />
                </div>

<!--                <div class="column">
                    <div class="input-image">
                        <label>Image</label>
                        <input type="file" name="image" required />
                    </div>

                    <div class="input-image">
                        <label for="time-input">Enter a time:</label>
                        <input type="time" id="time-input" name="time">
                    </div>
                </div>-->
                <!--<input type="submit" value="Submit">-->

                <button type="sumbit" class="add_btn" >Submit</button>
            </form>
        </section>
    </center>

    <script>
        const today = new Date().toISOString().split('T')[0];
        document.getElementById("start").min = today;
        document.getElementById("end").min = today;

        const temtDate = document.getElementById("temtDate");
        const start = document.getElementById("start");
        const end = document.getElementById("end");
        const updateDate = document.getElementById("updateDate");
        const updateDateEnd = document.getElementById("updateDateEnd");
        start.addEventListener("change", function ()
        {
            const formattedDate = new Date(start.value).toLocaleDateString("en-GB", {day: "2-digit", month: "2-digit", year: "numeric"});
            document.getElementById("updateDate").value = formattedDate;
            updateDate.dispatchEvent(new Event("input"));

        });

        updateDate.addEventListener("input", function ()
        {
            if (temtDate.value === updateDate.value)
            {
                alert('Please choose after today date!!!');
                start.value = "";
            }
        });

        end.addEventListener("change", function ()
        {
            const formattedDate1 = new Date(end.value).toLocaleDateString("en-GB", {day: "2-digit", month: "2-digit", year: "numeric"});
            document.getElementById("updateDateEnd").value = formattedDate1;
            updateDateEnd.dispatchEvent(new Event("input"));
        });

        updateDateEnd.addEventListener("input", function ()
        {
            const selectDate = new Date(updateDateEnd.value);
            const before = new Date(updateDate.value);
            if (selectDate.getTime() < before.getTime())
            {
                alert('Please choose same or after date!!!');
                end.value = "";
            }
        });
    </script>

</body>
</html>

