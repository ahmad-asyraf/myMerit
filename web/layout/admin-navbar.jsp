<%-- 
    Document   : admin-navbar
    Created on : 12 May 2023, 4:29:23 pm
    Author     : Asyraf
--%>

<div class="navbar navbar_1">
    <div class="logo">myMeritStar<span>Alert</span></div>
    <ul class="menu">
        <li><a href="<%= request.getContextPath()%>/users/admin/main-page.jsp">Manage Club</a></li>
        <!--<li><a href="<%= request.getContextPath()%>/admin/create-user.jsp">Register User</a></li>-->
        <li><a href="<%= request.getContextPath()%>/users/admin/manage-user.jsp">Manage User</a></li>
        <li><a href="<%= request.getContextPath()%>/users/admin/manage-activity.jsp">Manage Activity</a></li>
        <li><a href="<%= request.getContextPath()%>/users/admin/notifications.jsp">Notification</a></li>
        <li><a href="<%= request.getContextPath()%>/controller/logout.jsp">Logout</a></li>
    </ul>
</div>
