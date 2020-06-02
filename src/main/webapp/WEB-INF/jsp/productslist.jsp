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
	<title>Список товаров</title>
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
							<h3>Поиск товара</h3>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 mb-4">
							<input type="text" class="form-control" id="findProduct" placeholder="По наименованию"/>
						</div>
					</div>	
					<br><br>
				</div>		
				<div class="col-md-12">
					<div class="row">
						<div class="text-left col-md-6 mb-6">
							<h3>Список товаров</h3>
						</div>
					</div>			
					<div class="row">
						<table class="table table-striped table-bordered table-hover table-responsive" id="tableProducts">
							<thead>
								<tr>
									<th scope="col">Наименование товара</th>
									<th scope="col">Артикул</th>
									<th scope="col">Категория</th>
									<th scope="col">Поставщик</th>
									<th scope="col">Количество</th>
									<th scope="col">Цена за единицу</th>										
									<th scope="col">Срок годности</th>
									<th scope="col">Карточка товара</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${productList}" var="product">
								<tr>
									<td> ${product.productName}</td>
									<td> ${product.articul}</td>
									<td>${product.productTypesByProductTypeId.productTypeName}</td>
									<td>${product.contragentsByContragentId.contragentName}</td>
									<td>${product.productStatusByProductId[0].quantityWarehouse}</td>
									<td>${product.productPrice}</td>
									<td>${product.productStatusByProductId[0].validityDate}</td>
									<td><button id="${product.productId}" class="btn btn-primary">Карточка товара</button></td>
								</tr>
							</c:forEach>	
							</tbody>
						</table>
					</div>
				</div>
			</form>	
		</div>
	</div>
</div>

</body>

<script>

$(document).ready(function() {
	
	
	
	
/*	
	$.ajax({ 
	    type: 'GET', 
	    url: "/typeproduct/listProductTypes",
	    dataType: 'json',
	    contentType: 'application/json',
	    success: function (data) {
			data.forEach(function (item){	
			var rowl = '<tr><td>' + item.productTypeName + '</td>' +
				'<td class="text-center"><button id="'+ item.productTypeId +'" class="delete btn btn-primary" type="submit">Удалить</button></td></tr>';
			$('#typeProductTable > tbody').append(rowl);
			var sel = "[id='" + item.productTypeId + "']";
			$(sel).click(function (id) {	
				var json = { "productTypeId" : item.productTypeId };
		        if (confirm('Вы желаете удалить данную категорию товара из вашей базы?')) {
		        	$.ajax({
						type : "DELETE",
						contentType : "application/json",
						url : "/typeproduct/deleteProductType",
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
	
	$("#addNewProductType").click(function() {		
		var json = {
			"productTypeName" : $('#productTypeName').val()
		}; 
		var productTypeEntity = JSON.stringify(json);
        if (confirm('Вы желаете добавить новую категорию товара в вашу базу?')) {
        	$.ajax({
    			type : "POST",
    			contentType : "application/json",
    			url : "/typeproduct/addNewProductType",
    			data : productTypeEntity,
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
*/	
	$("#tableProducts").searcher({
	    inputSelector: "#findProduct"
	});
	
});
	

</script>