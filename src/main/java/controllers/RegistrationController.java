package controllers;

import database.DBManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RegistrationController", urlPatterns = "/JSPProject_war/sgnup")
public class RegistrationController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/jsp/sgnup.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String login = req.getParameter("login");
        String password = req.getParameter("pass");
        String role = req.getParameter("role");
        String passwordConfirmation = req.getParameter("passConfirmation");

        if(login.equals("") || password.equals("") || passwordConfirmation.equals("") ||role.equals("")){
            req.setAttribute("error", "1");
            req.getRequestDispatcher("WEB-INF/jsp/sgnup.jsp").forward(req, resp);
        }

        else if(password.equals(passwordConfirmation)){
            DBManager.createAccount(login,password,role);
            resp.sendRedirect("/");
        } else {
            req.setAttribute("error2", "2");
            req.getRequestDispatcher("WEB-INF/jsp/sgnup.jsp").forward(req, resp);
        }
    }

}
