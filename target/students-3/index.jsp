
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!doctype html>
<html lang="ru">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700&display=swap&subset=cyrillic" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/style.css">

    <title>Проект по JSP</title>
</head>

<body>

<header>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="navbar-brand" href="/JSPProject_war#"><img src="./img/logo.png" alt=""> Проект</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <div class="header_content ml-auto">
                            <div class="nav-item"><a class="nav-link" href="/JSPProject_war/students_list">Студенты</a></div>
                            <div class="nav-item"><a class="nav-link" href="/JSPProject_war/list_of_disciplines">Дисциплины</a></div>
                            <div class="nav-item"><a class="nav-link" href="/JSPProject_war/term_list">Семестры</a></div>

                            <div class="registration">
                                <c:choose>
                                    <c:when test="${isLogin eq 1}">
                                        <a class="btn btn-primary" href="">Вы вошли как, ${login}</a>
                                    </c:when>

                                    <c:otherwise>
                                        <a class="btn btn-primary" href="/JSPProject_war/login"> Войти</a>
                                    </c:otherwise>
                                </c:choose>



                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>


<section class="intro">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="headings">
                    <h1>Cистема <span>Управления</span> Студентами</h1>
                </div>
            </div>
        </div>
    </div>
</section>



<div class="container">
    <div class="row">
        <div class="col-md-4">
            <a class="decor" href="/JSPProject_war/students_list">
                <div class="card">
                    <div class="card-body">
                        <div class="logo-img">
                            <img src="img/professor.svg" class="svg" alt="">
                        </div>
                        <div class="logo-text">
                            <h5 class="card-title">Студенты</h5>
                            <h6 class="card-subtitle">ПРОСМОТР</h6>
                        </div>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-4">
            <a class="decor" href="/JSPProject_war/list_of_disciplines">
                <div class="card">
                    <div class="card-body">
                        <div class="logo-img">
                            <img src="img/books.svg" class="svg" alt="">
                        </div>
                        <div class="logo-text">
                            <h5 class="card-title">Дисциплины</h5>
                            <h6 class="card-subtitle">ПРОСМОТР</h6>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-4">
            <a class="decor" href="/JSPProject_war/term_list">
                <div class="card">
                    <div class="card-body">
                        <div class="logo-img">
                            <img src="img/logo-2.png" class="svg" alt="">
                        </div>
                        <div class="logo-text">
                            <h5 class="card-title">Семестры</h5>
                            <h6 class="card-subtitle">ПРОСМОТР</h6>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>




<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>