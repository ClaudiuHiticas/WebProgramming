<%--
  Created by IntelliJ IDEA.
  User: claudiuhiticas
  Date: 5/6/20
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="static java.lang.Math.max" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>BattleShip</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
</head>

<body>
<h2>
    Welcome:
    <%
        String username = (String)session.getAttribute("username");
        out.println(username);
    %>
</h2>
<div>
    <div class="rules">
        <h3>Rules of the game:</h3>
        <ul>
            <li>Choose a position between 0 to 5 to set your ship</li>
            <li>Choose an orientation for your ship between 1 and 3</li>
            <li>You must to add 2 ships on your board</li>
            <li>Battle start! You can hit your opponent's ship</li>
        </ul>

        <h5>Hint for orientation:</h5>
        <ul>
            <li>0 for UP</li>
            <li>1 for LEFT</li>
            <li>2 for DOWN</li>
            <li>3 for RIGHT</li>
        </ul>
    </div>
</div>
<script>
    $(document).ready(function() {
        $("#submit_position").click(function() {
            let x = $("#x_position").val();
            let y = $("#y_position").val();
            let orientation = $("#orientation").val();
            if(!$.isNumeric(x) || !$.isNumeric(y) || !$.isNumeric(orientation)) {
                alert("Values must be integers!")
            } else {
                $.post("/PlayController?x=" + x + "&y=" + y + "&orientation=" + orientation, function (response) {
                    if (response["response"] === "success") {
                        let nextX = [-1, 0, 1, 0];
                        let nextY = [0, -1, 0, 1];
                        let or = parseInt(orientation);
                        let currentX = parseInt(x);
                        let currentY = parseInt(y);

                        for (let i = 0; i < 3; ++i) {
                            $("#id_" + (currentX * 6 + currentY)).css("background-color", "green");
                            currentX += nextX[or];
                            currentY += nextY[or];
                        }
                        $("#x_position").val("");
                        $("#y_position").val("");
                        $("#orientation").val("");
                    } else {
                        alert(response["response"]);
                    }
                });
            }
        });
        $("#submit_attack").click(function() {
            let x = $("#x_attack").val();
            let y = $("#y_attack").val();
            if(!$.isNumeric(x) || !$.isNumeric(y)) {
                alert("Values must be integers!")
            } else {
                $.post("/PlayController?x=" + x + "&y=" + y, function (response) {
                    if (response["response"] === "success") {
                        $("#x_attack").val("");
                        $("#y_attack").val("");
                    } else {
                        alert(response["response"]);
                    }

                });
            }
        });

        let myFunction = function() {
            $.get("/PlayController", function (response) {
                if (response["response"] === "success") {
                    // alert(JSON.stringify(response));
                    let opponentBoard = response["opponent"];
                    for (let i = 0; i < 6; ++i) {
                        for (let j = 0; j < 6; ++j) {
                            if (opponentBoard[i][j] === 3) {
                                $("#id2_" + (i * 6 + j)).css("background-color", "red");
                            }
                            if (opponentBoard[i][j] === 2) {
                                $("#id2_" + (i * 6 + j)).css("background-color", "yellow");
                            }
                        }
                    }

                    opponentBoard = response["board"];
                    for (let i = 0; i < 6; ++i) {
                        for (let j = 0; j < 6; ++j) {
                            if (opponentBoard[i][j] === 3) {
                                $("#id_" + (i * 6 + j)).css("background-color", "red");
                            }
                            if (opponentBoard[i][j] === 2) {
                                $("#id_" + (i * 6 + j)).css("background-color", "yellow");
                            }
                        }
                    }
                }
            });
        };
        setInterval(myFunction, 1000);
    });
</script>
<%
    out.print("<div class=\"container\">");
    out.print("<div class=\"board\">");
    out.print("<p>Your Board</p>");
    out.print("<table>");
    for (int i = 0; i < 7; ++i) {
        out.print("<tr>");
        for (int j = 0; j < 7; ++j) {
            if (i != 0 && j != 0) {
                out.print("<td id=\"id_" + ((i - 1) * 6 + (j - 1)) + "\">&nbspo&nbsp</td>");
            }else {
                out.print("<td>&nbsp" + max(max(i - 1, j - 1), 0) + "&nbsp</td>");
            }
        }
        out.print("</tr>");
    }
    out.print("</table>");
    out.print("</div>");

    out.print("<div class=\"board\">");
    out.print("<p>Opponent Board</p>");
    out.print("<table>");
    for (int i = 0; i < 7; ++i) {
        out.print("<tr>");
        for (int j = 0; j < 7; ++j) {
            if (i != 0 && j != 0) {
                out.print("<td id=\"id2_" + ((i - 1) * 6 + (j - 1)) + "\">&nbspo&nbsp</td>");
            }else {
                out.print("<td color='gray' >&nbsp" + max(max(i - 1, j - 1), 0) + "&nbsp</td>");
            }
        }
        out.print("</tr>");
    }
    out.print("</table>");
    out.print("</div>");
    out.print("</div>");
    for (int i = 0; i < 15; ++i) {
        out.print("<br>");
    }

%>

<div class="container">
    <div class="board" style="margin-left:100px;">
        <p>Add Ship</p>
        <label for="y_position">x:</label><br>
        <input type="text" name="y" id="y_position"><br>

        <label for="x_position">y:</label><br>
        <input type="text" name="x" id="x_position"><br>

        <label for="orientation">orientation:</label><br>
        <input type="text" name="orientation" id="orientation"><br><br>
        <button id="submit_position">submit</button>
    </div>
    <div class="board" style="margin-left: 120px">
        <p>Attack Ship</p>
        <label for="y_attack">x:</label><br>
        <input type="text" name="y" id="y_attack"><br>

        <label for="x_attack">y:</label><br>
        <input type="text" name="x" id="x_attack"><br><br>
        <button id="submit_attack">submit</button>
    </div>

</div>
</body>
</html>