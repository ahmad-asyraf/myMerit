<%-- 
    Document   : navbar
    Created on : 11 May 2023, 11:26:37 pm
    Author     : Asyraf
--%>

<div class="navbar navbar_1">
    <div class="logo">myMeritStar<span>Alert</span></div>
    <ul class="menu">
        <li><a href="<%=request.getContextPath()%>/users/student/main-page.jsp" >Main Page</a></li>
        <li><a href="<%=request.getContextPath()%>/users/student/view-profile.jsp"><%= username%></a></li>
        <li><a href="<%=request.getContextPath()%>/users/student/view-merit.jsp">Merit</a></li>
        <li><a href="<%=request.getContextPath()%>/users/student/view-activity.jsp" >Activity Join</a></li>
        <li><a href="<%=request.getContextPath()%>/controller/logout.jsp" >Logout</a></li>
    </ul>
</div>
