package com.mvc.dao;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.mvc.bean.RegisterBean;

public class RegisterDao 
{
    public String authorizeRegister(RegisterBean registerBean) //create authorizeRegister()function
    {
        String fullname=registerBean.getFullname();
        String matric=registerBean.getMatric();
        String username=registerBean.getUsername();  //get all value through registerBean object and store in temporary variable
        String password=registerBean.getPassword();
        String position=registerBean.getPosition();
        String email=registerBean.getEmail();
        String club=registerBean.getClub();
        
        String url="jdbc:mysql://localhost:3306/mymerit"; //database connection url string
        String uname="root"; //database username
        String pass=""; //database password
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con=DriverManager.getConnection(url,uname,pass); //create connection
            
            PreparedStatement pstmt=null; //create statement
            
            pstmt=con.prepareStatement("insert into user(fullname,matric,username,password,position,email,club) values(?,?,?,?,?,?,?)"); //sql insert query
            pstmt.setString(1,fullname);
            pstmt.setString(2,matric);
            pstmt.setString(3,username);
            pstmt.setString(4,password); 
            pstmt.setString(5,position);
            pstmt.setString(6,email);
            pstmt.setString(7,club);
            pstmt.executeUpdate(); //execute query
             
            pstmt.close(); //close statement
            
            con.close(); //close connection
           
            return "SUCCESS REGISTER"; //if valid return string "SUCCESS REGISTER" 
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
            return "FAIL REGISTER"; //if invalid return string "FAIL REGISTER"
    }
}
