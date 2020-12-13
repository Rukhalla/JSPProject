
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="css/sgnup.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="/js/functions.js"></script>

    <style>
        #msg {
            visibility: hidden;
            min-width: 230px;
            background-color: yellow;
            color: #000;
            text-align: center;
            border-radius: 2px;
            padding: 16px;
            position: fixed;
            z-index: 1;
            right: 30%;
            top: 30px;
            font-size: 17px;
            margin-right: 160px;
        }
        #msg.show {
            visibility: visible;
            -webkit-animation:fadein 0.5s, fadeout 0.5s 2.5s;
            animation: fadein 0.5s, fadeout 0.5s 2.5s;
        }
        @-webkit-keyframes fadein {
            from {top: 0; opacity: 0;}
            to {top: 30px; opacity: 1;}
        }
        @keyframes fadein {
            from {top: 0; opacity: 0;}
            to {top: 30px; opacity: 1;}
        }
        @-webkit-keyframes fadeout {
            from {top: 30px; opacity: 1;}
            to {top: 0; opacity: 0;}
        }
        @keyframes fadeout {
            from {top: 30px; opacity: 1;}
            to {top: 0; opacity: 0;}
        }
    </style>
</head>

<body>
<div class="signup">
    <form action="/sgnup" method="post">
        <h2 style="color: #fff;">Регистрация</h2>
        <input type="text" name="login" placeholder="Логин" value=""/>
        <br><br>
        <input type="password" name="pass" placeholder="Пароль">
        <br><br>
        <input type="passwordConfirmation" name="passConfirmation" placeholder="Подтверждение пароля">
        <br><br>
        <input type="text" name="role" placeholder="admin:1, студент:0">
        <br><br>
        <input type="submit" value="Зарегистрироваться" onclick="myFunction()"/>
        <br><br>

        <c:if test="${error eq '1'}">
            <p class="color-text-error">Все поля должны быть заполнены!</p>
        </c:if>

        <c:if test="${error2 eq '2'}">
            <p class="color-text-error">Подтверждение пароля не совпадает с Паролем!</p>
        </c:if>

        <div id="msg">Вы успешно зарегистрированы!!!</div>
        <script>
            function myFunction() {
                var x = document.getElementById("msg");
                x.className = "show";
                setTimeout(function() {
                    x.className =
                        x.className.replace("show", "");
                }, 3000);
            }
        </script>
        Уже есть аккаунт?<a href="/JSPProject_war/login" style="text-decoration: none; font-family: 'Play', sans-serif;">&nbsp; Войти</a>
    </form>
</div>
</body>

</html>