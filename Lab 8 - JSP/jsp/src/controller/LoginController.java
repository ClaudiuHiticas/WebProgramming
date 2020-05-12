package controller;

import dataBase.ConnectionProvider;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class LoginController extends HttpServlet {

    private int players;

    public LoginController() {
        super();
        this.players = 0;
    }

    public User getUser(String username)
    {
        Connection conn = null;
        Statement stmt = null;

        try {

            conn = ConnectionProvider.getCon();

            stmt = conn.createStatement();
            String sql = "SELECT * FROM Users WHERE Username = '" + username + "'";
            ResultSet rs = stmt.executeQuery(sql);

            if (!rs.next()) {
                return null;
            }

            User user = new User();
            user.setUsername(rs.getString("username"));
            user.setPassword(rs.getString("password"));

            rs.close();
            stmt.close();
            conn.close();

            return user;
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }
        finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException ex2) {}
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex2) {}
        }

        return null;
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = this.getUser(username);
        boolean isValid = false;
        if (user != null && user.getPassword().equals(password))
        {
            isValid = true;
        }
        RequestDispatcher rd;
        if (isValid) {
            if (this.players < 2) {
                this.players += 1;
                HttpSession session = request.getSession();
                session.setAttribute("username", username);

                rd = request.getRequestDispatcher("/succes.jsp");

            } else {
                rd = request.getRequestDispatcher("/error.jsp");
            }
        } else {
            rd = request.getRequestDispatcher("/loginFailed.jsp");
        }
        rd.forward(request, response);
    }

    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}