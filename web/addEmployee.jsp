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
    </head>
    <body>
        <h1>Welcome to Add employee!</h1>
        <form action="addemployee">
            Enter Last name: <input type ="text" name="lastName"><br><br>
            Enter First name: <input type="text" name="firstName"><br><br>
            Enter email: <input type="email" name="Email"><br><br>
            Enter department: <input type="text" name="department"><br><br>
            Enter salary: <input type="text" name="salary"><br><br>
            <button type="submit">Add Employee</button>
        </form>
    </body>
</html>
