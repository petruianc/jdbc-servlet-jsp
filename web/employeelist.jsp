<%-- 
    Document   : test
    Created on : 12-Apr-2020, 00:55:58
    Author     : Petru
--%>

<%@page import="java.util.List"%>
<%@page import="com.petru.model.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .button {
                background-color: red;
                border: none;
                color: white;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                position: absolute;
                top:0;
                right:50px;
                
            }
        </style>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
       <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
       <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");// HTTP 1.1
            response.setHeader("Pragma","no-cache");// HTTP 1.0
            response.setHeader("Expires", "0");// proxies
            
            if(session.getAttribute("lastname")==null && session.getAttribute("password")==null){
                response.sendRedirect("login.jsp");
                
            }
           
        %>
        
        <h1>Hello ${lastname}!!!</h1>
        <form action="display">
            <button class="btn btn-primary" type="submit">
                Get all employees 
            </button>
        </form>
        <form action="search">
            <label>
                Search employees by Lastname: 
            </label>
            <input type="text" name="searchEmployees">
        </form>
        <form action="addEmployee.jsp">
            <button class="btn btn-primary pull-right" type="submit">Add Employee</button>
        </form>
         <%
            
            List<Employee> employees = (List<Employee>) session.getAttribute("employees");
            if(session.getAttribute("employees")!=null){
         %>   
             <table class="table table-dark" name="empltable">
                 <thead class="thead-light">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">LAST NAME</th>
                        <th scope="col">FIRST NAME</th>
                        <th scope="col">EMAIL</th>
                        <th scope="col">DEPARTMENT</th>
                        <th scope="col">SALARY</th>
                    </tr>
                   </thead>
                   <tbody>
                   <c:forEach items="${employees}" var="item">
                  
                    <tr>
                      
                      <td>

                         <c:out value="${item.id}"/>
                     </td>
                   
                     <td>
                          
                         <c:out value="${item.lastName}"/>
                     </td>
                     <td>
                         
                         <c:out value="${item.firstName}"/>
                     </td>
                     <td>
                         
                         <c:out value="${item.email}"/>
                     </td>
                     <td>
                         
                         <c:out value="${item.department}"/>
                     </td>
                     <td>
                        
                         <c:out value="${item.salary}"/>
                     </td>
                  </tr>
                </c:forEach>
                  </tbody>
             </table>
                
          <% 
             }
          %>
          
        
          <% 
                session.removeAttribute("employees");
          %>
          
           <%
            
            List<Employee> employeesSearch = (List<Employee>) session.getAttribute("employeesSearch");
            if(session.getAttribute("employeesSearch")!=null){
         %>
         <table>
             <thead class="thead-light">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">LAST NAME</th>
                        <th scope="col">FIRST NAME</th>
                        <th scope="col">EMAIL</th>
                        <th scope="col">DEPARTMENT</th>
                        <th scope="col">SALARY</th>
                    </tr>
                   </thead>   
             <c:forEach items="${employeesSearch}" var="item">
                  <tr>
                     <td>
                         <c:out value="${item.id}"/>
                     </td>
                     <td>
                         <c:out value="${item.lastName}"/>
                     </td>
                     <td>
                         <c:out value="${item.firstName}"/>
                     </td>
                     <td>
                         <c:out value="${item.email}"/>
                     </td>
                     <td>
                         <c:out value="${item.department}"/>
                     </td>
                     <td>
                         <c:out value="${item.salary}"/>
                     </td>
                  </tr>
                </c:forEach>
             </table>
                
          <% 
             }
          %>
          <% 
                session.removeAttribute("employeesSearch");
          %>
        <form action="logout">
            <button class="button" type="submit">LOGOUT</button>
        </form>
        
    </body>
</html>
