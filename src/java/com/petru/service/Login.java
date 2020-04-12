/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.petru.service;

import com.petru.dao.EmployeeDao;
import com.petru.dao.LoginDao;
import com.petru.model.Employee;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Petru
 */
@WebServlet(name = "Login", urlPatterns = {"/login"})
public class Login extends HttpServlet {

   
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      System.out.println("hello from login");
        String lastName = request.getParameter("lastname");
      System.out.println(lastName);
      String pass = request.getParameter("password");
      System.out.println(pass);
      String email = request.getParameter("email");
      System.out.println(email);
      boolean login = new LoginDao().getUserByPasswordLastNameEmail(lastName, email, pass);
      
     if(login){
          HttpSession session = request.getSession();
          session.setAttribute("lastname", lastName);
          session.setAttribute("password", pass);
          response.sendRedirect("employeelist.jsp");
      }
    }

    
}
