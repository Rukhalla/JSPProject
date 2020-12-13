
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <title>Вход</title>
    <link rel="stylesheet" href="css/logn.css">
</head>

<body>
<div class="signin">
    <form action="/login" method="post">
        <h2 class="color: white">Учетная запись</h2>
        <input type="text" name="username" placeholder="Логин">
        <input type="password" name="pass" placeholder="Пароль">

            <input type="submit" value="Войти">
        <br>

        <c:if test="${error eq '3'}">
            <p class="color-text-error">Логин и Пароль должны быть заполнены!</p>
        </c:if>

        <div id="container">

        </div>
        <div class="registration">
        Нет аккаунта?<a href="/sgnup">&nbsp;Регистрация</a>
        </div>

    </form>
</div>
</body>

</html>