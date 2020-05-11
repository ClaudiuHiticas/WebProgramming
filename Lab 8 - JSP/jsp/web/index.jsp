<%--
  Created by IntelliJ IDEA.
  User: alexm
  Date: 13-May-18
  Time: 4:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Login</title>
      <link rel="stylesheet" type="text/css" href="style.css">
  </head>
  <body>
  <form name="Login form" action="LoginController" method="POST">
      <div class="welcome">Welcome</div>
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
      <input class="button" type="submit" value="Log in" /><br>
      <span>
          Don't have an account?
          <a href="register.jsp">Sign Up</a>
        </span>
  </form>
  </body>
</html>
