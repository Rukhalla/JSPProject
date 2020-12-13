
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Список студентов</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700&display=swap&subset=cyrillic" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="css/students_list.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="/js/functions.js"></script>
</head>
<body>



<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <h1>Система управления студентами и их успеваемостью</h1>
        </div>
    </div>
</div>




<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="display-flex start padding-top-10">
                <div class="column-20">
                    <a class="a-na-glavnuu" href="/index.jsp">На главную</a>
                </div>

                <div class="student-list-div">
                    <div class="display-flex mobile-div">


                        <div>
                            <form action="/student_progress" method="get" id="student-progress-form">
                                <input type="hidden" name="idStudent" id="progressId">
<%--                                name передаем в контроллер StudentProgressController--%>
                                <input class="black-button big-button" type="submit"
                                       value="Просмотреть успеваемость выбранных студентов" onclick="progressStudent()">
                            </form>
                        </div>


                        <div>
                            <form method="get" action="/student_creating">
                                <c:if test="${role eq 1}">
                                <input type="submit" class="black-button small-button" value="Создать студента">
                                </c:if>
                            </form>
                        </div>
                    </div>


                    <div class="display-flex mobile-div">
                        <form action="/student_modifying" method="get" id="student-modify-form">

                            <input type="hidden" name="id" id="modifyId">
                        <div>
                            <c:if test="${role eq 1}">
                            <input type="submit" class="black-button big-button"
                                   value="Модифицировать выбранного студента" onclick="modifyStudent()">
                            </c:if>
                        </div>
                        </form>


                        <form action="/students_list" method="post" id="delete-students-form">
                            <input type="hidden" name="idStudent" id="idStudentDisc">
                            <div>
                                <c:if test="${role eq 1}">
                                <input type="submit" class="black-button small-button"
                                        value="Удалить выбранных студентов"
                                        onclick="deleteStudents()">
                                </c:if>
                            </div>
                        </form>

                    </div>
            </div>
        </div>
    </div>
</div>




<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="display-flex start">

                <div class="student-list-page">
                    Список студентов
                </div>
            </div>
        </div>
    </div>
</div>



<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="display-flex start">
                <div class="column-10"></div>
                <div class="column-100">
                    <table class="table-main-info">
                        <tbody>
                        <tr>
                            <th></th>
                            <th>Фамилия</th>
                            <th>Имя</th>
                            <th>Группа</th>
                            <th>Дата поступления</th>
                        </tr>

                        <c:forEach items="${allStudents}" var="student">
<%--                            var это наш текущий студент--%>
                            <tr>
                                <td><input type="checkbox" id="1" value="${student.id}"></td>
                                <td>${student.surname}</td>
                                <td>${student.name}</td>
                                <td>${student.groupName}</td>
                                <td>${student.date}</td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>