
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Создать семестр</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700&display=swap&subset=cyrillic" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="css/term_modifying.css">
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
        <div class="col-lg-4">
            <div class="margin-top">
                <a class="a-na-glavnuu" href="/JSPProject_war/index.jsp">На главную</a>
                <a class="a-na-glavnuu" href="/term_list">Назад</a>
            </div>
        </div>
        <div class="col-lg-8">
            <div class="margin-top">
                <div class="main-title-page">
                    Для модификации семестра отредактируйте данные и нажмите кнопку "Применить".
                </div>
            </div>
        </div>
    </div>
</div>



<form action="/term_modifying" method="post">
    <div id="term-modify" class="display-flex start">
        <div class="column-20"></div>
        <div class="div-for-student-modifing div-for-student-page-new div-class-for-button-error">
            <div class="display-flex"><label>Длительность (в неделях)</label><input type="text" name="modifiedDuration" value="${selectedTerm.duration}"></div>
            <input type="hidden" name="id" value="${selectedTerm.id}">
            <div class="display-flex"><label>Выберите дисциплину</label><select name="modifiedDisciplinesId" multiple="" size="8">

                <c:forEach items="${allDisciplines}" var="disciplines">
                <option value="${disciplines.id}">${disciplines.discipline}</option>
                </c:forEach>

            </select>
            </div>

            <div class="display-flex" id="button-create-term">
                <input type="submit" value="Применить">
            </div>
        </div>
    </div>
</form>



</body>
</html>