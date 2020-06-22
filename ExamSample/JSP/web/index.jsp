<%--
  Created by IntelliJ IDEA.
  User: Geo
  Date: 20/06/2020
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Login</title>
  <link rel="stylesheet" type="text/css" href="style.css">

</head>
<body>
<h5>Welcome, please login here: </h5>
<form name="Login Form" action="/servlet/login" method="POST">
  <label for="username">Username: </label></br>
  <input type="text" id="username" name="username"/></br>
  <label for="password">Password:</label></br>
  <input type="password" id="password" name="password"/></br>
  <input type="submit" value="Log In"/>
</form>
</body>
</html>
