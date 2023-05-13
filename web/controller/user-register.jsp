<%@page import="com.mvc.util.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%
    String fullname = request.getParameter("fullname");
    String matric = request.getParameter("matric");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String position = request.getParameter("position");
    String email = request.getParameter("email");
    String contexPath = request.getContextPath();

    DBConnection con = new DBConnection();

    String sql = "SELECT * FROM register WHERE matric=? AND position='student'";
    PreparedStatement ps = con.getConnection().prepareStatement(sql);
    ps.setString(1, matric);

    String status = "Okey";
    ResultSet rse = ps.executeQuery();

    while (rse.next()) {
        if (rse.getString("matric").equals(matric)) {
            status = "NotOkey";
            out.print("<script type=\"text/javascript\">");
            out.print("alert('Failed to register!');");
            out.print("alert('Matric number already used!');");
            out.print("location='" + contexPath + "/register.jsp';");
            out.print("</script>");
        }
    }

    if (status.equals("Okey")) {
        String sql1 = "INSERT INTO register (fullname,matric,username,password,position,email) VALUES(?,?,?,?,?,?)";
        PreparedStatement ps1 = con.getConnection().prepareStatement(sql1);
        ps1.setString(1, fullname);
        ps1.setString(2, matric);
        ps1.setString(3, username);
        ps1.setString(4, password);
        ps1.setString(5, position);
        ps1.setString(6, email);
        int rs1 = ps1.executeUpdate();

        if (rs1 > 0) {
            out.print("<script type=\"text/javascript\">");
            out.print("alert('Register Succesfull!');");
            out.print("location='" + contexPath + "/login.jsp';");
            out.print("</script>");
        }
    }
    con.closeConnection();
%>
