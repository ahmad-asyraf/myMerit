<%@page import="com.mvc.util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  

<%
    String username = request.getParameter("username");
    //session.setAttribute("username", username);
    String password = request.getParameter("password");
    String position = request.getParameter("position");

    int status = 0;
    DBConnection con = new DBConnection();

    String sql = "SELECT * FROM register WHERE username='" + username + "' AND password='" + password + "' AND position='" + position + "'";
    PreparedStatement ps = con.getConnection().prepareStatement(sql);

    ResultSet rs = ps.executeQuery();

    try {
        rs.next();
        if (rs.getString("password").equals(password) && rs.getString("username").equals(username) && position.equals("admin")) {
            //response.sendRedirect("adminClub.jsp");
            session.setAttribute("username", username);
            request.getRequestDispatcher("admin/main-page.jsp").forward(request, response);
        } else if (rs.getString("password").equals(password) && rs.getString("username").equals(username) && position.equals("staff")) {
            //response.sendRedirect("");
            session.setAttribute("username", username);
            request.getRequestDispatcher("").forward(request, response);
        } else if (rs.getString("password").equals(password) && rs.getString("username").equals(username) && position.equals("member")) {
            //response.sendRedirect("activitypage.jsp?username=" + username + "");
            session.setAttribute("username", username);
            request.getRequestDispatcher("activitypage.jsp").forward(request, response);
        } else if (rs.getString("password").equals(password) && rs.getString("username").equals(username) && position.equals("student")) {
            //out.println("Welcome " + username);
            //response.sendRedirect("studentPage.jsp?username=" + username + "");
            session.setAttribute("username", username);
            request.getRequestDispatcher("student/main-page.jsp").forward(request, response);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    if (status == 0) {
        out.print("<script type=\"text/javascript\">");
        out.print("alert('Sorry invalid username or password');");
        out.print("location='login.jsp';");
        out.print("</script>");
    }
%>