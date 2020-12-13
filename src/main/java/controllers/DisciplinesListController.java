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

@WebServlet(name="DisciplinesListController", urlPatterns = "/JSPProject_war/list_of_disciplines")
public class DisciplinesListController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<Discipline> disciplines = DBManager.getAllActivDisciplines();
        req.setAttribute("allDisciplines", disciplines);
        req.getRequestDispatcher("WEB-INF/jsp/list_of_disciplines.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ids = req.getParameter("ids"); //s - имя hidden
        String[] idsMassiv = ids.split(",");
        for(String id: idsMassiv){
            DBManager.deleteDiscipline(id);
        }
        resp.sendRedirect("/list_of_disciplines");
    }
}
