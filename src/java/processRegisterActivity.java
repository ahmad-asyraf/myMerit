/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import com.mvc.util.DBConnection;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.*;
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
@MultipartConfig(maxFileSize=16177215)
public class processRegisterActivity extends HttpServlet {
    
    public processRegisterActivity(){
        super();
    }
    
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setContentType("image/jpeg");
        int acID = Integer.parseInt(request.getParameter("acID"));
       Connection conn = DBConnection.getConnection();
       String sql = "select * from activity where acID ='"+acID+"'";
       PreparedStatement ps;
       try{
           ps = conn.prepareStatement(sql);
           ResultSet rs = ps.executeQuery();
           if(rs.next()){
               byte [] imageData = rs.getBytes("image");
               OutputStream os = response.getOutputStream();
               os.write(imageData);
               os.flush();
               os.close();
           }
       }catch (SQLException e){
           e.printStackTrace();
           response.getOutputStream().flush();
           response.getOutputStream().close();
       }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Part image = request.getPart("image");
        String name = request.getParameter("name");
        String club = request.getParameter("club");
        String des = request.getParameter("des");
        String datestart = request.getParameter("datestart");
        String dateend = request.getParameter("dateend");
        String platform = request.getParameter("platform");
        String place = request.getParameter("place");
        String activitymerit = request.getParameter("activitymerit");
        String total = request.getParameter("total");
    
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mymerit","root","admin");
            PreparedStatement ps = con.prepareStatement("INSERT INTO activity(name,club,des,datestart,dateend,platform,place,activitymerit,total,image) VALUES(?,?,?,?,?,?,?,?,?,?)");) 
        {
            ps.setString(1, name);
            ps.setString(2, club);
            ps.setString(3, des);
            ps.setString(4, datestart);
            ps.setString(5, dateend);
            ps.setString(6, platform);
            ps.setString(7, place);
            ps.setString(8, activitymerit);
            ps.setString(9, total);
            ps.setBinaryStream(10, image.getInputStream());

            int status = ps.executeUpdate();

            if (status > 0) {
                response.setContentType("text/html;charset=UTF-8");
                try (PrintWriter out = response.getWriter()) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Success registered activity');");
                    out.println("location='activitypage.jsp';");
                    out.println("</script>");
                }
            }
        } catch (SQLException ex) {
            // Handle SQL exception
        } catch (IOException ex) {
            // Handle IO exception
        }
    }
}
