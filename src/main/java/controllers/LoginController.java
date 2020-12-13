package controllers;

import database.DBManager;
import entity.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginController", urlPatterns = "/JSPProject_war/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/jsp/logn.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String pass = req.getParameter("pass");

        Account account = DBManager.getAccountBy(username,pass);
        if(account == null || username.equals("") || pass.equals("")){
            req.setAttribute("error", "3");
            req.getRequestDispatcher("WEB-INF/jsp/logn.jsp").forward(req, resp);
        }else{
            req.getSession().setAttribute("isLogin", 1);  //1 - пользователь залогинен
            req.getSession().setAttribute("role", account.getRole());
            req.getSession().setAttribute("login", account.getLogin());
            resp.sendRedirect("/");
        }
    }

}
