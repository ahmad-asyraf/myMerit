<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.mvc.util.DBConnection"%>
<%
    String username = (String) session.getAttribute("username");
    String position = (String) session.getAttribute("position");
    if (username == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }

    String id = request.getParameter("id");

    DBConnection con = new DBConnection();

    String name = "";
    String club = "";
    String des = "";
    String datestart = "";
    String dateend = "";
    String image = "";

    String sql = "SELECT * FROM activity WHERE acID=" + id;
    PreparedStatement ps = con.getConnection().prepareStatement(sql);
    ResultSet rs = ps.executeQuery();
    while (rs.next()) {
        club = rs.getString("club");
        name = rs.getString("name");
        des = rs.getString("des");
        datestart = rs.getString("datestart");
        dateend = rs.getString("dateend");
        image = rs.getString("image");
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

        <form action="<%= request.getContextPath()%>/controller/edit-activity.jsp" method="POST">
            <div class="wrapper">
                <div class="registration_form">
                    <div class="title">
                        EDIT ACTIVITY
                    </div>
                    <div class="form_wrap">
                        <div class="input-wrap mb-3">
                            <label>Activity Name</label>
                            <input type="text" name="activityName" value="<%=name%>" required />
                        </div>

                        <div class="input-wrap mb-3">
                            <label>Club Name</label>
                            <div class="column">
                                <div class="select-box">
                                    <select name="clubName" class="form-select">
                                        <%
                                            String sql1 = "SELECT club FROM admin";
                                            PreparedStatement ps1 = con.getConnection().prepareStatement(sql1);
                                            ResultSet rs1 = ps1.executeQuery();
                                            while (rs1.next()) {
                                        %>
                                        <option value="<%=rs1.getString("club")%>"><%=rs1.getString("club")%></option>
                                    <!--<input type="text" name="club" value="<%=rs1.getString("club")%>">-->
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="input-wrap mb-3">
                            <label>Description</label>
                            <textarea name="desc" class="form-control" rows="3" required><%=des%></textarea>
                        </div>

                        <div class="row mb-3">
                            <div class="col">
                                <%
                                    Calendar calendar = Calendar.getInstance();
                                    SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                                    String tarikh = dateFormat.format(calendar.getTime());
                                %>
                                <input type="hidden" value="<%=tarikh%>" id="temtDate">
                                <label>Start Date</label>
                                <input type="hidden" id="updateDate">
                                <input type="date" id="start" name="startDate" value="<%=datestart%>" class="form-control" placeholder="Enter birth date" required />
                            </div>
                            <div class="col">
                                <label>End Date</label>
                                <input type="hidden" id="updateDateEnd">
                                <input type="date" id="end" name="endDate" value="<%=dateend%>" class="form-control" placeholder="Enter birth date" required />
                            </div>
                        </div>

                        <input type="hidden" name="activityID" value="<%=id%>">
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
