
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Семестры</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700&display=swap&subset=cyrillic" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="css/term_list.css">
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
        <div class="col-lg-2">
            <div class="display-flex start padding-top-10">
                <div class="column-20">
                    <a class="a-na-glavnuu" href="/JSPProject_war/index.jsp">На главную</a>
                </div>
            </div>
        </div>
        <div class="col-lg-10">
            <div class="div-student-progress-select-semestr">
                <div class="display-flex start">
                    <form action="/term_list" method="post">
                        <label>Выбрать семестр</label>
                        <div class="select">
                            <select name="selectedTerm">

                                <option selected hidden value="${selectedTerm.id}">${selectedTerm.term}</option>

                                <c:forEach items="${allTerms}" var="terms">
                                <option value="${terms.id}">${terms.term}</option>
                                </c:forEach>

                            </select>
                        </div>

                        <input class="button" type="submit" value="Выбрать">
                    </form>
                </div>

                <label name="selectedDuration">Длительность семестра: ${selectedTerm.duration}</label>

            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="display-flex start" id="div-title-page">
                <div class="column-20">
                </div>
                <div class="main-title-page">
                    Список дисциплин семестра
                </div>
            </div>




            <div id="disciplina-list" class="display-flex start for-mobile-display-block">
                <div class="column-20"></div>
                <div>
                    <table class="table-main-info table-student-progress">
                        <tbody>
                        <tr>
                            <th>Наименование дисциплины</th>
                        </tr>

                        <c:forEach items="${allDisciplinesByTerm}" var="discipline">
                        <tr>
                            <td>${discipline.discipline}</td>
                        </tr>
                        </c:forEach>


                        </tbody>
                    </table>
                </div>

                <div class="div-student-progress-select-semestr">
                    <div class=" mobile-div">
                        <form action="/term_creating" method="get">
                            <div>
                                <c:if test="${role eq 1}">
                                <input class="big-big-button" type="submit" value="Создать семестр...">
                                </c:if>
                            </div>
                        </form>

                        <form action="/term_modifying" method="get">
                            <input type="hidden" name="idModifyTerm" id="idModifyTerm" value="${selectedTerm.id}">
                            <%--    hidden - скрытое поле--%>
                            <%--    id для java name--%>
                            <%--    value значение у нашего input--%>

                            <div>
                                <c:if test="${role eq 1}">
                                <input type="submit" class="big-big-button" value="Модифицировать выбранный семестр...">
                                </c:if>
                            </div>
                        </form>

                        <form action="/term_list" method="post" id="delete-term-form">
                            <input type="hidden" name="idTermDelete" id="idTermDel" value="${selectedTerm.id}">
                            <div>
                                <c:if test="${role eq 1}">
                                <input class="big-big-button" type="submit" value="Удалить выбранный семестр..." onclick="deleteTerms()">
                                </c:if>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>







</body>
</html>