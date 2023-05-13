<%@page import="com.mvc.util.DBConnection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String id = request.getParameter("id");
    Connection connection = DBConnection.getConnection();
    Statement statement = null;
    ResultSet resultSet = null;
    
    String club ="";
    String des ="";
    String faculty ="";

    try
    {

        statement=connection.createStatement();
        String sql ="select * from admin where clubID="+id;
        resultSet = statement.executeQuery(sql);
        while(resultSet.next())
        {
            club = resultSet.getString("club");
            des = resultSet.getString("des");
            faculty = resultSet.getString("faculty");
                   }
    }
    catch(Exception e) 
    {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>FYP</title>
	<link rel="stylesheet" href="activityReg.css">
	<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
</head>
<body>

<div class="wrapper">
	<div class="navbar navbar_1">
		<div class="logo">myMeritStar<span>Alert</span></div>
		<ul class="menu">
			<li><a href="adminClub.jsp" >Manage Club</a></li>
			<li><a href="admin2.jsp" >Register User</a></li>
			<li><a href="admin3.jsp" >Manage User</a></li>
                        <li><a href="" >Issue</a></li>
                        <li><a href="main.jsp" >Logout</a></li>
		</ul>
	</div>

</div> 
<html>
<head>
    <link rel="stylesheet"
          href="https://www.w3schools.com/w3css/4/w3.css">
</head>

<body>
   <div class="u-form u-login-control u-form-1">
        <form action="editClubProcess.jsp" class="u-clearfix u-form-custom-backend u-form-spacing-10 u-form-vertical u-inner-form" source="custom" name="form-1" style="padding: 10px;">
            <div class="wrapper">
             <div class="registration_form">
                <div class="title">
                     EDIT CLUB
                </div>
            <div class="form_wrap">
                <div class="input_wrap">
                    <label for="club">Club Name</label>
                    <input type="text" value="<%=club%>" id="club" name="club">
                </div>
                
                <div class="input_wrap">
                    <label for="des">Club Description</label>
                    <input type="text" value="<%=des%>" id="des" name="des">
                </div>
                
                <div class="input_wrap">
                    <label for="Faculty">Faculty</label>
                    <input type="text" value="<%=faculty%>" id="faculty" name="faculty">
                </div>

                <div class="input_wrap">
                    <input type="hidden" value="<%=id%>" name="id">
                    <input type="submit" value="submit" class="submit_btn" >
                </div>
            </div>
        </div>
            </div>
        </form>
   </div>
</body>
</html>

