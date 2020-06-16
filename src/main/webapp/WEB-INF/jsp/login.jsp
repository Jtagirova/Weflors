<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Страница входа</title>
    <sec:authorize access="isAuthenticated()">
        <% response.sendRedirect("main"); %>
    </sec:authorize>
    <jsp:include page="/WEB-INF/jsp/base_layout/head_links.jsp"></jsp:include>
</head>

<body>

    <c:url value="/j_spring_security_check" var="loginUrl" />
    <form action="${loginUrl}" class="limiter" method="post">

        <div class="container-login100">
            <div class="wrap-login100">
                <div class="login100-form-title" style="background-image: url('../img/background_theme2_opacity70.png')">
					<span class="login100-form-title-1">
                      <h4>  Вход в систему учета деятельности цветочного магазина </h4>
					</span>
                </div>
                <br class="form-group">
                <br>
                <br>
                <div class="row">
                    <div class="col-md-8 mb-4 col-md-offset-2">
                        <label for="j_username">Логин</label>
                        <input class="form-control" type="text" id="j_username" name="j_username" placeholder="Введите адрес электронной почты">
                    </div>

                </div>
                <br>
                <div class="row">
                    <div class="col-md-8 mb-4 col-md-offset-2">
                        <label for="j_password">Пароль</label>
                        <input class="form-control" type="password" id="j_password" name="j_password" placeholder="Введите пароль">
                    </div>
                </div>
                <br>

                <div class="row">
                    <div class="col-md-4 mb-4 col-md-offset-2">
                        <button class="btn btn-lg btn-primary btn-block" type="submit">Войти</button>
                    </div>
                    <div class="col-md-4 mb-4">
                        <button class="btn btn-lg btn-primary btn-block" type="submit">Регистрация</button>
                    </div>

                </div>

                <br>
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        Пожалуйста, введите логин и пароль для входа в систему, если вы уже зарегистрированы, или пройдите регистрацию в системе
                    </div>
                </div>

                <br>
                <br>
            </div>




        </div>
    </form>

</body>
</html>