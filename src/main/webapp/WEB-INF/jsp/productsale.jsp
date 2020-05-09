<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Добавление товара</title>
	<script src="webjars/jquery/3.3.1/jquery.min.js" type="text/javascript"></script>
</head>
<body>

		<div class="form-group">
			<div class="col-md-3 mb-3">
				<form:select id="products" path="products">
					<form:option value="NONE" label="--- Select ---" />
					<form:options items="${products}" itemValue="productId"
						itemLabel="productName" />
				</form:select>
				<input type="text" id="articul" name="articul" />
				<input type="text" id="cost" name="cost" />
				<form:select id="allClientsEmail" path="allClientsEmail">
					<form:option value="NONE" label="--- Select ---" />
					<form:options items="${allClientsEmail}" />
				</form:select>
				<input type="text" id="discount" name="discount" />
				<input type="text" id="productQuantity" name="productQuantity" />
				<input type="text" id="productCostAfterDiscount" name="productCostAfterDiscount" />
				<button type="submit" id="add">Добавить</button>
			</div>
		</div>

		<div>
			<form:form method="POST" modelAttribute="saleForm">
				<table id="saleTable">
					<tr style="background-color:#dedede;">
						<th >Наименование товара</th>
						<th >Артикул</th>
						<th >Количество товара</th>
						<th >Цена за еденицу</th>
						<th >Скидка %</th>
						<th >Стоимость товара</th>
						<th >Итого</th>
						<th hidden>Email</th>
					</tr>
				</table>
			</form:form>
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
					 $('#cost').val(data.procurementByProductId.procurementPrice * 3);
				},
				 error : function(e) {
					 $('#articul').val("");
					 $('#cost').val("");
				 }
			});
		});

		$("#allClientsEmail").change(function() {
			var eMail = $(this).find(":selected").val();
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
					$('#discount').val(data);
					if($('#discount').val(data) != '' && $('#discount').val(data) != 0) {
						$("#productCostAfterDiscount").val($('#cost').val() - ($('#cost').val() * ($('#discount').val() / 100)));
					}else{
						$("#productCostAfterDiscount").val($('#cost').val());
					}
				},
				error : function(e) {
					$('#discount').val("");
					$('#productCostAfterDiscount').val("");
				}
			});
		});


		$("add").on(function (){
			var products = $("#products").val();
			var cost = $('#cost').val();
			var productQuantity =$('#productQuantity').val();
			var discount = $('#discount').val();
			var productCostAfterDiscount = $('#productCostAfterDiscount').val();
			var total = productCostAfterDiscount * productQuantity;

		});
	});
	// const productElement = document.querySelector('#products');
	// productElement.addEventListener('change', (event) => {
	// 	document.querySelector('#articul').value = productElement.options[productElement.selectedIndex].value;
	// 	document.querySelector('#cost').value = productElement.value * 3;
	// });
	//
	// const clientElement = document.querySelector('#allClients');
	// clientElement.addEventListener('change', (event) => {
	// 	document.querySelector('#discount').value = clientElement.value;
	// });

</script>

</body>