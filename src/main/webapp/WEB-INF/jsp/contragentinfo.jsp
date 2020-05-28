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
				<div class="col-md-12 form-group">
					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="articul">Наименование поставщика*</label>
							<input type="text" class="form-control" id="nameContragent" name="nameContragent" />
						</div>
						<div class="col-md-4 mb-3">
							<label for="productPrice">Адрес</label>
							<input type="text" class="form-control" id="addressContragent" name="addressContragent" />
						</div>
						<div class="col-md-4 mb-3">
								<label for="details">Zip code</label>
								<input type="text" class="form-control" id="zipCodeContragent" name="zipCodeContragent" />
							</div>
					</div>
					
					<br><br>
					
					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="articul">Контактный телефон №1</label>
							<input type="text" class="form-control" id="phone1Contragent" name="phone1Contragent" />
						</div>
						<div class="col-md-4 mb-3">
							<label for="productPrice">Контактный телефон №2</label>
							<input type="text" class="form-control" id="phone2Contragent" name="phone2Contragent" />
						</div>
					</div>
					
					<br><br>

					<div class="row">
						<div class="form-group">
							<div class="col-md-4 mb-3">
								<label for="productQuantity">ИНН*</label>
								<input type="text" class="form-control" id="innContragent" name="innContragent" />
							</div>
							<div class="col-md-4 mb-3">
								<label for="details">УНК*</label>
								<input type="text" class="form-control" id="unkContragent" name="unkContragent" />
							</div>
						</div>
					</div>
					
					<br><br>
					
					<div class="row">
						<div class="text-right">
							<button class="btn btn-primary" type="submit" id="addContragent">Добавить</button>
						</div>
					</div>
				</div>
				
				<div class="col-md-12 form-group">
					<br><br><br>
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
	    url: "/contragentinfo/listContragents",
	    dataType: 'json',
	    contentType: 'application/json',
	    success: function (data) {
			data.forEach(function (item){	
			var rowl = '<tr><td>' + item.contragentName + '</td>' +
				'<td>' + item.phone1 + '</td>' +
				'<td>' + item.inn + '</td>' +
				'<td>' + item.unk + '</td>' + 
				'<td><button id="'+ item.contragentId +'" class="delete btn btn-primary" type="submit">Удалить</button></td></tr>';
			$('#contragentTable > tbody').append(rowl);
			var sel = "[id='" + item.contragentId + "']";	
			$(sel).click(function (id) {	
				var json = { "contragentId" : item.contragentId };
				$.ajax({
					type : "DELETE",
					contentType : "application/json",
					url : "/contragentinfo/deleteContragent",
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
		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "/contragentinfo/addNewContagent",
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
		
	});

});
	

</script>