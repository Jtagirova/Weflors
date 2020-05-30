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
					<div class="row">
						<div class="col-md-4 mb-4">
							<input type="text" class="form-control" id="findUser" placeholder="Введите имя пользователя"/>
						</div>
					</div>	
					<br><br>
				</div>			
				<div class="col-md-12 form-group">
					<div class="row">
						<div class="col-md-4 mb-4">
							<h3>Добавление нового пользователя</h3>
						</div>
					</div>
				</div>	
				<div class="col-md-12 form-group">
					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="userName">Имя</label>
							<input type="text" class="form-control" id="userName" name="userName" placeholder="Имя"/>
						</div>
						<div class="col-md-3 mb-3">
							<label for="userSurname">Фамилия</label>
							<input type="text" class="form-control" id="userSurname" name="userSurname" placeholder="Фамилия"/>
						</div>
						<div class="col-md-3 mb-3">
							<label for="adminRole">Роль</label>
							<br>	
							Администратор   <input type="checkbox" id="adminRole" name="adminRole"/>
						</div>
					</div>					
					<br><br>					
					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="userEmail">E-mail*</label>
							<input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="E-mail"/>
						</div>
						<div class="col-md-3 mb-3">
							<label for="userTelephoneNumber">Телефон</label>
							<input type="text" class="form-control" id="userTelephoneNumber" name="userTelephoneNumber" placeholder="Телефон"/>
						</div>
						<div class="col-md-3 mb-3">
						<br>
							Пользователь   <input type="checkbox" id="userRole" name="userRole" class="mt-3"/>
						</div>
					</div>
					<br><br>
					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="userLogin">Логин</label>
							<input type="text" class="form-control" id="userLogin" name="userLogin" placeholder="Логин"/>
						</div>
						<div class="col-md-3 mb-3">
							<label for="userPass">Пароль*</label>
							<input type="text" class="form-control" id="userPass" name="userPass" placeholder="Пароль"/>
						</div>
						<div class="col-md-3 mb-3">
							<label for="userRepeatPass">Повторить пароль</label>
							<input type="text" class="form-control" id="userRepeatPass" name="userRepeatPass" placeholder="Повторить пароль"/>
						</div>
						<div class="col-md-3 mb-3">
						<br>	
							<div class="text-center">
								<button class="btn btn-primary" type="submit" id="addNewUser">Добавить</button>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="row">
						<div class="text-left col-md-4 mb-4">
							<h6>*поля обязательны к заполнению</h6>
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<br><br>
					<div class="row">
						<div class="text-left col-md-4 mb-3">
							<h3>Список пользователей</h3>
						</div>
					</div>
					<br>
					<div class="row">
						<div>
									<%--							<form:form method="POST" id="writeoffForm">--%>
							<table class="table table-striped table-bordered table-hover table-responsive" id="usersTable">
								<thead>
									<tr>
										<th scope="col">Имя</th>
										<th scope="col">Фамилия</th>
										<th scope="col">Логин</th>
										<th scope="col">Email</th>
										<th scope="col">Телефон</th>
										<th scope="col">Роль</th>
										<th scope="col">Удалить</th>
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
			var rowl = '<tr><td>' + item.contragentName + '</td>' +
				'<td>' + item.phone1 + '</td>' +
				'<td>' + item.inn + '</td>' +
				'<td>' + item.unk + '</td>' + 
				'<td class="text-center"><button id="'+ item.contragentId +'" class="delete btn btn-primary" type="submit">Удалить</button></td></tr>';
			$('#contragentTable > tbody').append(rowl);
			var sel = "[id='" + item.contragentId + "']";
			$(sel).click(function (id) {	
				var json = { "contragentId" : item.contragentId };
		        if (confirm('Вы желаете удалить данного поставщика из вашей базы?')) {
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
			});    	
	    }
	});	
	
	$("#addNewUser").click(function() {		
		var contragentName = $('#nameContragent').val();
		var address = $('#addressContragent').val();
		var phone1 = $('#phone1Contragent').val();
		var phone2 = $('#phone2Contragent').val();
		var inn = $('#innContragent').val();
		var unk = $('#unkContragent').val();
		var zipCode = $('#zipCodeContragent').val();
		var json = {
			"contragentName" : contragentName,
			"address" : address,
			"phone1" : phone1,
			"phone2" : phone2,
			"inn" : inn,
			"unk" : unk,
			"zipCode" : zipCode		
		}; 
		var contragentsEntity = JSON.stringify(json);
        if (confirm('Вы желаете добавить данного поставщика в вашу базу?')) {
        	$.ajax({
    			type : "POST",
    			contentType : "application/json",
    			url : "/users/addNewUser",
    			data : contragentsEntity,
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
	
	$("#usersTable").searcher({
	    inputSelector: "#findUser"
	});
	
});
	

</script>