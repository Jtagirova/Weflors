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
	<title>Справочник поставщиков</title>
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
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-6 mb-6">
							<h3>Поиск поставщика</h3>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 mb-4">
							<input type="text" class="form-control" id="findContragent" placeholder="Введите имя поставщика"/>
						</div>
					</div>	
					<br><br>
				</div>			
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-4 mb-4">
							<h3>Добавление поставщика</h3>
						</div>
					</div>
				</div>	
				<div class="col-md-12 form-group">
					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="nameContragent">Наименование поставщика*</label>
							<input type="text" class="form-control" id="nameContragent" name="nameContragent" placeholder="Наименование поставщика"/>
						</div>
						<div class="col-md-4 mb-3">
							<label for="addressContragent">Адрес</label>
							<input type="text" class="form-control" id="addressContragent" name="addressContragent" placeholder="Адрес"/>
						</div>
						<div class="col-md-4 mb-3">
							<label for="zipCodeContragent">Индекс</label>
							<input type="text" class="form-control" id="zipCodeContragent" name="zipCodeContragent" placeholder="Индекс"/>
						</div>
					</div>					
					<br><br>					
					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="phone1Contragent">Контактный телефон №1</label>
							<input type="text" class="form-control" id="phone1Contragent" name="phone1Contragent" placeholder="Контактный телефон №1"/>
						</div>
						<div class="col-md-4 mb-3">
							<label for="phone2Contragent">Контактный телефон №2</label>
							<input type="text" class="form-control" id="phone2Contragent" name="phone2Contragent" placeholder="Контактный телефон №2"/>
						</div>
					</div>
					<br><br>
					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="innContragent">ИНН*</label>
							<input type="text" class="form-control" id="innContragent" name="innContragent" placeholder="ИНН"/>
						</div>
						<div class="col-md-4 mb-3">
							<label for="unkContragent">УНК*</label>
							<input type="text" class="form-control" id="unkContragent" name="unkContragent" placeholder="УНК"/>
						</div>
						<div class="col-md-4 mb-3">
						<br>	
							<div class="text-right">
								<button class="btn btn-primary" type="submit" id="addContragent">Добавить</button>
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
							<h3>Список поставщиков</h3>
						</div>
					</div>
					<br>
					<div class="row">
						<div>
									<%--							<form:form method="POST" id="writeoffForm">--%>
							<table class="table table-striped table-bordered table-hover table-responsive" id="contragentTable">
								<thead>
									<tr>
										<th scope="col">Наименование поставщика</th>
										<th scope="col">Контактный телефон №1</th>
										<th scope="col">ИНН</th>
										<th scope="col">УНК</th>
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
	    url: "/contragents/listContragents",
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
						url : "/contragents/deleteContragent",
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
	
	$("#addContragent").click(function() {		
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
    			url : "/contragents/addNewContagent",
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
	
	$("#contragentTable").searcher({
	    inputSelector: "#findContragent"
	});
	
});
	

</script>