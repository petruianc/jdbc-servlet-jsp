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
import java.math.BigDecimal;
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
@WebServlet(name = "AddEmployee", urlPatterns = {"/addemployee"})
public class AddEmployee extends HttpServlet {

   

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
            
            String lastName = request.getParameter("lastName");
            System.out.println(lastName);
            String firstName = request.getParameter("firstName");
            String email = request.getParameter("Email");
            String dep = request.getParameter("department");
            String sal = request.getParameter("salary");
            System.out.println(sal);
            BigDecimal salary = BigDecimal.valueOf(Double.valueOf(sal));
            PrintWriter out = response.getWriter();
            
            if(lastName!=null && firstName!=null && email!=null && dep!=null && sal!=null){
                EmployeeDao dao = new EmployeeDao();
                Employee emp = new Employee(lastName, firstName, email, dep, salary);
                Integer id = new LoginDao().getUserIdByEmail((String) session.getAttribute("email"));
                System.out.println("id is: "+id);
                if(dao.addEmployee(emp, id)) out.println("Employee added!!!");
                
            }else{
                out.println("You must fill in all the spaces!!!");
            }
                
        }
    
}

  
   

