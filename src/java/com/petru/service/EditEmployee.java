/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.petru.service;

import com.petru.dao.EmployeeDao;
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
@WebServlet(name = "EditEmployee", urlPatterns = {"/editEmployee"})
public class EditEmployee extends HttpServlet {


 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
       PrintWriter out = response.getWriter();
       HttpSession session = request.getSession();
       Employee emp = (Employee)session.getAttribute("emp");
       Integer id = (Integer) session.getAttribute("id");
       EmployeeDao dao = new EmployeeDao();
       String lastName = request.getParameter("lastName");
       
       String firstName = request.getParameter("firstName");
      
       String email = request.getParameter("Email");
       String dep = request.getParameter("department");
      
       String sal = request.getParameter("salary");
       
       BigDecimal salary = BigDecimal.valueOf(Double.valueOf(sal));
       Employee newEmp = new Employee(lastName, firstName, email, dep, salary);
       if(dao.editEmployee(newEmp, emp.getId(), id)) out.println("Edit successfully!!!");
       
    }


}
