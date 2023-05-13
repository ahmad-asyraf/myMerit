<%-- 
    Document   : logout
    Created on : 13 May 2023, 5:07:06 am
    Author     : Asyraf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.invalidate(); // terminate the session
    response.sendRedirect(request.getContextPath() + "/login.jsp"); // redirect to login page
%>

