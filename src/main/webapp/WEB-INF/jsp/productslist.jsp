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
									<th scope="col" class="text-center">Просмотр / Удаление</th>
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
									<td class="text-center"><button id="openProductInfo${product.productId}" data-toggle="modal" data-target="#myModalNorm" class="btn btn-primary">Посмотреть</button>
										 / <button id="${product.productId}" class="Delete btn btn-primary">Удалить</button></td>
									<script>
										var productID = "${product.productId}";
										var ruFormat =
												new Intl.DateTimeFormat("ru-RU", {
													year: "numeric",
													month: "long",
													day: "numeric"
												});

										var pruductInfoButtonSelector = "openProductInfo" + productID.toString();
										$( "#" + pruductInfoButtonSelector + "" ).on( "click", function() {
											var productID = "${product.productId}";
											var pictureUrl = "${product.pictureUrl}";
											var invoiceNumber = "${product.invoiceNumber}";
											var articul = "${product.articul}";
											var productName = "${product.productName}";
											var productType = "${product.productTypesByProductTypeId.productTypeName}";
											var productHeight ="${product.productDetailsByProductId.height}";
											var productLength ="${product.productDetailsByProductId.length}";
											var productWidth ="${product.productDetailsByProductId.width}";
											var productColor ="${product.productDetailsByProductId.color}";
											var productDescription ="${product.productDetailsByProductId.productDescription}";
											var originOfProduct = "${product.originOfProduct}";
											var contragentName = "${product.contragentsByContragentId.contragentName}";

											$("#productimage").attr("src",pictureUrl);
											$('#invoicenumber').val(invoiceNumber);
											$('#productarticul').val(articul);
											$('#productname').val(productName);
											$('#producttype').val(productType);
											$('#productheight').val(productHeight);
											$('#productlength').val(productLength);
											$('#productwidth').val(productWidth);
											$('#productcolor').val(productColor);
											$('#productdescription').val(productDescription);
											$('#originofproduct').val(originOfProduct);
											$('#contragentname').val(contragentName);



											let procurementsObjectList = [
												<c:forEach items="${product.procurementsByProductId}" var="procurement">

												{
													procurementPrice: parseFloat("${procurement.procurementPrice}"),
													procurementDate: ruFormat.format(Date.parse("${procurement.procurementDate}")),
													quantity: parseInt("${procurement.quantity}"),
													validityDate: ruFormat.format(Date.parse("${procurement.validityDate}"))

												},

												</c:forEach>
											];

											$('#productProcurementsTable > tbody').empty();
											$.each( procurementsObjectList, function( key, value ) {

												var row = '<tr>' +
														'<td>' + value.procurementDate + '</td>'
														+'<td>' + value.procurementPrice + '</td>'
														+'<td>' + value.quantity + '</td>'
														+'<td>' + value.validityDate + '</td>'
														+'</tr>';
												$('#productProcurementsTable > tbody').append(row);

											});


											let productStatusObjectList = [
												<c:forEach items="${product.productStatusByProductId}" var="status">

												{
													quantityWarehouse: parseInt("${status.quantityWarehouse}"),
													quantityShopSale: parseInt("${status.quantityShopSale}"),
													totalQuantityWriteoff: parseInt("${status.totalQuantityWriteoff}"),
													validityDate: ruFormat.format(Date.parse("${status.validityDate}"))

												},

												</c:forEach>
											];

											$('#productStatusTable > tbody').empty();
											$.each( productStatusObjectList, function( key, value ) {

												var row = '<tr>' +
														'<td>' + value.quantityWarehouse + '</td>'
														+'<td>' + value.quantityShopSale + '</td>'
														+'<td>' + value.totalQuantityWriteoff + '</td>'
														+'<td>' + value.validityDate + '</td>'
														+'</tr>';
												$('#productStatusTable > tbody').append(row);

											});

										});
									</script>
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
								Карточка товара
							</h4>
						</div>

						<!-- Modal Body -->
						<div class="modal-body">

							<form role="form">

								<div class="form-group">

									<div class="row">
										<div class="col-md-12 mb-4">
											<label for="productimage">Фото товара</label>
											<span><img id="productimage" style="max-width:100%;" src="" alt="..."></span>
										</div>

									</div>
									<br>
									<div class="row">
										<div class="col-md-6 mb-4">
											<label for="invoicenumber">Номер накладной</label>
											<input type="text" class="form-control" id="invoicenumber" readonly placeholder="Информация отсутствует"
												   maxlength ="30" required>
										</div>
										<div class="col-md-6 mb-4">
											<label for="productheight">Высота</label>
											<input type="text" class="form-control" id="productheight" readonly  placeholder="Информация отсутствует">
										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-md-6 mb-4">
											<label for="productarticul">Артикул*</label>
											<input type="text" class="form-control" id="productarticul" readonly
												   placeholder="Информация отсутствует" maxlength ="50" required>
										</div>
										<div class="col-md-6 mb-4">
											<label for="productlength">Длина</label>
											<input type="number" class="form-control" id="productlength" readonly  placeholder="Информация отсутствует">
										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-md-6 mb-4">
											<label for="productname">Наименование товара*</label>
											<input type="text" class="form-control" id="productname" readonly  placeholder="Информация отсутствует"
												   maxlength ="50" required>
										</div>
										<div class="col-md-6 mb-4">
											<label for="productwidth">Ширина</label>
											<input type="number" class="form-control" id="productwidth" readonly placeholder="Информация отсутствует">
										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-md-6 mb-4">
											<label for="productType">Категория товара*</label>
									       <input type="text" class="form-control" id="producttype" readonly placeholder="Информация отсутствует" required>
										</div>
										<div class="col-md-6 mb-4">
											<label for="productcolor">Цвет</label>
											<input type="text" class="form-control" id="productcolor" readonly placeholder="Информация отсутствует"
												   maxlength ="50">
										</div>
									</div>
									<br>
									<div class="row">
									<div class="col-md-12 mb-3">
										<label for="productdescription">Описание товара</label>
										<textarea class="form-control rounded-0" id="productdescription"
												  readonly placeholder="Информация отсутствует" rows="3" maxlength ="300"></textarea>
									</div>
									</div>
									<br>
									<div class="row">
										<div class="col-md-6 mb-4">
											<label for="originofproduct">Страна поставки*</label>
											<input type="text" class="form-control" id="originofproduct"
												   readonly placeholder="Информация отсутствует">
										</div>
										<div class="col-md-6 mb-4">
											<label class="custom-file-label" for="contragentname">Поставщик*</label>
											<input type="text" class="form-control" id="contragentname"
												   readonly placeholder="Информация отсутствует">
										</div>

									</div>

									<br>
									<div class="row">
									<div class="text-left col-md-4 mb-4">
										<h3>Закупки:</h3>
									</div>
									</div>

									<br>
									<div class="row">
										<div class="col-md-12">
											<table class="table table-striped table-bordered table-hover table-responsive" id="productProcurementsTable">
												<thead>
												<tr>
													<th scope="col" class="text-center">Дата покупки</th>
													<th scope="col" class="text-center">Цена покупки</th>
													<th scope="col" class="text-center">Количество</th>
													<th scope="col" class="text-center">Срок годности</th>
												</tr>
												</thead>
												<tbody>
												</tbody>
											</table>
										</div>
									</div>

									<br>
									<div class="row">
										<div class="text-left col-md-4 mb-4">
											<h3>Статус:</h3>
										</div>
									</div>

									<br>
									<div class="row">
										<div class="col-md-12">
											<table class="table table-striped table-bordered table-hover table-responsive" id="productStatusTable">
												<thead>
												<tr>
													<th scope="col" class="text-center">Количество на складе</th>
													<th scope="col" class="text-center">Количество проданного</th>
													<th scope="col" class="text-center">Количество списанного</th>
													<th scope="col" class="text-center">Срок годности</th>
												</tr>
												</thead>
												<tbody>
												</tbody>
											</table>
										</div>
									</div>



<%--									<div class="fileinput fileinput-new" data-provides="fileinput">
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
											&lt;%&ndash;<a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Удалить</a>&ndash;%&gt;

										</div>
									</div>--%>

								</div>

							</form>


						</div>

						<!-- Modal Footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
									data-dismiss="modal">
								Закрыть
							</button>
<%--							<button type="button" class="btn btn-primary">
								Сохранить изменения
							</button>--%>
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
	
	tableProducts.querySelectorAll('.Delete').forEach(function (item){
		item.addEventListener('click', function(evt){
			var productId = parseInt(event.path[0].id.match(/\d+/));
			var row = this.closest('tr');
			var json = { "productId" : productId };	
			if (confirm('Вы желаете удалить данный товар из вашей базы?')) {
				$.ajax({
					type : "DELETE",
					contentType : "application/json",
					url : "/productslist/delete",
					data : JSON.stringify(json),
					dataType : 'text',
					cache : false,
					timeout : 600000,
					success : function(data) {	
						alert(data);
						location.reload(true)
					},
					error : function(data) {	
						alert(data);
					}
				});	
				row.parentElement.removeChild(row);	
			}
	    });	
	});
	
	$("#tableProducts").searcher({
	    inputSelector: "#findProduct"
	});

});
</script>