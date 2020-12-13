<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Изменить студента</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700&display=swap&subset=cyrillic" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="css/student_modifying.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="/JavaScript/function.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
            <div class="display-flex centre">
                <div class="display-flex flex-element">
                    <h1>Система управления студентами и их успеваемостью</h1>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="container">
    <div class="row">
        <div class="col-lg-4">
            <div class="margin-top">
                <a class="a-na-glavnuu" href="/JSPProject_war/index.jsp">На главную</a>
                <a class="a-na-glavnuu" href="/students_list">Назад</a>
            </div>
        </div>
        <div class="col-lg-8">
            <div class="margin-top">
                <div class="main-title-page">
                    Для модификации, введите новые значения и нажмите кнопку "Применить".
                </div>
            </div>
        </div>
    </div>
</div>



<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="display-flex start">

                <form action="/student_modifying" method="post">
                    <div CLASS="div-for-student-modifing">
                        <input type="hidden" name="id" value="${id}">
                        <div class="display-flex"><label>Фамилия</label><input type="text" name="modifiedSurname" value="${selectedStudent.surname}"></div>
                        <div class="display-flex"><label>Имя</label><input type="text" name="modifiedName" value="${selectedStudent.name}"></div>
                        <div class="display-flex"><label>Группа</label><input type="text" name="modifiedGroup" value="${selectedStudent.group_name}"></div>
                        <div CLASS="display-flex"><label>Дата поступления</label><input name="modifiedDate" type="text" id="datepicker" autocomplete="off" value="${selectedStudent.date}"></div>
                        <div class="display-flex"><input type="submit" value="Применить"></div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>


</body>
</html>