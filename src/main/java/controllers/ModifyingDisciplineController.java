package controllers;

import database.DBManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ModifyingDisciplineController", urlPatterns = "/JSPProject_war/modifying_discipline")
public class ModifyingDisciplineController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("xcxc");
        req.setAttribute("id", id);
        String disciplineName = DBManager.getDisciplineName(id);
        req.setAttribute("disciplineName", disciplineName);
        req.getRequestDispatcher("WEB-INF/jsp/modifying_discipline.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String id = req.getParameter("id");
        String modifiedDiscipline = req.getParameter("modifiedDiscipline");

        if(modifiedDiscipline.equals("") || id.equals("")){
            req.setAttribute("error", "1");
            req.getRequestDispatcher("WEB-INF/jsp/modifying_discipline.jsp").forward(req, resp);
        }else{
            DBManager.modifyDiscipline(id, modifiedDiscipline);
            resp.sendRedirect("/list_of_disciplines");
        }
    }


}
