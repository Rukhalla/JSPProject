
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Создать студента</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700&display=swap&subset=cyrillic" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="css/student_creating.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $( function() {
            $( "#datepicker" ).datepicker();
            $( "#format" ).on( "change", function() {
                $( "#datepicker" ).datepicker( "option", "dateFormat", $( this ).val() );
            });
        } );
    </script>

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
                <a class="a-na-glavnuu" href="/JSPProject_war/students_list">Назад</a>
            </div>
        </div>
        <div class="col-lg-8">
            <div class="margin-top">
                <div class="main-title-page">
                    Для создания студента заполните все поля и нажмите кнопку "Создать".
                </div>
            </div>
        </div>
    </div>
</div>


<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <form action="student_creating" method="post">
<%--                action передает данные на контроллер по urlPatterns = "/JSPProject_war/student_creating"--%>
                <div class="div-for-student-modifing div-class-for-button-error">
                    <div class="display-flex"><label>Фамилия</label><input name="surname" type="text" autocomplete="off"></div>
                    <div class="display-flex"><label>Имя</label><input name="name" type="text" autocomplete="off"></div>
                    <div class="display-flex"><label>Группа</label><input name="group_name" type="text" autocomplete="off"></div>
                    <div class="display-flex"><label>Дата поступления</label><input type="text" id="datepicker" name="date" autocomplete="off"></div>
<%--                    name совпадает с БД.id="datepicker" это для даты. autocomplete это на сайте не запоминает, что ранее вводили в поле. --%>
                    <div class="display-flex btn "><input type="submit" value="Создать"></div>

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
            </form>
        </div>
    </div>
</div>

</body>
</html>