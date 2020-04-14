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
    <script type="text/javascript">
        function login_alerts(){
            var lastname = document.forms["addform"]["lastName"].value;
            if(lastname===null || lastname===""){
                alert("You must enter a last name");
            }
            var firstname = document.forms["addform"]["firstName"].value;
            if(firstname===null || firstname===""){
                alert("You must enter a firstname");
            }
            var email = document.forms["addform"]["Email"].value;
            if(email===null || email===""){
                alert("You must enter a email");
            }
            
        
        }
    </script>
        
        <div class="container">
        <form action="addemployee" name="addform">
            Enter Last name: <input type ="text" name="lastName" required><br><br>
            Enter First name: <input type="text" name="firstName" required><br><br>
            Enter email: <input type="email" name="Email" required><br><br>
            Enter department: <input type="text" name="department" required><br><br>
            Enter salary: <input type="text" name="salary" required><br><br>
            <button class="btn btn-primary pull-right" onclick="return login_alerts()" type="submit">Add Employee</button>
        </form>
        </div>
    </body>
</html>
