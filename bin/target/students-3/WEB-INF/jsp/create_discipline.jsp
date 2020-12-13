
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Создание дисциплины</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700&display=swap&subset=cyrillic" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="css/create_discipline.css">

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
                <a class="a-na-glavnuu" href="/index.jsp">На главную</a>
                <a class="a-na-glavnuu" href="/list_of_disciplines">Назад</a>
            </div>
        </div>
        <div class="col-lg-8">
            <div class="margin-top">
                <div class="main-title-page">
                    Для того что создать новую дисциплину заполните все поля и нажмите кнопку "Создать".
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div id="discipline-creating" class="display-flex start">
                <div class="column-20"></div>
                <form action="create_discipline" method="post">
                    <div class="div-for-student-modifing div-class-for-button-error">
                        <div class="display-flex"><label>Название</label><input name="discipline" type="text"></div>
                        <div class="display-flex button"><input type="submit" value="Создать"></div>

                        <c:if test="${error eq '1'}">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="display-flex error">
                                            <div class="text-error">
                                                <p class="color-text-error">Поле должно быть заполнено!</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


</body>
</html>