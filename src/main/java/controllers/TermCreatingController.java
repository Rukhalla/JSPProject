package controllers;

import database.DBManager;
import entity.Discipline;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name="TermCreatingController", urlPatterns = "/JSPProject_war/term_creating")
public class TermCreatingController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<Discipline> disciplines = DBManager.getAllActivDisciplines();
        req.setAttribute("allDisciplines", disciplines);
        req.getRequestDispatcher("WEB-INF/jsp/term_creating.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String duration = req.getParameter("duration");
        String[] disciplines = req.getParameterValues("disciplines");
        if(duration.equals("")){
            req.setAttribute("error", "1");
            ArrayList<Discipline> disciplines2 = DBManager.getAllActivDisciplines();
            req.setAttribute("allDisciplines", disciplines2);
            req.getRequestDispatcher("WEB-INF/jsp/term_creating.jsp").forward(req, resp);
        }else{
            DBManager.createTerm(duration, disciplines);
            resp.sendRedirect("/term_list");
        }
    }
}
