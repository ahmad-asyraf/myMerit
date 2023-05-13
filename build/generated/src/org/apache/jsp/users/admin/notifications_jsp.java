package org.apache.jsp.users.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import com.mvc.util.DBConnection;

public final class notifications_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/users/admin/../../layout/header.jsp");
    _jspx_dependants.add("/users/admin/../../layout/admin-navbar.jsp");
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
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');
      out.write('\n');

    String username = (String) session.getAttribute("username");
    String position = (String) session.getAttribute("position");
    if (username == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }

    DBConnection con = new DBConnection();

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
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"wrapper\">\n");
      out.write("            ");
      out.write("\n");
      out.write("\n");
      out.write("<div class=\"navbar navbar_1\">\n");
      out.write("    <div class=\"logo\">myMeritStar<span>Alert</span></div>\n");
      out.write("    <ul class=\"menu\">\n");
      out.write("        <li>Logged in as | ");
      out.print( position);
      out.write("</li>\n");
      out.write("        <li><a href=\"");
      out.print( request.getContextPath());
      out.write("/users/admin/main-page.jsp\">Manage Club</a></li>\n");
      out.write("        <!--<li><a href=\"");
      out.print( request.getContextPath());
      out.write("/admin/create-user.jsp\">Register User</a></li>-->\n");
      out.write("        <li><a href=\"");
      out.print( request.getContextPath());
      out.write("/users/admin/manage-user.jsp\">Manage User</a></li>\n");
      out.write("        <li><a href=\"");
      out.print( request.getContextPath());
      out.write("/users/admin/manage-activity.jsp\">Manage Activity</a></li>\n");
      out.write("        <li><a href=\"");
      out.print( request.getContextPath());
      out.write("/users/admin/notifications.jsp\">Notification</a></li>\n");
      out.write("        <li><a href=\"");
      out.print( request.getContextPath());
      out.write("/controller/logout.jsp\">Logout</a></li>\n");
      out.write("    </ul>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("        <header id=\"portfolio\">\n");
      out.write("            <span class=\"w3-button w3-hide-large w3-xxlarge w3-hover-text-grey\" onclick=\"w3_open()\"><i class=\"fa fa-bars\"></i></span>\n");
      out.write("            <div class=\"w3-container\">\n");
      out.write("                <h1><b><center>NOTIFICATIONS</b></h1></center>\n");
      out.write("            </div>\n");
      out.write("        </header>\n");
      out.write("\n");
      out.write("        <!-- Adding a table at the center of the page -->\n");
      out.write("\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <table class=\"table table-striped\"> \n");
      out.write("                <!-- Table Heading -->\n");
      out.write("                <thead> \n");
      out.write("                    <tr>\n");
      out.write("                        <th>#</th>\n");
      out.write("                        <th>Name</th> \n");
      out.write("                        <th>Description</th> \n");
      out.write("                        <th>Faculty</th> \n");
      out.write("                        <th>Email</th> \n");
      out.write("                        <th>Accept</th>\n");
      out.write("                        <th>Reject</th>\n");
      out.write("                </thead> \n");
      out.write("                <tbody>\n");
      out.write("                    ");

                        int i = 1;
                        String sql = "SELECT  pdgID, pdgName, pdgDes, pdgFaculty, pdgEmail FROM pending";
                        PreparedStatement ps = con.getConnection().prepareStatement(sql);
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                    
      out.write("\n");
      out.write("                    <tr class=\"align-middle\">\n");
      out.write("                        <td>");
      out.print(i++);
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(rs.getString(2));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(rs.getString(3));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(rs.getString(4));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(rs.getString(5));
      out.write("</td>\n");
      out.write("                        <td><a href=\"");

      out.write("/controller/accept.jsp\" onclick=\"return confirm('Accept this permission?');\" class=\"btn btn-sm btn-primary\">Accept</a></td>\n");
      out.write("                        <td><a href=\"");

      out.write("/controller/reject.jsp\" onclick=\"return confirm('Reject this permission?');\" class=\"btn btn-sm btn-danger\">Reject</a></td>\n");
      out.write("                    </tr>\n");
      out.write("                    ");

                        }
                        con.closeConnection();
                    
      out.write("\n");
      out.write("                </tbody>\n");
      out.write("            </table>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
