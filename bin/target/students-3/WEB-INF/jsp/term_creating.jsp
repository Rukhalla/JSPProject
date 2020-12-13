
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
    <link rel="stylesheet" href="css/term_creating.css">
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
                <a class="a-na-glavnuu" href="/term_list">Назад</a>
            </div>
        </div>
        <div class="col-lg-8">
            <div class="margin-top">
                <div class="main-title-page">
                    Для создания семестра заполните следующие данные и нажмите кнопку "Создать".
                </div>
            </div>
        </div>
    </div>
</div>


<form action="term_creating" method="post">
    <div id="term_creating" class="display-flex start">
        <div class="column-20"></div>
        <div class="div-for-student-modifing div-for-student-page-new div-class-for-button-error">
            <div class="display-flex"><label>Длительность (в неделях)</label><input name="duration" type="text"></div>
            <div class="display-flex"><label>Дисциплины в семестре</label><select name="disciplines" multiple="" size="8">

                <c:forEach items="${allDisciplines}" var="disciplines">
<%--                    <option selected="" value="${disciplines.id}">${disciplines.discipline}</option>--%>
                    <option>${disciplines.discipline}</option>
                </c:forEach>


            </select>
            </div>

            <div class="display-flex" id="button-create-term">
                <input type="submit" value="Создать">
            </div>

            <c:if test="${error eq '1'}">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="display-flex error">
                                <div class="text-error">
                                    <p class="color-text-error">Все поля должны быть заполнены!</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>

        </div>
    </div>
</form>

</body>
</html>