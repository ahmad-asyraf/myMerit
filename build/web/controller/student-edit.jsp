<%@page import="java.sql.*"%>
<%@page import="com.mvc.util.DBConnection"%>
<%
    String id = request.getParameter("id");

    String fullname = request.getParameter("fullname");
    String matric = request.getParameter("matric");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String faculty = request.getParameter("faculty");
    String course = request.getParameter("course");
    String image = request.getParameter("image");

    String contextPath = request.getContextPath();
    int registerID = Integer.parseInt(id);

    DBConnection con = new DBConnection();

    try {
        String sql = "UPDATE register SET fullname=?,matric=?,email=?,phone=?,address=?,faculty=?,course=?,image=? WHERE registerID=?";
        PreparedStatement ps = con.getConnection().prepareStatement(sql);
        ps.setString(1, fullname);
        ps.setString(2, matric);
        ps.setString(3, email);
        ps.setString(4, phone);
        ps.setString(5, address);
        ps.setString(6, faculty);
        ps.setString(7, course);
        ps.setString(8, image);
        ps.setInt(9, registerID);
        int i = ps.executeUpdate();
        if (i > 0) {
            out.print("<script type=\"text/javascript\">");
            out.print("alert('Record Updated Successfully');");
            out.print("location='" + contextPath + "/users/student/view-profile.jsp';");
            out.print("</script>");
        } else {
            out.print("<script type=\"text/javascript\">");
            out.print("alert('Record Failed Update');");
            out.print("location='" + contextPath + "/users/student/view-profile.jsp';");
            out.print("</script>");
        }
    } catch (SQLException sql) {
        request.setAttribute("error", sql);
        out.println(sql);
    }
    con.closeConnection();
%>