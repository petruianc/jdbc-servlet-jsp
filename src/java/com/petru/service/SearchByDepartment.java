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
import java.util.List;
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
@WebServlet(name = "SearchByDepartment", urlPatterns = {"/searchByDepartment"})
public class SearchByDepartment extends HttpServlet {

    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String department = request.getParameter("searchByDepartment");
        System.out.println(department);
        EmployeeDao empDao = new EmployeeDao();
        List<Employee> employeesDepartment = empDao.getEmployeeByDepartment(department);
        System.out.println(employeesDepartment);
        HttpSession session = request.getSession();
        session.setAttribute("empDep", employeesDepartment);
        response.sendRedirect("employeelist.jsp");
        
    }

    
 

   
}
