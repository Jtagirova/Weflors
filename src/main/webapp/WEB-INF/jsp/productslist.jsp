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


				<div class="col-md-12">
					<div class="row">
						<div class="col-md-6 mb-6">
							<h3>Поиск товара</h3>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-4 mb-4">
							<input type="text" class="form-control" id="findProduct" placeholder="По наименованию"/>
						</div>
					</div>	
					<br>
				</div>		
				<div class="col-md-12 form-group">
					<div class="row">
						<div class="text-left col-md-4 mb-4">
							<h3>Список товаров</h3>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-12">
						<table class="table table-striped table-bordered table-hover table-responsive" id="tableProducts">
							<thead>
								<tr>
									<th scope="col" class="text-center">Наименование товара</th>
									<th scope="col" class="text-center">Артикул</th>
									<th scope="col" class="text-center">Категория</th>
									<th scope="col" class="text-center">Поставщик</th>
									<th scope="col" class="text-center">Количество</th>
									<th scope="col" class="text-center">Цена за единицу</th>
									<th scope="col" class="text-center">Срок годности</th>
									<th scope="col" class="text-center">Фотография / Удаление</th>
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
									<td class="text-center"><button id="openProductPhoto${product.productId}" data-toggle="modal" data-target="#myModalNorm" class="btn btn-primary">Фото</button>
										 / <button id="Delete ${product.productId}" class="btn btn-primary">Удалить</button></td>
								</tr>
							</c:forEach>	
							</tbody>
						</table>
						</div>
					</div>
				</div>



			<!-- Button trigger modal -->
<%--			<button class="btn btn-primary" data-toggle="modal" data-target="#myModalNorm">
				пример запуска "Фото"
			</button>--%>

			<!-- Modal -->
			<div class="modal fade" id="myModalNorm" tabindex="-1" role="dialog"
				 aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<!-- Modal Header -->
						<div class="modal-header">
							<button type="button" class="close"
									data-dismiss="modal">
								<span aria-hidden="true">&times;</span>
								<span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title text-center" id="myModalLabel">
								Фотография товара
							</h4>
						</div>

						<!-- Modal Body -->
						<div class="modal-body">

							<form role="form">

								<div class="form-group">

									<div class="fileinput fileinput-new" data-provides="fileinput">
										<div class="fileinput-new thumbnail" style="width: 384px; height: 243px;">
											<img src="/img/product_photo.png" alt="...">
										</div>
										<div class="fileinput-preview fileinput-exists thumbnail"
											 style="max-width: 384px; max-height: 243px;"></div>
										<div>
                                    <span class="btn btn-primary btn-file">
                                        <span class="fileinput-new">Выбрать фотографию</span>
                                        <span class="fileinput-exists">Изменить</span><input type="file" name="...">
                                    </span>
											<span class="btn btn-default fileinput-exists" data-dismiss="fileinput">Удалить</span>
											<%--<a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Удалить</a>--%>

										</div>
									</div>

<%--									<label for="exampleInputPassword1">Password</label>
									<input type="password" class="form-control"
										   id="exampleInputPassword1" placeholder="Password"/>--%>
								</div>

							</form>


						</div>

						<!-- Modal Footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
									data-dismiss="modal">
								Закрыть
							</button>
							<button type="button" class="btn btn-primary">
								Сохранить изменения
							</button>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>

</body>

<script>

$(document).ready(function() {
	
	tableProducts.addEventListener('click', function(evt){
		var productId = parseInt(evt.path[0].id.match(/\d+/));
		var json = { "productId" : productId };	
		if (confirm('Вы желаете удалить данный товар из вашей базы?')) {
			$.ajax({
				type : "DELETE",
				contentType : "application/json",
				url : "/productslist/deleteProduct",
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
//		window.location.reload();
//		document.location.reload(true);
    });
	
	$("#tableProducts").searcher({
	    inputSelector: "#findProduct"
	});
	

/*	//var a = ${product.productId};
	$('openProductPhoto' +  ${product.productId}).click(function(){
		console.log('Modal view opened');
		$('#myModalNorm').modal('show');
	});
*/


});
	

</script>