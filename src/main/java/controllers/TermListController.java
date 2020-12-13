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
import java.util.ArrayList;

@WebServlet(name="TermListController", urlPatterns = "/JSPProject_war/term_list")
public class TermListController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<Term> terms = DBManager.getAllActivTerms();
        req.setAttribute("allTerms", terms);
        req.setAttribute("selectedTerm", terms.get(0));
        ArrayList<Discipline> disciplinesByTerm = DBManager.getAllActivDisciplinesByTerm(terms.get(0).getId());
        req.setAttribute("allDisciplinesByTerm", disciplinesByTerm);

        req.getRequestDispatcher("WEB-INF/jsp/term_list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String idTermDelete = req.getParameter("idTermDelete"); //s - имя hidden
        if (idTermDelete != null) {
            DBManager.deleteTerm(idTermDelete);
            resp.sendRedirect("/term_list");
        } else {
            ArrayList<Term> terms = DBManager.getAllActivTerms();
            String termId = req.getParameter("selectedTerm");
            int selectedId = Integer.parseInt(termId);
            for (Term s : terms) {
                if (s.getId() == selectedId) {
                    req.setAttribute("allTerms", terms);
                    req.setAttribute("selectedTerm", s);
                    ArrayList<Discipline> disciplinesByTerm = DBManager.getAllActivDisciplinesByTerm(selectedId);
                    req.setAttribute("allDisciplinesByTerm", disciplinesByTerm);
                    req.getRequestDispatcher("WEB-INF/jsp/term_list.jsp").forward(req, resp);
                }
            }
        }
    }
}