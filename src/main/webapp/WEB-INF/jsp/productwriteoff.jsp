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
			<form>
				<div class="col-md-12 form-group">
					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="products">Наименование</label>
							<form:select class="form-control" id="products" path="products">
								<form:option value="NONE" label="--- Select ---" />
								<form:options items="${products}" itemValue="productId"
											  itemLabel="productName" />
							</form:select>
						</div>

						<div class="col-md-4 mb-3">
							<label for="articul">Артикул</label>
							<input type="text" class="form-control" id="articul" name="articul" />
							<input type="hidden" class="form-control" id="validityDate" name="validityDate" />
						</div>

						<div class="col-md-4 mb-3">
							<label for="productPrice">Цена товара</label>
							<input type="text" class="form-control" id="productPrice" name="productPrice" />
						</div>
					</div>

					<br><br>
					<div class="row">
						<div class="form-group">
							<div class="col-md-4 mb-3">
								<label for="productQuantity">Количество товара </label>
								<input type="text" class="form-control" id="productQuantity" name="productQuantity" />
							</div>
							<div class="col-md-8 mb-3">
								<label for="details">Причина</label>
								<input type="text" class="form-control" id="details" name="details" />
							</div>
						</div>
					</div>

				</div>
				<div class="col-md-12 form-group">
					<br>
					<div class="row">
						<div class="text-right">
							<button class="btn btn-primary" type="submit" id="addtocheck">Добавить</button>
						</div>
					</div>
					<br><br>
					<div class="row">

								<div>
									<%--							<form:form method="POST" id="writeoffForm">--%>
									<table class="table table-striped table-bordered table-hover table-responsive" id="saleTable">
										<thead>
										<tr>
											<th scope="col">Наименование</th>
											<th scope="col">Артикул</th>
											<th scope="col">Срок годности</th>
											<th scope="col">Дата списания</th>
											<th scope="col">Цена товара</th>
											<th scope="col">Количество</th>
											<th scope="col">Сумма</th>
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
										<button class="btn btn-primary" type="submit" id="addWriteOffs">Списать</button>
									</div>

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
		$("#products").change(function() {
			var products = $(this).find(":selected").val();
			var json = {
				"productId" : products
			};
			$.ajax({
				type : "POST",
				contentType : "application/json",
				url : "/productWriteOff/loadProductInfoByProduct",
				data : JSON.stringify(json),
				dataType : 'json',
				cache : false,
				timeout : 600000,
				success : function(data) {
					console.log(data);
					 $('#articul').val(data.articul);
					 $('#productPrice').val(data.procurementsByProductId[0].procurementPrice * 3);
					 $('#validityDate').val(data.procurementsByProductId[0].validityDate);
				},
				 error : function(e) {
					 $('#articul').val("");
					 $('#productPrice').val("");
					 $('#validityDate').val("");
				 }
			});
		});
		let tableNumOfRows = 0;
		let tableTotalSum = 0;
		var writeOffArr = [];
		
		$("#addtocheck").click(function() {
			var productName = $("#products").find('option:selected').text();
			var productId = $("#products").find('option:selected').val();
			var articul = $('#articul').val();
			var salePrice = 0;
			var productQuantity =$('#productQuantity').val();
			var details = $('#details').val();
			var productPrice = $('#productPrice').val();
			var saleDate = new Date();
			var validityDate = $('#validityDate').val();
			var json = {
				"productId" : productId,
				"articul" : articul,
				"salePrice" : salePrice,
				"saleDate": saleDate,
				"quantity": productQuantity,
				"details" : details,
				"productPrice" : productPrice
			};
			writeOffArr.push(json);
			var total = 0;
			var rowId = '$<tr id="' + ++tableNumOfRows + '">';
			var rowl = rowId 
					+'<td>' + productName + '</td>'
					+'<td>' + articul + '</td>'
					+'<td>' + validityDate + '</td>'
					+'<td>' + saleDate + '</td>'
					+'<td>' + productPrice + '</td>'
					+'<td><input type="text" value="' + productQuantity + '"></td>'						
					+'<td >' + total + '</td>'
					+'</tr>';
			tableTotalSum = tableTotalSum + total;
			$('#saleTable > tbody').append(rowl);
			$('#saleTable > tfoot > tr > td').text(tableTotalSum);
			$('#products').prop('selectedIndex',0);
			$('#articul').val("");
			$('#validityDate').val("");
			$('#saleDate').val("");
			$('#productPrice').val("");
			$('#productQuantity').val("");
		});

		$("#addWriteOffs").click(function() {
			var saleEntitylist = JSON.stringify(writeOffArr);
			$.ajax({
				type : "POST",
				contentType : "application/json",
				url : "/productWriteOff/addWriteOffs",
				data : saleEntitylist,
				dataType : 'json',
				cache : false,
				timeout : 600000,
				success : function(data) {
					alert(data);
				},
				error : function(data) {	
					alert(data.responseText);
					
//					alert(e);
//					alert("error occured while trying update the database");
				}
			});
		});

	});

</script>