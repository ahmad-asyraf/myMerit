/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import com.mvc.util.DBConnection;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author ShironAlFonso
 */
@MultipartConfig(maxFileSize = 16177215)
public class processStudentPage extends HttpServlet {

    public processStudentPage() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("image/jpeg");

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String fullname = request.getParameter("fullname");
        String matric = request.getParameter("matric");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String faculty = request.getParameter("faculty");
        String course = request.getParameter("course");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String myURL = "jdbc:mysql://localhost:3306/mymerit";
            Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");
            PreparedStatement ps = myConnection.prepareStatement("UPDATE register SET fullname=?,matric=?,email=?,phone=?,address=?,faculty=?,course=? WHERE username=?");
            ps.setString(1, fullname);
            ps.setString(2, matric);
            ps.setString(3, email);
            ps.setInt(4, Integer.parseInt(phone));
            ps.setString(5, address);
            ps.setString(6, faculty);
            ps.setString(7, course);
            ps.setString(8, id);

            int status = ps.executeUpdate();

            if (status > 0) {
                response.setContentType("text/html;charset=UTF-8");
                try (PrintWriter out = response.getWriter()) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Success update profil!');");
                    out.println("location='studentmainpage.jsp?username="+id+"';");
                    out.println("</script>");
                }
            }
        } catch (SQLException ex) {
            // Handle SQL exception
        } catch (IOException ex) {
            // Handle IO exception
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(processStudentPage.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
