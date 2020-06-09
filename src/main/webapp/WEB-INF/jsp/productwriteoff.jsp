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
	<title>Списание товара</title>
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
							<label for="products">Наименование*</label>
							<form:select class="form-control" id="products" path="products">
								<form:option value="NONE" label="Наименование" />
								<form:options items="${products}" itemValue="productId"
											  itemLabel="productName" />
							</form:select>
						</div>

						<div class="col-md-4 mb-4">
							<label for="products">Срок годности</label>
							<select id="productValidityDate" class="form-control" >
								<option value="NONE" label="Срок годности" />
								<%--                                    <options items="${productValidityDate}"  />--%>
							</select>
						</div>

						<div class="col-md-4 mb-4">
							<label for="articul">Артикул</label>
							<input type="text" class="form-control" id="articul" name="articul" />
<%--							<input type="hidden" class="form-control" id="validityDate" name="validityDate" />--%>
						</div>


					</div>
					<br>
					<div class="row">
						<div class="col-md-4 mb-4">
							<label for="productPrice">Цена товара</label>
							<input type="number" class="form-control" id="productPrice" name="productPrice" />
						</div>
					</div>

					<br>
					<div class="row">
						<div class="form-group">
							<div class="col-md-4 mb-3">
								<label for="productQuantity">Количество товара*</label>
								<input type="number" class="form-control" id="productQuantity" name="productQuantity" />
							</div>
							<div class="col-md-8 mb-3">
								<label for="details">Причина*</label>
								<input type="text" class="form-control" id="details" name="details" />
							</div>
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
							<button class="btn btn-primary" type="submit" id="addtocheck" disabled>Добавить</button>
						</div>
					</div>
				</div>
			</div>


			<div class="col-md-12 form-group">
				<br><br>
				<div class="row">
					<div class="text-left col-md-4 mb-4">
						<h3>Списанный товар</h3>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-12">
									<%--							<form:form method="POST" id="writeoffForm">--%>
									<table class="table table-striped table-bordered table-hover table-responsive" id="saleTable">
										<thead>
										<tr>
											<th scope="col" class="text-center">Наименование</th>
											<th scope="col" class="text-center">Артикул</th>
											<th scope="col" class="text-center">Срок годности</th>
											<th scope="col" class="text-center">Дата списания</th>
											<th scope="col" class="text-center">Цена товара</th>
											<th scope="col" class="text-center">Количество</th>
											<th scope="col" class="text-center">Итого</th>
											<th scope="col" class="text-center">Удалить из чека</th>
										</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
									<div class="text-right">
										<button class="btn btn-primary" type="submit" id="addWriteOffs" >Списать</button>
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
	
		$("#products").change(function() {
			var products = $(this).find(":selected").val();
			var json = { "productId" : products };
			$.ajax({
				type : "POST",
				contentType : "application/json",
				url : "/productwriteoff/loadproductinfobyproductid",
				data : JSON.stringify(json),
				dataType : 'json',
				cache : false,
				timeout : 600000,
				success : function(data) {
					console.log(data);
					 $('#articul').val(data.articul);
					$('#productPrice').val(data.productPrice);
					 // $('#productPrice').val(data.procurementsByProductId[0].procurementPrice * 3);
					 // $('#validityDate').val(data.procurementsByProductId[0].validityDate);
					let validityDateOptions = document.getElementById('productValidityDate').options;
					$('#productValidityDate').find('option:not(:first)').remove();
					let productStatusArray = data.productStatusByProductId;

					for (let i=0; i<productStatusArray.length; i++) {
						let value = productStatusArray[i].validityDate;
						validityDateOptions.add(
								new Option(value, value)
						);
					}
				},
				 error : function(e) {
					 $('#articul').val("");
					 $('#productPrice').val("");
					 $('#productValidityDate').find('option:not(:first)').remove();
					 // $('#validityDate').val("");
				 }
			});
		});
		let tableNumOfRows = 0;
		var writeOffArr = [];
		
		$("#addtocheck").click(function() {
			var productName = $("#products").find('option:selected').text();
			var productId = $("#products").find('option:selected').val();
			var articul = $('#articul').val();
			var salePrice = 0;
			var productQuantity = $('#productQuantity').val();
			var productPrice = $('#productPrice').val();
			var details = $('#details').val();
			var saleDate = new Date();
			var validityDate = $('#productValidityDate').find('option:selected').text();
			var productStatusArr = [];
			var productStatus = {
				"productId" : productId,
				"articul" : articul,
				"totalQuantityWriteoff" : productQuantity,
				"validityDate" : validityDate
			}
			productStatusArr.push(productStatus);

			var product = {
				"productId" : productId,
				"productName" : productName,
				"articul" : articul,
				"productPrice" : productPrice,
				"productStatusByProductId" : productStatusArr,
			};
			var json = {
				"productId" : productId,
				"articul" : articul,
				"salePrice" : salePrice,
				"saleDate": saleDate,
				"quantity": productQuantity,
				"details" : details,
				"productPrice" : productPrice,
				"productByProductId" : product
			};
			writeOffArr.push(json);
			
			let total = Number(productPrice*productQuantity).toFixed(2);
			var rowId = '$<tr id="' + ++tableNumOfRows + '">';
			var rowl = rowId 
					+'<td>' + productName + '</td>'
					+'<td>' + articul + '</td>'
					+'<td>' + validityDate + '</td>'
					+'<td>' + saleDate + '</td>'
					+'<td>' + productPrice + '</td>'
					+'<td><input type="text" class="productQuantityChange" value="' + productQuantity + '"></td>'
					+'<td class="summPrices">' + total + '</td>'
					+'<td class="text-center"><button class="deleteRow btn btn-primary" id="'+ ++tableNumOfRows + ' type="submit"">Удалить</button></td>'
					+'</tr>';
			$('#saleTable > tbody').append(rowl);
			$('#products').prop('selectedIndex',0);
			$('#articul').val("");
			$('#productValidityDate').find('option:not(:first)').remove();
			$('#saleDate').val("");
			$('#productPrice').val("");
			$('#productQuantity').val("")	
			$(".productQuantityChange").change(function(tr) {
				var row = document.getElementById(tr.originalEvent.path[2].id); 
				var saleDate = row.childNodes[3].innerText;
				var object = writeOffArr.find(obj => obj.saleDate == saleDate);
				object.quantity = row.querySelector('input').value;
			});	
			
			$("#addtocheck").attr("disabled", "disabled");
		});
		
		$("#addWriteOffs").click(function() {				
			var saleEntitylist = JSON.stringify(writeOffArr);
			if (confirm('Вы действительно желаете списать данный товар?')) {
				$.ajax({
					type : "POST",
					contentType : "application/json",
					url : "/productwriteoff/addwriteoffs",
					data : saleEntitylist,
					dataType : 'json',
					cache : false,
					timeout : 600000,
					success : function(data) {
						location.reload(true);
						writeOffArr = [];
						tableNumOfRows = 0;
						$('#saleTable > tbody').empty();
						alert(data.responseText);
					},
					error : function(data) {	
						alert(data.responseText);
					}
				});
			};
			location.reload(true);
	        $("#addNewProductType").attr("disabled", "disabled");
		});
		
		$('input').change(function(){
			var productName = $("#products").find('option:selected').text();
			var productQuantity = Number($('#productQuantity').val());
			var details = $('#details').val();
			if ( productName !='' && productQuantity !='' && details !='' ){
				$("#addtocheck").removeAttr("disabled");
			} else {
				$("#addtocheck").attr("disabled", "disabled");
			}
		});
		

});

</script>