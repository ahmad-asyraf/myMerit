package com.mvc.controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.bean.RegisterBean;
import com.mvc.dao.RegisterDao;

public class RegisterController extends HttpServlet 
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        
        if(request.getParameter("btn_register")!=null) //check button click event not null from register.jsp page button
        {
            String fullname=request.getParameter("txt_fullname");
            String matric=request.getParameter("txt_matric");
            String username=request.getParameter("txt_username");  //get all textbox name from register.jsp page
            String password=request.getParameter("txt_password");
            String position=request.getParameter("txt_position");
            String email=request.getParameter("txt_email");
            String club=request.getParameter("txt_club");
            
            RegisterBean registerBean=new RegisterBean(); //this class contain  seeting up all received values from register.jsp page to setter and getter method for application require effectively
            
            registerBean.setFullname(fullname);
            registerBean.setMatric(matric);
            registerBean.setUsername(username);  //set the all value through registerBean object
            registerBean.setPassword(password);
            registerBean.setPosition(position);
            registerBean.setEmail(email);
            registerBean.setClub(club);
            
            RegisterDao registerdao=new RegisterDao(); //this class contain main logic to perform function calling and database operation
            
            String registerValidate=registerdao.authorizeRegister(registerBean); //send registerBean object values into authorizeRegister() function in RegisterDao class
            
            if(registerValidate.equals("SUCCESS REGISTER")) //check calling authorizeRegister() function receive "SUCCESS REGISTER" string message after redirect to index.jsp page
            {
                request.setAttribute("RegiseterSuccessMsg",registerValidate); //apply register successfully message "RegiseterSuccessMsg"
                RequestDispatcher rd=request.getRequestDispatcher("mainpage.jsp"); //redirect to index.jsp page
                rd.forward(request, response);
            }
            else
            {
                request.setAttribute("RegisterErrorMsg",registerValidate); // apply register error message "RegiseterErrorMsg"
                RequestDispatcher rd=request.getRequestDispatcher("register.jsp"); //show error same page register.jsp page
                rd.include(request, response);
            }
        }
    }

}
