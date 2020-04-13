<%-- 
    Document   : addEmployee
    Created on : Apr 13, 2020, 4:29:41 AM
    Author     : Petru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
            <style>
            .container {
                    width: 500px;
                    clear: both;
                    color: blue;
            }

            .container input {
                    width: 100%;
                    clear: both;
            }
            </style>
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
       <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
       <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    </head>
    <body>
        <h1>Welcome to Add Employee!</h1>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");// HTTP 1.1
            response.setHeader("Pragma","no-cache");// HTTP 1.0
            response.setHeader("Expires", "0");// proxies
            
            if(session.getAttribute("lastname")==null && session.getAttribute("password")==null){
                response.sendRedirect("login.jsp");
                
            }
           
        %>
        
        <div class="container">
        <form action="addemployee">
            Enter Last name: <input type ="text" name="lastName" required><br><br>
            Enter First name: <input type="text" name="firstName" required><br><br>
            Enter email: <input type="email" name="Email" required><br><br>
            Enter department: <input type="text" name="department" required><br><br>
            Enter salary: <input type="text" name="salary" required><br><br>
            <button class="btn btn-primary pull-right" id="" type="submit">Add Employee</button>
        </form>
        </div>
    </body>
</html>
