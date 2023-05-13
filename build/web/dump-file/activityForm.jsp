<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
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
    
    String name ="";
    String club ="";
    String des ="";
    String datestart="";
    String dateend="";
    String image="";
    try
    {

        statement=connection.createStatement();
        String sql ="select * from activity where acID="+id;
        resultSet = statement.executeQuery(sql);
        while(resultSet.next())
        {
            club = resultSet.getString("club");
            name = resultSet.getString("name");
            des = resultSet.getString("des");
            datestart = resultSet.getString("datestart");
            dateend = resultSet.getString("dateend");
            image = resultSet.getString("image");
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
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <title>FYP</title>
    <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
    <link rel="stylesheet" href="adminpage1.css" />
  </head>

  <div class="wrapper">
    <div class="navbar navbar_1">
      <div class="logo">myMeritStar<span>Alert</span></div>
      <ul class="menu">
        <li><a href="activitypage.jsp" >Register Activity</a></li>
	<li><a href="manageactivity.jsp" >Manage Activity</a></li>
        <li><a href="main.jsp" >Logout</a></li>
      </ul>
    </div>
  </div>	

  <body>

    <center><section  class="container">
      <header>EDIT ACTIVITY</header>

      <form action="registerActivity.jsp?id=<%=id%>" class="form">

        <div class="input-box">
          <label>Activity Name</label>
          <input type="text" name="name" value="<%=name%>" required />
        </div>
        
        <div class="input-box">
          <label>Club Name</label>
          <input type="text" name="club" value="<%=club%>" required />
        </div>

        <div class="input-box">
          <label>Description</label>
          <input type="text" name="des" value="<%=des%>" required />
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
            <input type="date" id="start" name="datestart" placeholder="Enter birth date" required />
          </div>
          <div class="input-box">
            <label>End Date</label>
            <input type="hidden" id="updateDateEnd">
            <input type="date" id="end" name="dateend" placeholder="Enter birth date" required />
          </div>
        </div>
            
             <label for="time-input">Enter a time:</label>
  <input type="time" id="time-input" name="time">
  
        <input type="submit" value="Submit">
        <input type="hidden" name="id" value="<%=id%>">
        <button class="sumbit" class="add_btn" >Submit</button>
      </form>
    </section></center>
  
  <script>
      const today = new Date().toISOString().split('T')[0];
      document.getElementById("start").min = today;
      document.getElementById("end").min = today;
 
      
      const temtDate = document.getElementById("temtDate");
      const start = document.getElementById("start");
      const end = document.getElementById("end");
      const updateDate = document.getElementById("updateDate");
      const updateDateEnd = document.getElementById("updateDateEnd");
      start.addEventListener("change", function()
      {
              const formattedDate = new Date(start.value).toLocaleDateString("en-GB", {day: "2-digit", month: "2-digit", year: "numeric"});
              document.getElementById("updateDate").value = formattedDate;
              updateDate.dispatchEvent(new Event("input"));
              
      });
      
      updateDate.addEventListener("input", function()
      {
          if(temtDate.value === updateDate.value)
          {
              alert('Please choose after today date!!!');
              start.value = "";
          }   
      });
      
      
      end.addEventListener("change", function()
      {
          const formattedDate1 = new Date(end.value).toLocaleDateString("en-GB", {day: "2-digit", month: "2-digit", year: "numeric"});
          document.getElementById("updateDateEnd").value = formattedDate1;
          updateDateEnd.dispatchEvent(new Event("input"));
      });
      
      updateDateEnd.addEventListener("input", function()
      {
          const selectDate = new Date(updateDateEnd.value);
          const before = new Date(updateDate.value);
          if(selectDate.getTime() < before.getTime())
          {
              alert('Please choose same or after date!!!');
              end.value = "";
          }
      });
  </script>
  </body>
</html>


  

  </body>
</html>
