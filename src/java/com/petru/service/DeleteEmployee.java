/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.petru.service;

import com.petru.dao.EmployeeDao;
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
@WebServlet(name = "DeleteEmployee", urlPatterns = {"/deleteEmployee"})
public class DeleteEmployee extends HttpServlet {

    

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        Integer id = Integer.parseInt(request.getParameter("deleteEmp"));
        HttpSession session = request.getSession();
        Integer userId = (Integer)session.getAttribute("id");
        EmployeeDao dao = new EmployeeDao();
        boolean deleted = dao.deleteEmployee(id, userId);
        if(deleted) {
            
            
            session.setAttribute("deleted", deleted);
            response.sendRedirect("employeelist.jsp");
        }
        

    }

  
}
