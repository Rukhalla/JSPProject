package controllers;

import database.DBManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name="StudentCreatingController", urlPatterns = "/JSPProject_war/student_creating")
public class StudentCreatingController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/jsp/student_creating.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String surnameSt = req.getParameter("surname");
        String nameSt = req.getParameter("name");
        String groupSt = req.getParameter("group_name");
        String dateSt = req.getParameter("date");

        if(surnameSt.equals("") || nameSt.equals("") || groupSt.equals("") || dateSt.equals("")){
            req.setAttribute("error", "1");
            req.getRequestDispatcher("WEB-INF/jsp/student_creating.jsp").forward(req, resp);
        }else {
            String pattern = "MM/dd/yyyy";
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
            Date date = null;

            try {
                date = simpleDateFormat.parse(dateSt);
            } catch (ParseException e) {
                e.printStackTrace();
            }


            String pattern2 = "yyyy-MM-dd HH:mm:ss";
            SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat(pattern2);

            String dateFormat = simpleDateFormat2.format(date);
            DBManager.createStudent(surnameSt, nameSt, groupSt, dateFormat);
            resp.sendRedirect("/students_list"); //передаем управление на другой контроллер
        }
    }
}
