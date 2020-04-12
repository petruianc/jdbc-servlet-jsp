<%-- 
    Document   : requestemail
    Created on : 12-Apr-2020, 18:18:14
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
          
        <form action="email" method="post">
            <label for="email"><b>Enter Email</b></label>
            <input type="email" placeholder="your@email.com" name="responseemail" required>
            <button type="submit">Send Email!</button>
        </form>
    </body>
</html>
