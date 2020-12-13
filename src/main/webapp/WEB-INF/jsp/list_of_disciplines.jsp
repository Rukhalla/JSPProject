
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Список дисциплин</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700&display=swap&subset=cyrillic" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="css/list_of_disciplines.css">
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
            <div class="display-flex padding-top-10">
                <div class="column-20">
                    <a class="a-na-glavnuu" href="/JSPProject_war/index.jsp">На главную</a>
                </div>
                <div class="main-title-page">
                    Список дисциплин
                </div>
            </div>
        </div>
    </div>
</div>



<div class="container">
    <div class="row">
        <div class="col-lg-6">
            <div id="disciplina-list" class="display-flex start for-mobile-display-block">
                <div class="column-20"></div>
                <div>
                    <table class="table-main-info table-student-progress">
                        <tbody>
                        <tr>
                            <th></th>
                            <th>Наименование дисциплины</th>
                        </tr>

                        <c:forEach items="${allDisciplines}" var="discipline">
                        <tr>

                            <td>
                                <c:if test="${role eq 1}">
                                <input type="checkbox" id="2" value="${discipline.id}">
                                </c:if>
                            </td>
                            <td>${discipline.discipline}</td>
                        </tr>
                        </c:forEach>



                        </tbody>
                    </table>
                </div>
                <div class="col-lg-6">
                    <div class="div-student-progress-select-semestr">
                        <div class="mobile-div">
                            <div>
                                <form action="/create_discipline" method="get">
                                    <c:if test="${role eq 1}">
                                    <input class="big-big-button" type="submit" value="Создать дисциплину...">
                                    </c:if>
                                </form>
                            </div>

                            <form action="/modifying_discipline" method="get" id="discipline-modify-form">
                                <input type="hidden" name="xcxc" id="modifyId">
                                <%--    hidden это поле которое не видно пользователю--%>
                                <div>
                                    <c:if test="${role eq 1}">
                                    <input class="big-big-button" type="submit"
                                           value="Модифицировать выбранную дисциплину..." onclick="modifyDiscipline()">
                                    </c:if>
                                </div>
                            </form>

                            <form action="/list_of_disciplines" method="post" id="delete-discipline-form">
                                <input type="hidden" name="ids" id="idsDisc">
                                <div>
                                    <c:if test="${role eq 1}">
                                    <input class="big-big-button" type="submit" value="Удалить выбранную дисциплину..."
                                            onclick="deleteDiscipline()">
                                    </c:if>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>





</body>
</html>