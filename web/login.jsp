<%-- 
    Document   : login
    Created on : 11-Apr-2020, 23:04:08
    Author     : Petru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

img.avatar {
  width: 25%;
  border-radius: 35%;
}

.container {
  padding: 16px;
  
}

span.psw {
  float: right;
  padding-top: 16px;
}


@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>
<script type="text/javascript">
    function login_alerts(){
        var lastname = document.forms["loginform"]["lastname"].value;
        if(lastname===null || lastname===""){
            alert("Enter your last name !!!");
        }
        var password = document.forms["loginform"]["password"].value;
        if(password===null || password===""){
            alert("Enter your password !!!");
        }
        var email = document.forms["loginform"]["email"].value;
        if(email===null || email===""){
            alert("Enter your email !!!");
        }
        
    }
    
</script>

</head>
<body>

<h2>WELCOME</h2>

<form action="login" method="post" name="loginform">
  <div class="imgcontainer">
    <img src="login.png" alt="Avatar" class="avatar">
  </div>

  <div class="container">
    <label for="lastname"><b>Lastname</b></label>
    <input type="text" placeholder="Enter Lastname" name="lastname" required>

    <label for="password"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" required>
    
    <label for="email"><b>Email</b></label>
    <input type="email" placeholder="your@email.com" name="email" required>
        
    <button type="submit" onclick="return login_alerts()">Login</button>
    <label>
      <input type="checkbox" checked="checked" name="remember"> Remember me
    </label>
  </div>

  <div class="container" style="background-color:#f1f1f1">
    <button type="button" class="cancelbtn">Cancel</button>
    <span class="psw">Forgot <a href="requestemail.jsp">password?</a></span>
  </div>
</form>

</body>