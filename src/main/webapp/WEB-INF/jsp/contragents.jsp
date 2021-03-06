<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
  						
				<div class="col-md-12 form-group">
					<div class="row">
						<div class="col-md-4 mb-4">
							<h3>Поиск поставщика</h3>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-4 mb-4">
							<input type="text" class="form-control" id="findContragent" 
								placeholder="Введите наименование поставщика"/>
						</div>
					</div>	
					<br>
				</div>
			<form>	
 				<sec:authorize access="hasAuthority('admin')">

				<div class="col-md-12 form-group">
					<div class="row">
						<div class="col-md-4 mb-4">
							<h3>Добавление поставщика</h3>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="nameContragent">Наименование поставщика*</label>
							<input type="text" class="form-control" id="nameContragent" name="nameContragent" 
								placeholder="Наименование поставщика" maxlength ="50" required/>
							<input type="hidden" id="contragentId" name="contragentId"/>
						</div>
						<div class="col-md-4 mb-3">
							<label for="addressContragent">Адрес*</label>
							<input type="text" class="form-control" id="addressContragent" name="addressContragent" 
								placeholder="Адрес" maxlength ="100" required/>
						</div>
						<div class="col-md-4 mb-3">
							<label for="zipCodeContragent">Индекс</label>
							<input type="number" class="form-control" id="zipCodeContragent" name="zipCodeContragent" 
								placeholder="Индекс" maxlength ="15"
								oninput="this.value=this.value.replace(/[^0-9]/g,'');" required/>
						</div>
					</div>					
					<br><br>					
					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="phone1Contragent">Контактный телефон №1*</label>
							<input type="tel" class="telephone form-control" id="phone1Contragent" name="phone1Contragent" 
								placeholder="Контактный телефон №1" maxlength ="50"
								pattern="\+7\s?[\(]{0,1}9[0-9]{2}[\)]{0,1}\s?\d{3}[-]{0,1}\d{2}[-]{0,1}\d{2}" 
								title="Формат: +7 (900) 123-45-67" />
						</div>
						<div class="col-md-4 mb-3">
							<label for="phone2Contragent">Контактный телефон №2</label>
							<input type="tel" class="telephone form-control" id="phone2Contragent" name="phone2Contragent" 
								placeholder="Контактный телефон №2" maxlength ="50"
								pattern="\+7\s?[\(]{0,1}9[0-9]{2}[\)]{0,1}\s?\d{3}[-]{0,1}\d{2}[-]{0,1}\d{2}" 
								title="Формат: +7 (900) 123-45-67"/>
						</div>
					</div>
					<br><br>
					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="innContragent">ИНН*</label>
							<input type="text" class="form-control" id="innContragent" name="innContragent" 
								placeholder="ИНН" oninput="this.value=this.value.replace(/[^0-9]/g,'');" pattern="\d+" maxlength ="15"/>
						</div>
						<div class="col-md-4 mb-3">
							<label for="unkContragent">УНК*</label>
							<input type="text" class="form-control" id="unkContragent" name="unkContragent" 
								placeholder="УНК" oninput="this.value=this.value.replace(/[^0-9]/g,'');" pattern="\d+" maxlength ="15" />
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
								<button class="btn btn-primary" type="submit" id="addContragent" disabled>Добавить</button>
  								<button class="btn btn-primary" type="submit" id="updateContragent" disabled>Сохранить изменения</button>
  								<button class="btn btn-primary" type="submit" id="cancel">Отменить</button>
							</div>
						</div>
					</div>
				</div>	
 				</sec:authorize>
 			</form>	
				<div class="col-md-12 form-group">
					<br><br>
					<div class="row">
						<div class="text-left col-md-4 mb-4">
							<h3>Список поставщиков</h3>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-12">
							<table class="table table-striped table-bordered table-hover table-responsive" id="contragentTable">
								<thead>
									<tr>
										<th scope="col" class="text-center">Наименование поставщика</th>
										<th scope="col" class="text-center">Контактный телефон №1</th>
										<th scope="col" class="text-center">ИНН</th>
										<th scope="col" class="text-center">УНК</th>
										<sec:authorize access="hasAuthority('admin')"><th scope="col" class="text-center">Изменение / Удаление</th></sec:authorize>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>
					</div>
				</div>
		</div>
	</div>
</div>

</body>

<script>

$(document).ready(function() {
	
	$('#updateContragent').hide();
	$('#cancel').hide();
	
	$.ajax({ 
	    type: 'GET', 
	    url: "/contragents/list",
	    dataType: 'json',
	    contentType: 'application/json',
	    success: function (data) {
			data.forEach(function (item){	
				var rowl = '<tr><td>' + item.contragentName + '</td>' +
					'<td>' + item.phone1 + '</td>' +
					'<td>' + item.inn + '</td>' +
					'<td>' + item.unk + '</td>' +
					'<sec:authorize access="hasAuthority(\'admin\')">' +
					'<td class="text-center"><input type="button" changeId="'+ item.contragentId +'" class="btn btn-primary" value="Изменить">' + ' / ' +
					'<button deleteId="'+ item.contragentId +'" class="btn btn-primary" type="submit">Удалить</button></td>' +
					'</sec:authorize>' +
						'</tr>';
				$('#contragentTable > tbody').append(rowl);
				var cid = "[changeId='" + item.contragentId + "']";
				$(cid).click(function (id) {
					$("#updateContragent").attr("disabled", "disabled");
					$('#contragentId').val(item.contragentId);
					$('#nameContragent').val(item.contragentName);
					$('#addressContragent').val(item.address);
					$('#phone1Contragent').val(item.phone1);
					$('#phone2Contragent').val(item.phone2);
					$('#innContragent').val(item.inn);
					$('#unkContragent').val(item.unk);
					$('#zipCodeContragent').val(item.zipCode);	
					$('#addContragent').hide();
					$('#updateContragent').show();
					$('#cancel').show();	
				});
				var did = "[deleteId='" + item.contragentId + "']";
				$(did).click(function (id) {	
					var json = { "contragentId" : item.contragentId };
				    if (confirm('Вы желаете удалить данного поставщика из вашей базы данных?')) {
				       	$.ajax({
							type : "DELETE",
							contentType : "application/json",
							url : "/contragents/delete",
							data : JSON.stringify(json),
							dataType : 'text',
							cache : false,
							timeout : 600000,
							success : function(data) {
								alert(data);
								location.reload(true);
							},
							error : function(data) {	
								alert(data);
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
        if (confirm('Вы желаете добавить данного поставщика в вашу базу данных?')) {
        	$.ajax({
    			type : "POST",
    			contentType : "application/json",
    			url : "/contragents/add",
    			data : contragentsEntity,
    			dataType : 'text',
    			cache : false,
    			timeout : 600000,
    			success : function(data) {
    				alert(data);
    				location.reload(true);
    			},
    			error : function(data) {	
    				alert(data);
    			}
    		});	
        }
        $("#addContragent").attr("disabled", "disabled");
	});
	
	$("#updateContragent").click(function() {
		var contragentId = $('#contragentId').val();
		var contragentName = $('#nameContragent').val();
		var address = $('#addressContragent').val();
		var phone1 = $('#phone1Contragent').val();
		var phone2 = $('#phone2Contragent').val();
		var inn = $('#innContragent').val();
		var unk = $('#unkContragent').val();
		var zipCode = $('#zipCodeContragent').val();
		var json = {
				"contragentId" : contragentId,
				"contragentName" : contragentName,
				"address" : address,
				"phone1" : phone1,
				"phone2" : phone2,
				"inn" : inn,
				"unk" : unk,
				"zipCode" : zipCode		
		}; 
		var contragentEntity = JSON.stringify(json);
        if (confirm('Вы желаете изменить данные о поставщике в вашей базе?')) {
        	$.ajax({
    			type : "POST",
    			contentType : "application/json",
    			url : "/contragents/update",
    			data : contragentEntity,
    			dataType : 'text',
    			cache : false,
    			timeout : 600000,
    			success : function(data) {
    				alert(data);
    				location.reload(true);
    			},
    			error : function(data) {	
    				alert(data);
    			}
    		});	
        }
        $("#addContragent").attr("disabled", "disabled");
        $('#updateContragent').hide();
	});	
			
	$('input').change(function(){
		var contragentName = $('#nameContragent').val();
		var address = $('#addressContragent').val();
		var phone1 = $('#phone1Contragent').val();
		var phone2 = $('#phone2Contragent').val();
		var inn = $('#innContragent').val();
		var unk = $('#unkContragent').val();
		var zip = $('#zipCodeContragent').val();
		if ( contragentName !='' && address !='' && phone1 !='' && inn !='' && unk !=''){
			$("#addContragent").removeAttr("disabled");
			$("#updateContragent").removeAttr("disabled");
		} else {
			$("#addContragent").attr("disabled", "disabled");
			$("#updateContragent").attr("disabled", "disabled");
		}
		if (zip ==''){
			$('#zipCodeContragent').val(0);
		} 
		if (phone2 ==''){
			$('#phone2Contragent').val(0);
		}
	});

	$('.telephone').mask("+375 (29) 999-99-99");

	$('#contragentTable').searcher({
	    inputSelector: '#findContragent'
	});
	
	$('#cancel').click(function() {	
		location.reload(true);
	});
	
});
	

</script>