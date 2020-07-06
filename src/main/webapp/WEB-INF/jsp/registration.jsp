<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Регистрация</title>
    <sec:authorize access="isAuthenticated()">
        <% response.sendRedirect("main"); %>
    </sec:authorize>
    <jsp:include page="/WEB-INF/jsp/base_layout/head_links.jsp"></jsp:include>
</head>
<body>

<!-- Form Content Here -->
<form:form method="POST" modelAttribute="userForm">
    <div class="container-login100">
        <div class="wrap-login100">
            <div class="login100-form-title" style="background-image: url('../img/background_theme2_opacity70.png')">
					<span class="login100-form-title-1">
                      <h4>Регистрация нового пользователя</h4>
					</span>
            </div>
            <br>
            <br>
            <div class="row">
                <div class="col-md-4 mb-4 col-md-offset-2">
                    <label for="userName">Имя*</label>
                    <form:input type="text" id="userName" class="form-control" path="userName"
                                placeholder="Имя" autofocus="true" maxlength ="50"></form:input>
                </div>
                <div class="col-md-4 mb-4">
                    <label for="userLastname">Фамилия*</label>
                    <form:input type="text" id="userLastname" class="form-control" path="userLastname"
                                placeholder="Фамилия" maxlength ="50"></form:input>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-md-4 mb-4 col-md-offset-2">
                    <label for="eMail">E-mail*</label>
                    <form:input type="email" id="eMail" class="form-control" path="eMail"
                                placeholder="E-mail" title="Email должен быть в формате example@google.com" maxlength ="50"></form:input>
                </div>
                <div class="col-md-4 mb-4">
                    <label for="phone">Телефон*</label>
                    <form:input type="text" id="phone" class="form-control" path="phone"
                                placeholder="Телефон" maxlength ="15"></form:input>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-md-8 mb-4 col-md-offset-2">
                    <label for="login">Логин*</label>
                    <form:input type="text" id="login" class="form-control" path="login"
                                placeholder="Логин" maxlength ="50"></form:input>
                </div>
            </div>
            <br>
            
            
            <div class="alert alert-success">
			  ${usernameError}
			</div>
            
            
            
            
            <div class="row">
                <div class="col-md-4 mb-4 col-md-offset-2">
                    <label for="password">Пароль*</label>
                    <form:input type="password" id="password" class="form-control" path="password"
                                placeholder="Пароль" maxlength ="100"></form:input>
                </div>
                <div class="col-md-4 mb-4 ">
                    <label for="passwordConfirm">Повторить пароль*</label>
                    <form:input type="password" id="passwordConfirm" class="form-control" path="passwordConfirm"
                                placeholder="Повторить пароль"></form:input>
                </div>
            </div>
            <div class="row">
                <div class="text-left col-md-4 mb-4 col-md-offset-2">
                    <h6>*поля обязательны к заполнению</h6>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-md-4 mb-4 col-md-offset-2">
                    <div class="text-left">
                        <button class="btn btn-primary btn-block" name="backtologin">Вход в систему</button>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="text-right">
                        <button class="btn btn-primary btn-block" type="submit" id="registration" disabled
                        title="Заполните все поля с *">Зарегистрироваться</button>
                    </div>
                </div>
            </div>
            <br>
            <br>
        </div>
    </div>
    

    
    
    
</form:form>
</body>
</html>

<script>
$(document).ready(function() {
	
	$(".alert").alert();
	$('input').change(function(){
		var userName = $('#userName').val();
		var userLastname = $('#userLastname').val();
		var eMail = $('#eMail').val();
		var phone = $('#phone').val();
		var login = $('#login').val();
		var password = $('#password').val();
		var passwordConfirm = $('#passwordConfirm').val();
		if ( userName !='' && userLastname !='' && eMail !='' && 
			 phone !='' && login !='' && password !='' && passwordConfirm !=''){
			$('#registration').removeAttr('disabled');
		} else {
			$('#registration').attr('disabled', 'disabled');
		}
	});
	
	$('#passwordConfirm').on('blur', function(){ 
		if($('#password').val() != $('#passwordConfirm').val() ) { 
			alert('Пароли не совпадают!'); 
		}
	});
	
	$('#phone').mask('+375(29)9999999');
	
});
</script>