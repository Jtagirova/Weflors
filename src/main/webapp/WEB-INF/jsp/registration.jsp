<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Регистрация</title>
  <jsp:include page="/WEB-INF/jsp/base_layout/head_links.jsp"></jsp:include>
</head>
<body>

      <!-- Form Content Here -->
      <form:form method="POST" modelAttribute="userForm">

        <div class="container-login100">
          <div class="wrap-login100">
            <div class="login100-form-title" style="background-image: url('../img/background_theme2_opacity70.png')">
					<span class="login100-form-title-1">
                        Регистрация нового пользователя
					</span>
            </div>
            <br>
            <br>
            <div class="row">
              <div class="col-md-4 mb-4 col-md-offset-2">
                <label for="userName">Имя</label>
                <form:input type="text" id="userName" class="form-control" path="userName" placeholder="Имя"></form:input>

              </div>
              <div class="col-md-4 mb-4">
                <label for="userLastname">Фамилия</label>
                <form:input type="text" id="userLastname" class="form-control" path="userLastname" placeholder="Фамилия"></form:input>
              </div>

            </div>
            <br>
            <div class="row">
              <div class="col-md-4 mb-4 col-md-offset-2">
                <label for="eMail">E-mail*</label>
                <form:input type="text" id="eMail" class="form-control" path="eMail" placeholder="E-mail"></form:input>

              </div>
              <div class="col-md-4 mb-4">
                <label for="phone">Телефон</label>
                <form:input type="text" id="phone" class="form-control" path="phone" placeholder="Телефон"></form:input>
              </div>

            </div>
            <br>
            <div class="row">
              <div class="col-md-4 mb-4 col-md-offset-2">
                <label for="login">Логин</label>
                <form:input type="text" шв="login" class="form-control" path="login" placeholder="Логин" autofocus="true"></form:input>
              </div>
              <div class="col-md-4 mb-4">
                <label for="password">Пароль*</label>
                <form:input type="password" id="password" class="form-control" path="password" placeholder="Пароль"></form:input>
              </div>

            </div>
            <br>
            <div class="row">
              <div class="col-md-4 mb-4 col-md-offset-2">
                <label for="passwordConfirm">Повторить пароль</label>
                <form:input type="password" id="passwordConfirm" class="form-control" path="passwordConfirm" placeholder="Повторить пароль"></form:input>
              </div>
              <div class="col-md-4 mb-4 col-md-offset-1">
                <label for="imortantfield">*</label>
                - поля обязательны к заполнению
              </div>
            </div>
            <br>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Зарегистрироваться</button>

            <br>
            <br>
          </div>




        </div>

      </form:form>


</body>
</html>