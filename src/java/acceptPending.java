/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import com.mvc.util.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class acceptPending extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = DBConnection.getConnection();
        Statement statement = null;
        ResultSet rs=null;

        String PdgID = request.getParameter("pdgID");
        try (PrintWriter out1 = response.getWriter()) {
            PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM pending WHERE ");
            ps1.setInt(1, Integer.parseInt(PdgID));
            
            rs = ps1.executeQuery();
            while (rs.next()) {
                out1.print("<script type=\"text/javascript\">");
                    out1.print("alert('Club Registered Successfully');");
                    out1.print("</script>");
                    
              /*  PreparedStatement ps = conn.prepareStatement("INSERT INTO admin(club,des,faculty,email) VALUES(?,?,?,?)");
                ps.setString(1, rs.getString("pdgName"));
                ps.setString(2, rs.getString("pdgDes"));
                ps.setString(3, rs.getString("pdgFaculty"));
                ps.setString(4, rs.getString("pdgEmail"));
                int i = ps.executeUpdate();
                if (i > 0) {
                    out1.print("<script type=\"text/javascript\">");
                    out1.print("alert('Club Registered Successfully');");
                    out1.print("location='adminClub.jsp';");
                    out1.print("</script>");
                }*/
            } 

        } catch (SQLException e) {

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
