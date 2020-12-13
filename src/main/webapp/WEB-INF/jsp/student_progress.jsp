<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Успеваемость</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700&display=swap&subset=cyrillic" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/student_progress.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="/JavaScript/function.js"></script>
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
                <a class="a-na-glavnuu" href="/index.jsp">На главную</a>
                <a class="a-na-glavnuu" href="/students_list">Назад</a>
            </div>
        </div>
        <div class="col-lg-8">
            <div class="margin-top">
                <div class="main-title-page">
                    Отображена успеваемость для следующего студента:
                </div>
            </div>
        </div>
    </div>
</div>


<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <table class="table-main-info table-one-student">
                <input type="hidden" name="id" value="${id}">
                <tbody>

                <tr>
                    <th>Фамилия</th>
                    <th>Имя</th>
                    <th>Группа</th>
                    <th>Дата поступления</th>
                </tr>

                <tr>
                    <td>${student.surname}</td>
                    <td>${student.name}</td>
                    <td>${student.groupName}</td>
                    <td>${student.date}</td>
                </tr>

                </tbody>
            </table>
        </div>
    </div>
</div>



<div class="container">
    <div class="row">
        <div class="col-lg-6">
            <div class="display-flex start for-mobile-display-block">
                <div class="column-20"></div>
                <div>
                    <table class="table-main-info table-student-progress">
                        <tbody><tr>
                            <th>Дисциплина</th>
                            <th>Оценка</th>
                        </tr>

                        <c:forEach items="${disciplinesAndMarkByTerm}"  var="entry">
                        <tr>
                            <td>${entry.key.discipline}</td>
                            <td>${entry.value}</td>
                        </tr>
                        </c:forEach>



                        </tbody></table>
                </div>
            </div>



            <div class="col-lg-6">
                <form action="/student_progress" method="post">
                    <input type="hidden" name="idStudent" value="${id}">
                    <div class="div-student-progress-select-semestr">
                        <div class="display-flex start">
                            <label>Выбрать семестр</label>
                            <div class="select">
                                <select name="selectedTerm">

                                    <option selected hidden value="${selectedTerm.id}">${selectedTerm.term}</option>

                                    <c:forEach items="${allTerms}" var="terms">
                                        <option value="${terms.id}">${terms.term}</option>
                                    </c:forEach>


                                </select>
                            </div>

                            <input type="submit" value="Выбрать">
                        </div>
                        <label name="avgMark">Средняя оценка за семестр: ${avgMark}</label>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>