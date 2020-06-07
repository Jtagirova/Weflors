<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head lang="en">

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>Пользователи</title>
	<jsp:include page="/WEB-INF/jsp/base_layout/head_links.jsp"></jsp:include>
</head>
<body>

<div class="container-fluid ">
	<div class="row">
		<jsp:include page="/WEB-INF/jsp/base_layout/leftnav.jsp"></jsp:include>
		<div class="col-md-8">
			<jsp:include page="/WEB-INF/jsp/base_layout/topnav.jsp"></jsp:include>

			<!-- Form Content Here -->
			<form>			
				<div class="col-md-12 form-group">
					<div class="row">
						<div class="col-md-4 mb-4">
							<h3>Поиск пользователя</h3>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-4 mb-4">
							<input type="text" class="form-control" id="findUser" placeholder="Введите имя пользователя"/>
						</div>
					</div>	
					<br>
				</div>			
				<div class="col-md-12 form-group">
					<div class="row">
						<div class="col-md-4 mb-4">
							<h3>Изменение данных пользователя</h3>
						</div>
					</div>
				</div>	
				<div class="col-md-12 form-group">
					<div class="row">
						<div class="col-md-4 mb-4">
							<input type="hidden" id="userId" name="userId" >
							<label for="userName">Имя*</label>
							<input type="text" class="form-control" id="userName" name="userName" placeholder="Имя" />
						</div>
						<div class="col-md-4 mb-4">
							<label for="userLastName">Фамилия*</label>
							<input type="text" class="form-control" id="userLastName" name="userLastName"  placeholder="Фамилия"/>
						</div>
						<div class="col-md-4 mb-4">
							<label for="adminRole">Роль*</label>
							<br>	
							Администратор   	<label><input type="radio" id="adminRole"  name="radio" value="1"/></label>
						</div>
					</div>					
					<br><br>					
					<div class="row">
						<div class="col-md-4 mb-4">
							<label for="userEmail">E-mail*</label>
							<input type="text" class="form-control" id="userEmail" name="userEmail"  value="" placeholder="E-mail"/>
						</div>
						<div class="col-md-4 mb-4">
							<label for="userPhone">Телефон*</label>
							<input type="text" class="form-control" id="userPhone" name="userPhone" placeholder="Телефон"/>
						</div>
						<div class="col-md-4 mb-4">
						<br>
							Пользователь  	<label> <input type="radio" id="userRole" name="radio" value="2" /></label>
						</div>
					</div>
					<br><br>
					<div class="row">
						<div class="col-md-4 mb-4">
							<label for="userLogin">Логин*</label>
							<input type="text" class="form-control" id="userLogin" name="userLogin" placeholder="Логин"/>
						</div>
						<div class="col-md-4 mb-4">
							<label for="userPass">Пароль*</label>
							<input type="password" class="form-control" id="userPass" name="userPass" placeholder="Пароль"/>
						</div>
						<div class="col-md-4 mb-4">
							<label for="userRepeatPass">Повторить пароль*</label>
							<input type="password" class="form-control" id="userRepeatPass" name="userRepeatPass" placeholder="Повторить пароль" />
						</div>
					</div>
				</div>
				<div class="col-md-12 form-group">
					<div class="row">
						<div class="text-left col-md-4 mb-4">
							<h6>*поля обязательны к заполнению</h6>
						</div>
						<div class="col-md-4 col-md-offset-8">
							<div class="text-right">
								<button class="btn btn-primary" type="submit" id="saveChangedUser" disabled>Сохранить изменения</button>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-12 form-group">
					<br><br>
					<div class="row">
						<div class="text-left col-md-4 mb-4">
							<h3>Список пользователей</h3>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-12">
									<%--							<form:form method="POST" id="writeoffForm">--%>
							<table class="table table-striped table-bordered table-hover table-responsive" id="usersTable">
								<thead>
									<tr>
										<th scope="col" class="text-center">Имя</th>
										<th scope="col" class="text-center">Фамилия</th>
										<th scope="col" class="text-center">Логин</th>
										<th scope="col" class="text-center">Email</th>
										<th scope="col" class="text-center">Телефон</th>
										<th scope="col" class="text-center">Роль</th>
										<th scope="col" class="text-center">Изменение / Удаление</th>
<!--  									<th scope="col">Изменить</th>
										<th scope="col">Удалить</th>-->	
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

</body>

<script>

$(document).ready(function() {
	
	$.ajax({ 
	    type: 'GET', 
	    url: "/users/listUsers",
	    dataType: 'json',
	    contentType: 'application/json',
	    success: function (data) {
			data.forEach(function (item){	
			var roleName;
			if(item.userRoleMapsByUserId[0].roleId == 1){
				roleName = "Администратор";
			} else {
				roleName = "Пользователь";
			}
			var rowl = '<tr id = "' +  item.userId + '">' +
				'<td>' + item.userName + '</td>' +
				'<td>' + item.userLastname + '</td>' +
				'<td>' + item.login + '</td>' +
				'<td>' + item.eMail + '</td>' +
				'<td>' + item.phone + '</td>' + 
				'<td>' + roleName + '</td>' + 
				'<td class="text-center"><input type="button" changeId="'+ item.userId +'" class="change btn btn-primary" value="Изменить">' + ' / ' +
				'<button deleteId="'+ item.userId +'" class="delete btn btn-primary" type="submit">Удалить</button></td></tr>';
<!--				'<td class="text-center"><input type="button" changeId="'+ item.userId +'" class="change btn btn-primary" value="Изменить"></td>' +
				'<td class="text-center"><button deleteId="'+ item.userId +'" class="delete btn btn-primary" type="submit">Удалить</button></td></tr>'; 
				-->	
			$('#usersTable > tbody').append(rowl);	
			var did = "[deleteId='" + item.userId + "']";
			$(did).click(function (id) {	
				var json = { "userId" : item.userId };
		        if (confirm('Вы желаете удалить данного пользователя из вашей базы?')) {
		        	$.ajax({
						type : "DELETE",
						contentType : "application/json",
						url : "/users/deleteUser",
						data : JSON.stringify(json),
						dataType : 'json',
						cache : false,
						timeout : 600000,
						success : function(data) {
							alert(data.responseText);
						},
						error : function(data) {	
							alert(data.responseText);
						}
					});
		        }
			});
			var cid = "[changeId='" + item.userId + "']";
			$(cid).click(function (cid) {
				$('#userId').val(item.userId);
				$('#userName').val(item.userName);
				$('#userLastName').val(item.userLastname);
				$('#userLogin').val(item.login);
				$('#userEmail').val(item.eMail);
				$('#userPhone').val(item.phone);	
				item.userRoleMapsByUserId.forEach(function (item){
					if(item.roleId == 1){
						document.querySelector('#adminRole').checked = true;
					} else if(item.roleId == 2) {
						document.querySelector('#userRole').checked = true;
					}	
				});
				
			});
			});    	
	    }
	});	
	
	$("#saveChangedUser").click(function() {	
		var userId = $('#userId').val();
		var userName = $('#userName').val();
		var userLastName = $('#userLastName').val();
		var userLogin = $('#userLogin').val();
		var userEmail = $('#userEmail').val();
		var userPhone = $('#userPhone').val();
		var userPass = $('#userPass').val();
		var userRoleMap = [];
		var roleId = $('input:radio:checked').val();
		var userRole = {
			"userId" : userId,
			"roleId" : roleId
		};
		var json = {
			"eMail" : userEmail,	
			"login" : userLogin,	
			"password" : userPass,
			"phone" : userPhone,
			"userId" : userId,
			"userLastname" : userLastName,
			"userName" : userName,
			"userRoleMapsByUserId" : userRole
		}; 
        if (confirm('Вы желаете изменить данные пользователя в вашей базе?')) {
        	$.ajax({
    			type : "POST",
    			contentType : "application/json",
    			url : "/users/updateUser",
    			data : JSON.stringify(json),
    			dataType : 'json',
    			cache : false,
    			timeout : 600000,
    			success : function(data) {
    				alert(data.responseText);
    			},
    			error : function(data) {	
    				alert(data.responseText);
    			}
    		});	
        	location.reload(true)
        }
	});
	
	$("#usersTable").searcher({
	    inputSelector: "#findUser"
	});
	
	$("#userRepeatPass").on("blur", function() { 
		var passwordValue = $("#userPass").val();
		var passwordRepeatValue = $("#userRepeatPass").val();
		if(passwordValue != passwordRepeatValue ) { 
			alert("Пароли не совпадают!"); 
			$("#saveChangedUser").attr("disabled", "disabled");
		} else { 
			$("#saveChangedUser").removeAttr("disabled");
		}
	});
	
});
	

</script>