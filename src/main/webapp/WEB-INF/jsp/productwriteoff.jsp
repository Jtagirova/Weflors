<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Списание товара</title>
	<!-- Bootstrap core CSS -->
	<link rel="stylesheet"
		  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
		  integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<script src="webjars/jquery/3.3.1/jquery.min.js" type="text/javascript"></script>
</head>



<body>
<div class="container-fluid ">
    <div class="row">
        <jsp:include page="/WEB-INF/jsp/base_layout/leftnav.jsp"></jsp:include>
        <div class="col-md-8">
            <jsp:include page="/WEB-INF/jsp/base_layout/topnav.jsp"></jsp:include>
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
						<input type="hidden" id="validityDate" name="validityDate" />
					</div>	
					
					<div class="col-md-2 mb-3">
						<label for="productPrice">Цена товара</label>
						<input type="text" id="productPrice" name="productPrice" />
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
						<label for="details">Причина</label>
						<input type="text" id="details" name="details" />
					</div>
					<div class="col-md-6 mb-3">
						<div class="text-right">
							<button class="btn-info btn" type="submit" id="addToListWriteOffs">Добавить в список</button>
						</div>
					</div>
				</div>
			</div>

			<br><br><br><br><br><br>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-6 mb-3">
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
									<button class="btn-info btn" type="submit" id="addWriteOffs">Списать</button>
								</div>
						</div>
					</div>
				</div>
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
				url : "/productwriteoff/loadProductInfoByProduct",
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
		
	
		$( "#addToListWriteOffs" ).click(function() {
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
					+'<td>' + productQuantity + '</td>'
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
				url : "/productwriteoff/addWriteOffs",
				data : saleEntitylist,
				dataType : 'json',
				cache : false,
				timeout : 600000,
				success : function(data) {
					tableTotalSum = 0;
					tableNumOfRows = 0;
					$('#saleTable > tbody').empty();
					$('#saleTable > tfoot > tr > td').text(tableTotalSum);
				},
				error : function(e) {
					alert("error occured while trying update the database");
				}
			});
		});

	});

</script>

</body>