
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Изменить дисциплину</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700&display=swap&subset=cyrillic" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="css/modifying_discipline.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="/JavaScript/function.js"></script>
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
                <a class="a-na-glavnuu" href="/JSPProject_war/list_of_disciplines">Назад</a>
            </div>
        </div>
        <div class="col-lg-8">
            <div class="margin-top">
                <div class="main-title-page">
                    Для того чтобы модифицировать дисциплину введите новое значение и нажмите кнопку "Применить".
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div  class="display-flex start">
                <div class="column-20"></div>

                <form action="/modifying_discipline" method="post">
                    <input type="hidden" name="id" value="${id}">
                    <div class="div-for-student-modifing div-class-for-button-error">
                        <div class="display-flex"><label>Название</label><input name="modifiedDiscipline" type="text" value="${disciplineName}"></div>
                        <div class="display-flex button"><input type="submit" value="Применить"></div>
                    </div>
                    <c:if test="${error eq '1'}">
                        <p class="color-text-error">Поле должно быть заполнено!</p>
                    </c:if>
                </form>

            </div>
        </div>
    </div>
</div>
</body>
</html>