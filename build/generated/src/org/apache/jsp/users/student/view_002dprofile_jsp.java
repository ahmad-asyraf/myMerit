package org.apache.jsp.users.student;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.text.*;
import java.util.*;
import com.mvc.util.DBConnection;
import java.sql.*;

public final class view_002dprofile_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/users/student/../../layout/header.jsp");
    _jspx_dependants.add("/users/student/../../layout/navbar.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			"../../controller/ErrorPage.jsp", true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }

    DBConnection connection = new DBConnection();

    String sql = "SELECT fullname,matric,email,phone,address,faculty,course,image FROM register WHERE username=?";
    PreparedStatement ps = connection.getConnection().prepareStatement(sql);
    ps.setString(1, username);
    ResultSet rs = ps.executeQuery();

    String fullname = "", matric = "", email = "", phone = "", address = "", faculty = "", course = "", image = "";

    while (rs.next()) {
        fullname = rs.getString(1);
        matric = rs.getString(2);
        email = rs.getString(3);
        phone = rs.getString(4);
        address = rs.getString(5);
        faculty = rs.getString(6);
        course = rs.getString(7);

        byte[] imageData = rs.getBytes(8);
        image = Base64.getEncoder().encodeToString(imageData);
    }

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("<title>myMeritStarAlert</title>\n");
      out.write("\n");
      out.write("<meta charset=\"utf-8\">\n");
      out.write("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("<meta name=\"format-detection\" content=\"telephone=no\">\n");
      out.write("<meta name=\"apple-mobile-web-app-capable\" content=\"yes\">\n");
      out.write("<meta name=\"author\" content=\"\">\n");
      out.write("<meta name=\"keywords\" content=\"\">\n");
      out.write("<meta name=\"description\" content=\"\">\n");
      out.write("\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.print( request.getContextPath());
      out.write("/css/vendor.css\">\n");
      out.write("<link href=\"");
      out.print( request.getContextPath());
      out.write("/plugins/bootstrap-5.1.3/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.print( request.getContextPath());
      out.write("/css/main.css\">\n");
      out.write("\n");
      out.write("<!--<link rel=\"stylesheet\" href=\"activityReg.css\">-->\n");
      out.write("<link rel=\"stylesheet\" href=\"https://www.w3schools.com/w3css/4/w3.css\">\n");
      out.write("<script src=\"https://kit.fontawesome.com/b99e675b6e.js\"></script>\n");
      out.write("\n");
      out.write("<link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\n");
      out.write("<link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\n");
      out.write("<link href=\"https://fonts.googleapis.com/css2?family=Playfair+Display&family=Roboto:ital,wght@0,400;0,700;1,400;1,700&display=swap\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("<!-- script ================================================== -->\n");
      out.write("<script src=\"");
      out.print( request.getContextPath());
      out.write("/js/modernizr.js\"></script>\n");
      out.write("\n");
      out.write("        <style>\n");
      out.write("            @import url(\"https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap\");\n");
      out.write("            div, h4, h5, h6, p {\n");
      out.write("                font-family: \"Poppins\", sans-serif;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"wrapper\">\n");
      out.write("            ");
      out.write("\n");
      out.write("\n");
      out.write("<div class=\"navbar navbar_1\">\n");
      out.write("    <div class=\"logo\">myMeritStar<span>Alert</span></div>\n");
      out.write("    <ul class=\"menu\">\n");
      out.write("        <li><a href=\"");
      out.print(request.getContextPath());
      out.write("/users/student/main-page.jsp\" >Main Page</a></li>\n");
      out.write("        <li><a href=\"");
      out.print(request.getContextPath());
      out.write("/users/student/view-profile.jsp\">");
      out.print( username);
      out.write("</a></li>\n");
      out.write("        <li><a href=\"");
      out.print(request.getContextPath());
      out.write("/users/student/view-merit.jsp\">Merit</a></li>\n");
      out.write("        <li><a href=\"");
      out.print(request.getContextPath());
      out.write("/users/student/view-activity.jsp\" >Activity Join</a></li>\n");
      out.write("        <li><a href=\"");
      out.print(request.getContextPath());
      out.write("/controller/logout.jsp\" >Logout</a></li>\n");
      out.write("    </ul>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("        <form class=\"form\" action=\"processStudentPage\" method=\"post\" enctype=\"multipart/form-data\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"main-body\">\n");
      out.write("                    <div class=\"row gutters-sm\">\n");
      out.write("                        <div class=\"col-md-4 mb-3\">\n");
      out.write("                            <div class=\"card\">\n");
      out.write("                                <div class=\"card-body\">\n");
      out.write("                                    <div class=\"d-flex flex-column align-items-center text-center\">\n");
      out.write("                                        <img src=\"data:image/png;base64,");
      out.print(imag);
      out.write("\" alt=\"profile-image\" class=\"rounded-circle\" width=\"150\">\n");
      out.write("                                        <div class=\"mt-3\">\n");
      out.write("                                            <h4>");
      out.print(fullname);
      out.write("</h4>\n");
      out.write("                                            <p class=\"text-secondary mb-1\">");
      out.print(matric);
      out.write("</p>\n");
      out.write("                                            <p class=\"text-muted font-size-sm\">");
      out.print(course);
      out.write("</p>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"col-md-8\">\n");
      out.write("                            <div class=\"card mb-3\">\n");
      out.write("                                <div class=\"card-header\">Account Details</div>\n");
      out.write("                                <div class=\"card-body\">\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <div class=\"col-sm-3\">\n");
      out.write("                                            <h6 class=\"mb-0\">Full Name</h6>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"col-sm-9 text-secondary\">");
      out.print(fullname);
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <hr>\n");
      out.write("\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <div class=\"col-sm-3\">\n");
      out.write("                                            <h6 class=\"mb-0\">Matric Number</h6>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"col-sm-9 text-secondary\"> ");
      out.print(matric);
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <hr>\n");
      out.write("\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <div class=\"col-sm-3\">\n");
      out.write("                                            <h6 class=\"mb-0\">Email</h6>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"col-sm-9 text-secondary\"> ");
      out.print(email);
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <hr>\n");
      out.write("\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <div class=\"col-sm-3\">\n");
      out.write("                                            <h6 class=\"mb-0\">Phone(+60)</h6>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"col-sm-9 text-secondary\">");
      out.print(phone);
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <hr>\n");
      out.write("\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <div class=\"col-sm-3\">\n");
      out.write("                                            <h6 class=\"mb-0\">Address</h6>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"col-sm-9 text-secondary\"> ");
      out.print(address);
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <hr>\n");
      out.write("\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <div class=\"col-sm-3\">\n");
      out.write("                                            <h6 class=\"mb-0\">Faculty</h6>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"col-sm-9 text-secondary\"> ");
      out.print(faculty);
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <hr>\n");
      out.write("\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <div class=\"col-sm-3\">\n");
      out.write("                                            <h6 class=\"mb-0\">Course</h6>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"col-sm-9 text-secondary\"> ");
      out.print(course);
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <hr>\n");
      out.write("\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <div class=\"col-sm-12\">\n");
      out.write("                                            <a class=\"btn btn-info \" target=\"__blank\" href=\"");
      out.print( request.getContextPath());
      out.write("/users/student/edit-profile.jsp?id=");
      out.print(username);
      out.write("\">Edit</a>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
