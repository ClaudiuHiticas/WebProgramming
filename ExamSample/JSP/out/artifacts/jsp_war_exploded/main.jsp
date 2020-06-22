<%--
  Created by IntelliJ IDEA.
  User: Geo
  Date: 20/06/2020
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Assets</title>
    <script src="/jquery-2.0.3.js"></script>
    <script src="/main.js"></script>
    <link rel="stylesheet" type="text/css" href="style.css">

</head>
<body>
    <h4>Welcome
        <p id="username"><%String username = (String)session.getAttribute("username");out.println(username);%></p>
        <p id="id"><%Integer id = (Integer) session.getAttribute("id");out.println(id);%></p></h4>
    <div id="mydata">
    </div>
<section>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name">
        <label for="description">Description:</label>
        <input type="text" id="description" name="description">
        <label for="value">Value:</label>
        <input type="number" id="value" name="value">
        <button id="addOne">Add Asset</button>
        <button id="deliver">Deliver </button>
</section>
</body>
</html>
