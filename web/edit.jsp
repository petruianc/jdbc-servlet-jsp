<%-- 
    Document   : edit
    Created on : Apr 15, 2020, 4:51:37 PM
    Author     : Petru
--%>

<%@page import="com.petru.model.Employee"%>
<%@page import="com.petru.dao.EmployeeDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% Integer studId = Integer.parseInt(request.getParameter("studId"));
            EmployeeDao dao = new EmployeeDao();
            Employee emp = dao.getEmployeeById(studId);
            session.setAttribute("emp", emp);
            
        %>
        <h1>Hello ${lastname}</h1>
        
        <form action="editEmployee">
            Last name: <input type="text" value="${emp.getLastName()}" name="lastName">
            First name: <input type="text" value="${emp.getFirstName()}" name="firstName">
            Email: <input type="text" value="${emp.getEmail()}" name="Email">
            Department: <input list="Departments" name="department">
                            <datalist id="Departments">
                            <option value="Security">
                            <option value="HR">
                            <option value="Legal">
                            <option value="Engineering">
                            </datalist>
            Salary: <input type="text" value="${emp.getSalary()}" name="salary">
            <button type="submit">Edit</button>
        </form>
    </body>
</html>
