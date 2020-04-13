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
                position:absolute;
                bottom:0;
                }
        </style>
        <script type="text/javascript">
    function GenerateTable() {
        //Build an array containing Customer records.
        var customers = new Array();
        customers.push(["Customer Id", "Name", "Country"]);
        customers.push([1, "John Hammond", "United States"]);
        customers.push([2, "Mudassar Khan", "India"]);
        customers.push([3, "Suzanne Mathews", "France"]);
        customers.push([4, "Robert Schidner", "Russia"]);
 
        //Create a HTML Table element.
        var table = document.createElement("TABLE");
        table.border = "1";
 
        //Get the count of columns.
        var columnCount = customers[0].length;
 
        //Add the header row.
        var row = table.insertRow(-1);
        for (var i = 0; i < columnCount; i++) {
            var headerCell = document.createElement("TH");
            headerCell.innerHTML = customers[0][i];
            row.appendChild(headerCell);
        }
 
        //Add the data rows.
        for (var i = 1; i < customers.length; i++) {
            row = table.insertRow(-1);
            for (var j = 0; j < columnCount; j++) {
                var cell = row.insertCell(-1);
                cell.innerHTML = customers[i][j];
            }
        }
 
        var dvTable = document.getElementById("dvTable");
        dvTable.innerHTML = "";
        dvTable.appendChild(table);
    }
</script>
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
        
        <h1>List of Employees</h1>
        <form action="display">
            <button type="submit">
                Get all employees 
            </button>
        </form>
        <form action="search">
            <label>
                Search employees by Lastname: 
            </label>
            <input type="text" name="searchEmployees">
        </form>
        <form action="addemployee">
            <button type="submit">Add Employee</button>
        </form>
         <%
            
            List<Employee> employees = (List<Employee>) session.getAttribute("employees");
            if(session.getAttribute("employees")!=null){
         %>   
             <table>
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
