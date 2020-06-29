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
	<title>Справочник категорий товара</title>
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
							<h3>Поиск категории товара</h3>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-4 mb-4">
							<input type="text" class="form-control" id="findNameProductType" placeholder="Введите наименование категории"/>
						</div>
					</div>	
					<br>
				</div>
				<sec:authorize access="hasAuthority('admin')">
				<div class="col-md-12 form-group">
					<div class="row">
						<div class="col-md-4 mb-4">
							<h3>Добавление категории товара</h3>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="productTypeName">Наименование категории*</label>
							<input type="text" class="form-control" id="productTypeName" name="productTypeName" placeholder="Наименование категории"/>
							<input type="hidden" id="productTypeId" name="productTypeId"/>
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
								<button class="btn btn-primary" type="submit" id="addNewProductType" disabled>Добавить</button>
								<button class="btn btn-primary" type="submit" id="updateProductType" disabled>Сохранить изменения</button>
								<button class="btn btn-primary" type="submit" id="cancel">Отменить</button>
							</div>
						</div>
					</div>
				</div>
				</sec:authorize>
				<div class="col-md-12 form-group">
					<br><br>
					<div class="row">
						<div class="text-left col-md-4 mb-4">
							<h3>Список категорий товара</h3>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-12">
									<%--							<form:form method="POST" id="writeoffForm">--%>
							<table class="table table-striped table-bordered table-hover table-responsive" id="typeProductTable">
								<thead>
									<tr>
										<th scope="col" class="text-center">Наименование категории товара</th>
										<th scope="col" class="text-center">Изменение / Удаление</th>
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
	
	$('#updateProductType').hide();
	$('#cancel').hide();
	
	$.ajax({ 
	    type: 'GET', 
	    url: "/typeproduct/listProductTypes",
	    dataType: 'json',
	    contentType: 'application/json',
	    success: function (data) {
			data.forEach(function (item){	
			var rowl = '<tr><td>' + item.productTypeName + '</td>' +
				'<td class="text-center"><input type="button" changeId="'+ item.productTypeId +'" class="btn btn-primary" value="Изменить">' + ' / ' +
				'<button deleteId="'+ item.productTypeId +'" class="btn btn-primary" type="submit">Удалить</button></td></tr>';
			$('#typeProductTable > tbody').append(rowl);
			var cid = "[changeId='" + item.productTypeId + "']";
			$(cid).click(function (id) {
				$("#updateProductType").attr("disabled", "disabled");
				$('#productTypeId').val(item.productTypeId);	
				$('#productTypeName').val(item.productTypeName);
				$('#addNewProductType').hide();
				$('#updateProductType').show();	
				$('#cancel').show();	
			});
			var did = "[deleteId='" + item.productTypeId + "']";
			$(did).click(function (id) {	
				var json = { "productTypeId" : item.productTypeId };
			    if (confirm('Вы желаете удалить данную категорию товара из вашей базы данных?')) {
			       	$.ajax({
						type : "DELETE",
						contentType : "application/json",
						url : "/typeproduct/deleteProductType",
						data : JSON.stringify(json),
						dataType : 'text',
						cache : false,
						timeout : 600000,
						success : function(data) {
							alert(data);
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
	
	$("#addNewProductType").click(function() {		
		var json = { "productTypeName" : $('#productTypeName').val()	}; 
		var productTypeEntity = JSON.stringify(json);
        if (confirm('Вы желаете добавить новую категорию товара в вашу базу данных?')) {
        	$.ajax({
    			type : "POST",
    			contentType : "application/json",
    			url : "/typeproduct/addNewProductType",
    			data : productTypeEntity,
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
        };
        $("#addNewProductType").attr("disabled", "disabled");
	});
	
	
	$("#updateProductType").click(function() {
		var productTypeId = $('#productTypeId').val();
		var productTypeName = $('#productTypeName').val();
		var json = {
				"productTypeId" : productTypeId,
				"productTypeName" : productTypeName	
		}; 
        if (confirm('Вы желаете изменить данные о категории товара в вашей базе данных?')) {
        	$.ajax({
    			type : "POST",
    			contentType : "application/json",
    			url : "/typeproduct/updateProductType",
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
        $("#addNewProductType").attr("disabled", "disabled");
        $('#updateProductType').hide();
	});	
	
	$("#cancel").click(function() {	
		location.reload(true);
	});
	
	$('input').change(function(){
		var productTypeName = $('#productTypeName').val();
		if (productTypeName !=''){
			$("#addNewProductType").removeAttr("disabled");
			$("#updateProductType").removeAttr("disabled");
		} else {
			$("#addNewProductType").attr("disabled", "disabled");
			$("#updateProductType").attr("disabled", "disabled");
		}
	});
	
	$("#typeProductTable").searcher({
	    inputSelector: "#findNameProductType"
	});
	
});
	

</script>