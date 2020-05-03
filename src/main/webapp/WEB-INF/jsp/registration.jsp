<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Регистрация</title>
</head>

<body>
<div>
  <form:form method="POST" modelAttribute="userForm">
    <h2>Регистрация</h2>
    <div>
      <form:input type="text" path="eMail" placeholder="eMail"></form:input>
    </div>
    <div>
      <form:input type="text" path="userName" placeholder="User Name"></form:input>
    </div>

    <div>
      <form:input type="password" path="password" placeholder="Password"></form:input>
    </div>
    <div>
      <form:input type="password" path="passwordConfirm"
                  placeholder="Confirm your password"></form:input>

    </div>   
    <div>
      <form:input type="text" path="userLastname" placeholder="User Lastname"></form:input>
    </div>
    <div>
      <form:input type="text" path="login" placeholder="login"
                  autofocus="true"></form:input>
     
    </div>
    <div>
      <form:input type="text" path="phone" placeholder="Phone"></form:input>
    </div>
    <button type="submit">Зарегистрироваться</button>
  </form:form>
</div>
</body>
</html>