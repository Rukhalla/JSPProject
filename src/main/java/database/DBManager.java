package database;

import entity.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class DBManager {

    public static ArrayList<Student> getAllActivStudents(){
        ArrayList<Student> allStudents = new ArrayList<>();

        try{
            String url = "jdbc:mysql://localhost/students_control?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con= DriverManager.getConnection(
                    url,"root","root");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM students_control.students where status = '1'");
            while (rs.next()){
                Student student = new Student();
                student.setId(rs.getInt("id"));
                student.setName(rs.getString("name"));
                student.setSurname(rs.getString("surname"));
                student.setGroupName(rs.getString("group_name"));
                student.setDate(rs.getDate("date"));
                student.setStatus(1);
                allStudents.add(student);
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return allStudents;
    }

    public static ArrayList<Discipline> getAllActivDisciplines(){
        ArrayList<Discipline> allDisciplines = new ArrayList<>();

        try{
            String url = "jdbc:mysql://localhost/students_control?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con= DriverManager.getConnection(
                    url,"root","Prodaza58");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM students_control.disciplines where status = '1'");
            while (rs.next()){
                Discipline discipline = new Discipline();
                discipline.setId(rs.getInt("id"));
                discipline.setDiscipline(rs.getString("discipline"));
                discipline.setStatus(1);
                allDisciplines.add(discipline);
        }
    }catch (Exception e){
            e.printStackTrace();
        }
        return allDisciplines;
    }

    public static ArrayList<Term> getAllActivTerms(){
        ArrayList<Term> allTerms = new ArrayList<>();

        try{
            String url = "jdbc:mysql://localhost/students_control?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    url,"root","Prodaza58");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM students_control.terms where status = '1'");
            while (rs.next()){
                Term term = new Term();
                term.setId(rs.getInt("id"));
                term.setTerm(rs.getString("term"));
                term.setDuration(rs.getString("duration"));
                term.setStatus(1);
                allTerms.add(term);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return allTerms;
    }

    public static ArrayList<Discipline> getAllActivDisciplinesByTerm(int idTerm){
        ArrayList<Discipline> allDisciplines = new ArrayList<>();

        try{
            String url = "jdbc:mysql://localhost/students_control?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con= DriverManager.getConnection(
                    url,"root","Prodaza58");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM terms_disciplines\n" +
                    "left join disciplines ON terms_disciplines.discipline_id = disciplines.id\n" +
                    "where terms_disciplines.term_id = "+idTerm+" and disciplines.status = '1'");
            while (rs.next()){
                Discipline discipline = new Discipline();
                discipline.setId(rs.getInt("discipline_id"));
                discipline.setDiscipline(rs.getString("discipline"));
                discipline.setStatus(1);
                allDisciplines.add(discipline);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return allDisciplines;
    }

    public static void createStudent(String surname, String name, String group_name, String date){

        try{
            String url = "jdbc:mysql://localhost/students_control?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    url,"root","Prodaza58");
            Statement stmt = con.createStatement();
            stmt.execute("INSERT INTO `students` (`name`, `surname`, `group_name`, `date`) VALUES ('"+name+"', '"+surname+"', '"+group_name+"', '"+date+"')");

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void createDiscipline(String discipline){

        try{
            String url = "jdbc:mysql://localhost/students_control?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    url,"root","Prodaza58");
            Statement stmt = con.createStatement();
            stmt.execute("INSERT INTO `disciplines` (`discipline`) VALUES ('"+discipline+"')");

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void createTerm(String duration, String[] disciplines){

        try{
            String url = "jdbc:mysql://localhost/students_control?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    url,"root","Prodaza58");
            Statement stmt = con.createStatement();
            ResultSet resultSet = stmt.executeQuery("SELECT id,  term FROM terms ORDER BY ID DESC limit 1");
            String currentTerm = null;
            int idTerm = 0;
            while (resultSet.next()){
                currentTerm = resultSet.getString("term");
                idTerm =resultSet.getInt("id");
            }
            int termNumber = 0;
            termNumber = Integer.parseInt(currentTerm.substring(8));
            String term  = "Семестр "+(++termNumber);
            stmt.execute("INSERT INTO `terms` (`term`, `duration`) VALUES ('"+term+"','"+duration+"')");

            int newId = ++idTerm;
            for (String discipline:disciplines) {
                ResultSet resultSet1 = stmt.executeQuery("SELECT id FROM disciplines\n" +
                        "where discipline ='"+discipline+"'");
                int idDiscipline = 0;
                while (resultSet1.next()){
                    idDiscipline = resultSet1.getInt("id");
                }

                stmt.execute("INSERT INTO `terms_disciplines` (`term_id`, `discipline_id`) VALUES ('"+newId +"','"+idDiscipline+"')");
            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void deleteDiscipline(String id) {
        try{
            String url = "jdbc:mysql://localhost/students_control?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    url,"root","Prodaza58");
            Statement stmt = con.createStatement();
            stmt.execute("UPDATE `disciplines` SET `status` = '0' WHERE (`id` = '"+id+"');");

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void deleteStudents(String id) {
        try{
            String url = "jdbc:mysql://localhost/students_control?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    url,"root","Prodaza58");
            Statement stmt = con.createStatement();
            stmt.execute("UPDATE `students` SET `status` = '0' WHERE (`id` = '"+id+"');");

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void deleteTerm(String idTermDelete) {
        try{
            String url = "jdbc:mysql://localhost/students_control?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    url,"root","Prodaza58");
            Statement stmt = con.createStatement();
            stmt.execute("UPDATE `terms` SET `status` = '0' WHERE (`id` = '"+idTermDelete+"');");

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void modifyDiscipline(String id, String modifiedDiscipline){

        try{
            String url = "jdbc:mysql://localhost/students_control?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    url,"root","Prodaza58");
            Statement stmt = con.createStatement();
            stmt.execute("UPDATE `disciplines` SET `discipline` = '" + modifiedDiscipline + "' WHERE (`id` = '" + id + "')");

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static String getDisciplineName(String id) {
        String name = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/students_control?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Connection con = DriverManager.getConnection(url, "root", "Prodaza58");
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select discipline from disciplines where id =" + id + "");

            while (rs.next()) {
                name = rs.getString("discipline");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return name;
    }

    public static Term getTermById(String idTerm) {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/students_control?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Connection con = DriverManager.getConnection(url, "root", "Prodaza58");
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM terms where id = " + idTerm);

            while (rs.next()) {
                Term term = new Term();
                term.setId(rs.getInt("id"));
                term.setDuration(rs.getString("duration"));
                term.setTerm(rs.getString("term"));
                term.setStatus(1);
                return term;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void modifyTerm(String id, String modifiedDuration, String[] modifiedDisciplinesId) {
        int duration1 = 0;
        try {
            duration1 = Integer.parseInt(modifiedDuration.trim());

        } catch (NumberFormatException e) {
            Pattern pattern = Pattern.compile("\\D");
            Matcher matcher = pattern.matcher(modifiedDuration);

            int i = 0;
            if (matcher.find()){
                i = matcher.start();
            }
            duration1 = Integer.parseInt(modifiedDuration.substring(0,i));
        }
        String wordWeek= null;
        String durationString = String.valueOf(duration1);
        if ((duration1-1)%10==0 && duration1!=11){
            wordWeek= " неделя";
        }else if ((durationString.substring(durationString.length()-1).equals("2") ||
                durationString.substring(durationString.length()-1).equals("3") ||
                durationString.substring(durationString.length()-1).equals("4"))&&
                duration1!=12 && duration1!=13 && duration1!=14){
            wordWeek=" недели";
        }else{
            wordWeek = " недель";
        }
        String durationResult = duration1+wordWeek;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/students_control?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Connection con = DriverManager.getConnection(url, "root", "Prodaza58");
            Statement statement = con.createStatement();
            statement.execute("DELETE FROM `terms_disciplines` WHERE (`term_id` = '" + id + "')");
            if (modifiedDisciplinesId != null) {
                for (String newDisciplineId : modifiedDisciplinesId) {
                    statement.execute("INSERT INTO `terms_disciplines` (`term_id`, `discipline_id`) VALUES ('" + id + "', '" + newDisciplineId + "')");
                }
            }

            statement.execute("UPDATE `terms` SET `duration` = '" + durationResult + "' WHERE (`id` = '" + id + "')");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static void modifyStudent(String id, String modifiedLastName, String modifiedFirstName, String modifiedGroup, String modifiedDate) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/students_control?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Connection con = DriverManager.getConnection(url, "root", "Prodaza58");
            Statement statement = con.createStatement();
            statement.execute("UPDATE `students` SET `name` = '" + modifiedFirstName + "', `surname` = '" + modifiedLastName + "', `group_name` = '" + modifiedGroup + "', `date` = '" + modifiedDate + "' WHERE (`id` = '" + id + "')");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Student getStudent(String id) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/students_control?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Connection con = DriverManager.getConnection(url, "root", "Prodaza58");
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select name, surname, group_name, date from students where id =" + id + "");

            while (rs.next()) {
                Student student = new Student();
                student.setSurname(rs.getString("surname"));
                student.setName(rs.getString("name"));
                student.setGroupName(rs.getString("group_name"));
                student.setDate(rs.getDate("date"));
                return student;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public static LinkedHashMap<Discipline, String> getDisciplinesAndMarkByTerm(String id, String termId) {
        LinkedHashMap<Discipline, String> disciplinesAndMark = new LinkedHashMap<>();
        try {
            String url = "jdbc:mysql://localhost/students_control?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con= DriverManager.getConnection(
                    url,"root","Prodaza58");
            Statement statement = con.createStatement();

            ResultSet rs = statement.executeQuery("select disciplines.id, disciplines.discipline , marks.mark  from marks\n" +
                    "join terms_disciplines on marks.term_discipline_id=terms_disciplines.id\n" +
                    "join terms on terms_disciplines.term_id = terms.id\n" +
                    "join disciplines on terms_disciplines.discipline_id=disciplines.id\n" +
                    " where marks.student_id =" + id + " and terms_disciplines.term_id=" + termId + "");
            while (rs.next()) {
                Discipline discipline = new Discipline();
                discipline.setId(rs.getInt("id"));
                discipline.setDiscipline(rs.getString("discipline"));
                discipline.setStatus(1);
                String mark = rs.getString("mark");
                disciplinesAndMark.put(discipline, mark);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return disciplinesAndMark;
    }

    public static String getAvgMark(String id, String termId) {
        double result = 0;
        try {
            String url = "jdbc:mysql://localhost/students_control?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con= DriverManager.getConnection(
                    url,"root","Prodaza58");
            Statement statement = con.createStatement();

            ResultSet rs = statement.executeQuery("select  round(avg(marks.mark),1)   from marks\n" +
                    "join terms_disciplines on marks.term_discipline_id=terms_disciplines.id\n" +
                    "join terms on terms_disciplines.term_id = terms.id\n" +
                    "join disciplines on terms_disciplines.discipline_id=disciplines.id\n" +
                    " where marks.student_id =" + id + " and terms_disciplines.term_id=" + termId + "");
            while (rs.next()) {
                result = rs.getDouble("round(avg(marks.mark),1)");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        String s = " балла.";
        if (result == (int) result) {
            if (result == 1) {
                return (int) result + " балл.";
            }
            if (result == 5) {
                return (int) result + " баллов.";
            } else {
                return (int) result + s;
            }
        } else {
            return result + s;
        }
    }

    public static Account getAccountBy(String login, String password) {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/students_control?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Connection con = DriverManager.getConnection(url, "root", "Prodaza58");
            Statement statement = con.createStatement();

            ResultSet rs = statement.executeQuery("SELECT * FROM account where login = '" + login + "'AND password = '" + password + "'");

            while (rs.next()) {
                Account account = new Account();
                account.setLogin(rs.getString("login"));
                account.setPassword(rs.getString("password"));
                account.setRole(rs.getString("role"));

                return account;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public static void createAccount(String login, String password, String role){

        try{
            String url = "jdbc:mysql://localhost/students_control?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    url,"root","Prodaza58");
            Statement stmt = con.createStatement();

            stmt.execute("INSERT INTO `account` (`login`, `password`, `role`) VALUES ('"+login+"', '"+password+"', '"+role+"')");

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
