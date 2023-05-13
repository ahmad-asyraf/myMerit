/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import com.mvc.util.DBConnection;
import java.io.IOException;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ShironAlFonso
 */
public class processPending extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
         
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //response.getContentType("text/html;charset=UTF-8");
            Connection conn = DBConnection.getConnection();
            Statement statement = null;
            ResultSet resultSet = null;
            
            String pdgID = request.getParameter("pdgID");
            String pdgName = request.getParameter("pdgName");
            String pdgDes = request.getParameter("pdgDes");
            String pdgFaculty = request.getParameter("pdgFaculty");
            String pdgEmail = request.getParameter("pdgEmail");

            try (PrintWriter out1 = response.getWriter()) {

                PreparedStatement ps = conn.prepareStatement("INSERT INTO pending(pdgID,pdgName,pdgDes,pdgFaculty,pdgEmail) VALUES(?,?,?,?,?)");
                ps.setString(1, pdgID);
                ps.setString(2, pdgName);
                ps.setString(3, pdgDes);
                ps.setString(4, pdgFaculty);
                ps.setString(5, pdgEmail);
                int i = ps.executeUpdate();
                if (i > 0) {

                    out1.print("<script type=\"text/javascript\">");
                    out1.print("alert('Club Updated Successfully');");
                    out1.print("location='main.jsp';");
                    out1.print("</script>");

                }

            } catch (SQLException e) {

            }
        }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
