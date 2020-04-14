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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .buttonLogout {
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
                border-radius: 8px;
            }
            .buttonAdd {
                background-color: blue; /* Green */
                border: none;
                color: white;
                padding: 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 6px 4px;
                cursor: pointer;
                border-radius: 30%;
            }
            .wrapper {
                text-align: center;
                position: absolute;
                top: 10%;
            }
            .wrapperleft{
                text-align: left;
                position: relative;
                top: 20%;
            }
            .wrapperright{
                text-align: right;
                position: absolute;
                top: 10%;
            }
            input[type=text] {
                 width: 50%;
                 padding: 8px 16px;
                 margin: 8px 0;
                 box-sizing: border-box;
            }

           
        </style>
        
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
      
        <table>
            <thead>
                <tr>
                    <th> 
                        <form action="display">
                            <button class="buttonAdd" type="submit">Get all employees</button>
                        </form>
                    </th>
                    <th> 
                        <form action="addEmployee.jsp">
                            <button class="buttonAdd" type="submit">Add Employee</button>
                        </form>
                    </th>
                    <th>
                        <form action="deleteemployee">
                            <button class="buttonAdd" type="submit">Delete by id</button>
                            <input type="text" name="deleteEmp">
                        </form>
                    </th>
                </tr>
            </thead>
        </table>
       
         <form action="search">
            <div class="input-group mb-3">
          <div class="input-group-prepend">
            <button class="btn btn-primary" type="submit">Search by last name</button>
          </div>
            <input type="text" class="form-control" name="searchEmployees" aria-label="" aria-describedby="basic-addon1">
            </div>
         </form>
         <form action="searchByDepartment">
            <div class="input-group mb-3">
          <div class="input-group-prepend">
            <button class="btn btn-primary" type="submit">Search by department</button>
          </div>
            <input type="text" class="form-control" name="searchByDepartment" aria-label="" aria-describedby="basic-addon1">
            </div>
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
                     <td>
                         <button>Edit</button>
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
       
         <table class="table table-dark" id="searchTable">
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
                  </tbody>
             </table>
         <%
             }
         %>
         
         <% 
                session.removeAttribute("employeesSearch");
         %>
        
         <%
             List<Employee> empDep = (List<Employee>)session.getAttribute("empDep");
             if(session.getAttribute("empDep")!=null){
         %>
            <table class="table table-dark" id="searchTable">
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
                   <c:forEach items="${empDep}" var="item">
                  
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
             session.removeAttribute("empDep");
         %>
<script>
    //gets table
    var oTable = document.getElementById('searchTable');

    //gets rows of table
    var rowLength = oTable.rows.length;

    //loops through rows    
    for (i = 1; i < rowLength; i++){
        
      //gets cells of current row  
       var oCells = oTable.rows.item(i).cells;

       //gets amount of cells of current row
       var cellLength = oCells.length;

       //loops through each cell in current row
       for(var j = 0; j < cellLength; j++){

              // get your cell info here

              var cellVal = oCells.item(j).innerHTML;
              console.log(cellVal);
           }
    }
</script>
          
        <form action="logout">
            <button class="buttonLogout" type="submit">LOGOUT</button>
        </form>
        
    </body>
</html>
