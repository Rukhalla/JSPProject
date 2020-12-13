package controllers;

import database.DBManager;
import entity.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name="StudentsListController", urlPatterns = "/JSPProject_war/students_list")
public class StudentsListController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<Student> students = DBManager.getAllActivStudents();
        req.setAttribute("allStudents", students); //подготовили посылку для отправки на jsp страницу. allStudents вставляем на jsp страницу в items. students вставлено из ArrayList<Student> students.
        req.getRequestDispatcher("WEB-INF/jsp/students_list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ids = req.getParameter("idStudent"); //s - имя hidden
        String[] idsMassiv = ids.split(",");
        for(String id: idsMassiv){
            DBManager.deleteStudents(id);
        }
        resp.sendRedirect("/students_list");
    }
}


