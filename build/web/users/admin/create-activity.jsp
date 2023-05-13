<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
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

        <form action="<%= request.getContextPath()%>/controller/create-activity.jsp" method="POST">
            <div class="wrapper">
                <div class="registration_form">
                    <div class="title">
                        REGISTER ACTIVITY
                    </div>
                    <div class="form_wrap">
                        <div class="input-wrap mb-3">
                            <label>Activity Name</label>
                            <input type="text" name="name" placeholder="Activity name" required />
                        </div>

                        <div class="input-wrap address mb-3">
                            <label>Club Name</label>
                            <div class="column">
                                <div class="select-box">
                                    <select name="club" class="form-select">
                                        <%
                                            String sql = "SELECT club FROM admin";
                                            PreparedStatement ps = con.getConnection().prepareStatement(sql);
                                            ResultSet rs = ps.executeQuery();
                                            while (rs.next()) {
                                        %>
                                        <option value="<%=rs.getString("club")%>"><%=rs.getString("club")%></option>
                                    <!--<input type="text" name="club" value="<%=rs.getString("club")%>">-->
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="input-wrap mb-3">
                            <label>Description</label>
                            <input type="text" name="desc" placeholder="Description" required />
                        </div>

                        <div class="input-wrap mb-3">
                            <label>Total Student</label>
                            <input type="text" name="participant" placeholder="Total Student "required />
                        </div>

                        <div class="input-wrap address mb-3">
                            <label>Platform</label>
                            <div class="column">
                                <div class="select-box">
                                    <select name="platform" class="form-select">
                                        <option hidden>Platform</option>
                                        <option name="online">Online</option>
                                        <option name="physics">Physical</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="input-wrap mb-3">
                            <label>Place</label>
                            <input type="text" name="place" placeholder="Place" required />
                        </div>

                        <div class="row mb-3">
                            <div class="col">
                                <%
                                    Calendar calendar = Calendar.getInstance();
                                    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                                    String tarikh = dateFormat.format(calendar.getTime());
                                %>
                                <input type="hidden" value="<%=tarikh%>" id="temtDate">
                                <label>Start Date</label>
                                <input type="hidden" id="updateDate">
                                <input type="date" id="start" name="dateStart" class="form-control" placeholder="Enter birth date" required />
                            </div>

                            <div class="col">
                                <label>End Date</label>
                                <input type="hidden" id="updateDateEnd">
                                <input type="date" id="end" name="dateEnd" class="form-control" placeholder="Enter birth date" required />
                            </div>
                        </div>

                        <div class="input-wrap mb-3">
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

                        <button type="submit" class="submit_btn">Submit</button>
                    </div>
                </div>
            </div>
        </form>

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

