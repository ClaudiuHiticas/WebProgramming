<%--
  Created by IntelliJ IDEA.
  User: claudiuhiticas
  Date: 5/6/20
  Time: 23:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<form name="Signup form" action="RegisterController" method="POST">
    <div class="welcome">Register</div>
    <div>
        <span>Username:</span><br>
        <input type="text" name="username" />
    </div>
    <br>
    <div>
        <span>Password:</span><br>
        <input type="password" name="password" />
    </div>
    <br>
    <input class="button" type="submit" value="Sign up" />
</form>
</body>
</html>
