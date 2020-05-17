<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Добавление товара</title>
	<!-- Bootstrap core CSS -->
	<link rel="stylesheet"
		  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
		  integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<script src="webjars/jquery/3.3.1/jquery.min.js" type="text/javascript"></script>
</head>
<body>

<div class="container-fluid">
	<br>
	<div class="col-sm-9 col-lg-10">
		<div class="container" style="">
			<div class="row">
				<div class="form-group">
					<div class="col-md-2 mb-3">
						<label for="products">Наименование</label>
						<form:select id="products" path="products">
							<form:option value="NONE" label="--- Select ---" />
							<form:options items="${products}" itemValue="productId"
									  itemLabel="productName" />
						</form:select>
					</div>

					<div class="col-md-2 mb-3">
						<label for="articul">Артикул</label>
						<input type="text" id="articul" name="articul" />
					</div>
					<div class="col-md-2 mb-3">
						<label for="productPrice">Цена</label>
						<input type="text" id="productPrice" name="productPrice" />
					</div>
					<div class="col-md-2 mb-3">
						<label for="allClientsEmail">Клиент</label>
						<form:select id="allClientsEmail" path="allClientsEmail">
							<form:option value="NONE" label="--- Select ---" />
							<form:options items="${allClientsEmail}" itemValue="clientId"
										  itemLabel="eMail"/>
						</form:select>
					</div>

					<div class="col-md-2 mb-3">
						<label for="discount">Скидка %</label>
						<input type="text" id="discount" name="discount" />
					</div>

			</div>
			</div>
			<br><br>
			<div class="row">
				<div class="form-group">
					<div class="col-md-2 mb-3">
						<label for="productQuantity">Количество товара </label>
						<input type="text" id="productQuantity" name="productQuantity" />
					</div>
					<div class="col-md-2 mb-3">
						<label for="productPriceAfterDiscount">Стоимость товара</label>
						<input type="text" id="productPriceAfterDiscount" name="productPriceAfterDiscount" />
					</div>

					<div class="col-md-6 mb-3">


						<div class="text-right">
							<button class="btn-info btn" type="submit" id="addtocheck">Добавить чек</button>
						</div>

					</div>
				</div>
			</div>


			<br><br><br><br><br><br>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-6 mb-3">
						<div>
<%--							<form:form method="POST" id="saleForm">--%>
								<table class="table table-striped table-bordered table-hover table-responsive" id="saleTable">
									<thead>
										<tr>
											<th scope="col">Наименование товара</th>
											<th scope="col">Артикул</th>
											<th scope="col">Количество товара</th>
											<th scope="col">Цена за еденицу</th>
											<th scope="col">Скидка %</th>
											<th scope="col">Стоимость товара за еденицу</th>
											<th scope="col">Итого</th>
											<th scope="col" hidden>Email</th>
										</tr>

									</thead>

									<tfoot>
										<tr>
											<th>Всего: </th>
											<td>0</td>
										</tr>
									</tfoot>
									<tbody>

									</tbody>

								</table>
								<div class="text-right">
									<button class="btn-info btn" type="submit" id="addSaleProducts">Добавить чек</button>
								</div>
<%--							</form:form>--%>
						</div>
					</div>
				</div>
			</div>




		</div>
	</div>
</div>







	
<script>

	$(document).ready(function() {
		$("#products").change(function() {
			var products = $(this).find(":selected").val();
			var json = {
				"productId" : products
			};

			$.ajax({
				type : "POST",
				contentType : "application/json",
				url : "/loadProductInfoByProductName",
				data : JSON.stringify(json),
				dataType : 'json',
				cache : false,
				timeout : 600000,
				success : function(data) {
					console.log(data);
					 $('#articul').val(data.articul);
					 $('#productPrice').val(data.procurementByProductId.procurementPrice * 3);
				},
				 error : function(e) {
					 $('#articul').val("");
					 $('#productPrice').val("");
				 }
			});
		});

		$("#allClientsEmail").change(function() {
			var eMail = $(this).find(":selected").text();
			// var json = {
			// 	"eMail" : eMail
			// };
			$.ajax({
				type : "POST",
				contentType : "application/json",
				url : "/loadClientDiscont",
				data : eMail.toString(),
				dataType : 'json',
				cache : false,
				timeout : 600000,
				success : function(data) {
					$('#discount').val(data.discount);
					if(data.discount != '' && data.discount != 0) {
						$("#productPriceAfterDiscount").val($('#productPrice').val() - ($('#productPrice').val() * ($('#discount').val() / 100)));
					}else{
						$("#productPriceAfterDiscount").val($('#productPrice').val());
					}
				},
				error : function(e) {
					$('#discount').val("");
					$("#productPriceAfterDiscount").val($('#productPrice').val());
				}
			});
		});

/*		$(document).on('click','.table-delete-row',function(){
			alert('called');
			var bt = $(this).closest('table').attr('id'); //table id
			var no=$(this).data("number");//to get row number when we remove it
			$('#'+bt).bootstrapTable('remove', {field: 'number', values: no});
		});
		+'<td><a href='#' id = productId class='table-delete-row'>Delete</a></td>'*/
		let tableNumOfRows = 0;
		let tableTotalSum = 0;
		var saleArr = [];
		$( "#addtocheck" ).click(function() {

			var productName = $("#products").find('option:selected').text();
			var productId = $("#products").find('option:selected').val();

			var articul = $('#articul').val();
			var productPriceAfterDiscount = $('#productPriceAfterDiscount').val();
			var productQuantity =$('#productQuantity').val();
			var productPrice = $('#productPrice').val();
			var discount = $('#discount').val();

			var saleDate = Date.now();
			var clientEmail =  $("#allClientsEmail").find('option:selected').text();
			var clientId =  $("#allClientsEmail").find('option:selected').val();
			var clientByClientId = {
				"clientId": clientId,
				"eMail": clientEmail
			}
			var productSaleDetails = '';

			var json = {
				"productId" : productId,
				"articul" : articul,
				"salePrice" : productPriceAfterDiscount,
				"saleDate": saleDate,
				"quantity": productQuantity,
				"details" : productSaleDetails,
				"clientByClientId": clientByClientId,
				"productPrice" : productPrice

			};

			saleArr.push(json);

			var total = productPriceAfterDiscount * productQuantity;
			var rowId = '$<tr id="' + ++tableNumOfRows + '">';
			var rowl = rowId + '<td>' + productName + '</td>'
					+'<td>' + articul + '</td>'
					+'<td>' + productQuantity + '</td>'
					+'<td>' + productPrice + '</td>'
					+'<td>' + discount + '</td>'
					+'<td>' + productPriceAfterDiscount + '</td>'
					+'<td >' + total + '</td>'
					+'</tr>';

			tableTotalSum = tableTotalSum + total;
			$('#saleTable > tbody').append(rowl);
			//var totalRowCount = $('#saleTable > tbody').rows.length;
			$('#saleTable > tfoot > tr > td').text(tableTotalSum);

/*			$("#saleTable").find('tbody')
					.append($('<tr>')
							.append($('<td>')
									.append($('<p>').text(products)
									)
							)
					);*/

		});

		$( "#addSaleProducts" ).click(function() {
			var ololo = JSON.stringify(saleArr);
			$.ajax({
				type : "POST",
				contentType : "application/json",
				url : "/addSaleProduct",
				data : ololo,
				dataType : 'json',
				cache : false,
				timeout : 600000,
				success : function(data) {
					// $('#discount').val(data);
					// if($('#discount').val(data) != '' && $('#discount').val(data) != 0) {
					// 	$("#productPriceAfterDiscount").val($('#productPrice').val() - ($('#productPrice').val() * ($('#discount').val() / 100)));
					// }else{
					// 	$("#productPriceAfterDiscount").val($('#productPrice').val());
					// }
				},
				error : function(e) {
					// $('#discount').val("");
					// $("#productPriceAfterDiscount").val($('#productPrice').val());
				}
			});
		});


	});
	// const productElement = document.querySelector('#products');
	// productElement.addEventListener('change', (event) => {
	// 	document.querySelector('#articul').value = productElement.options[productElement.selectedIndex].value;
	// 	document.querySelector('#productPrice').value = productElement.value * 3;
	// });
	//
	// const clientElement = document.querySelector('#allClients');
	// clientElement.addEventListener('change', (event) => {
	// 	document.querySelector('#discount').value = clientElement.value;
	// });

</script>

</body>