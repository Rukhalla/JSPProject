package controllers;

import database.DBManager;
import entity.Discipline;
import entity.Term;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name="TermModifyingController", urlPatterns = "/JSPProject_war/term_modifying")
public class TermModifyingController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idTerm = req.getParameter("idModifyTerm");
        Term selectedTerm = DBManager.getTermById(idTerm);
        List<Discipline> disciplines = DBManager.getAllActivDisciplines();
        req.setAttribute("selectedTerm",selectedTerm);
        req.setAttribute("allDisciplines",disciplines);
        req.getRequestDispatcher("WEB-INF/jsp/term_modifying.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String modifiedDuration = req.getParameter("modifiedDuration");
        String[] modifiedDisciplinesId = req.getParameterValues("modifiedDisciplinesId");
        String id = req.getParameter("id");
        if (modifiedDuration.equals("")) {
            req.setAttribute("error", "1");
            List<Discipline> disciplines2 = DBManager.getAllActivDisciplines();
            req.setAttribute("allDisciplines", disciplines2);
            req.getRequestDispatcher("WEB-INF/jsp/term_modifying.jsp").forward(req, resp);
        } else {
            DBManager.modifyTerm(id,modifiedDuration,modifiedDisciplinesId);
            resp.sendRedirect("/term_list");
        }
    }
}
