package controller;

import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RegisterController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = new User();

        if(!user.isUser(request.getParameter("username")))
        {
            user.registerUser(request.getParameter("username"), request.getParameter("password"));

            request.setAttribute("username", user.getUsername());
            request.setAttribute("password", user.getPassword());

            request.getRequestDispatcher("/index.jsp").forward(request,response);
        }
        else
        {
            request.setAttribute("errorMessage", "This user already exists! Try again");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
