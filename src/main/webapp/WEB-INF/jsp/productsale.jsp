<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <title>Продажа товара</title>
    <jsp:include page="/WEB-INF/jsp/base_layout/head_links.jsp"></jsp:include>
</head>
<body>

<div class="container-fluid ">
    <div class="row">
        <jsp:include page="/WEB-INF/jsp/base_layout/leftnav.jsp"></jsp:include>
        <div class="col-md-8">
            <jsp:include page="/WEB-INF/jsp/base_layout/topnav.jsp"></jsp:include>

            <!-- Form Content Here -->
<%--            <form>--%>
                <div class="col-md-8 form-group">
                    <div class="row">
                            <div class="col-md-4 mb-4">
                                <label for="products">Наименование*</label>
                                <form:select id="products" class="form-control" path="products">
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
                            </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-4 mb-4">
                            <label for="productPrice">Цена*</label>
                            <input type="number" class="form-control" id="productPrice" name="productPrice" 
                            oninput="this.value=this.value.replace(/[^0-9]/g,'');" />
                        </div>
                        <div class="col-md-4 mb-4">
                            <label for="allClientsEmail">Клиент</label>
                            <form:select id="allClientsEmail" class="form-control" path="allClientsEmail">
                                <form:option value="NONE" label="Клиент" />
                                <form:options items="${allClientsEmail}" itemValue="clientId"
                                              itemLabel="eMail"/>
                            </form:select>
                        </div>
                        <div class="col-md-4 mb-4">
                            <label for="discount">Скидка %</label>
                            <input type="number" class="form-control" id="discount" name="discount" maxlength="3" 
                           oninput="this.value=this.value.replace(/[^0-9]/g,'');" />  
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-4 mb-4">
                            <label for="productQuantity">Количество товара*</label>
                            <input type="number" class="form-control" id="productQuantity" name="productQuantity" 
                            oninput="this.value=this.value.replace(/[^0-9]/g,'');" />
                        </div>
                        <div class="col-md-4 mb-4">
                            <label for="productPriceAfterDiscount">Стоимость товара</label>
                            <input type="number" class="form-control" id="productPriceAfterDiscount" name="productPriceAfterDiscount" />
                        </div>
                    </div>
                </div>
                <div class="col-md-4 form-group">
                    <div class="row">
                        <div class="col-md-12 mb-4">
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
                            <button class="btn btn-primary" type="submit" id="addtocheck" disabled>Добавить в чек</button>
                        </div>
                    </div>
                </div>
            </div>
                <div class="col-md-12 form-group">
                    <br><br>
                    <div class="row">
                        <div class="text-left col-md-4 mb-4">
                            <h3>Формирование чека</h3>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-12">
                        <table class="table table-striped table-bordered table-hover table-responsive" id="saleTable">
                            <thead>
                            <tr>
                                <th scope="col" class="text-center">Наименование товара</th>
                                <th scope="col" class="text-center">Артикул</th>
                                <th scope="col" class="text-center">Количество товара</th>
                                <th scope="col" class="text-center">Цена за еденицу</th>
                                <th scope="col" class="text-center">Скидка %</th>
                                <th scope="col" class="text-center">Стоимость товара за единицу</th>
                                <th scope="col" class="text-center">Итого</th>
                                <th scope="col" class="text-center">Удаление</th>
                                <th scope="col" hidden>Email</th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th class="text-center">Всего: </th>
                                <td><input type="number"  id="totalSum" name="totalSum" readonly/></td>
                            </tr>
                            </tfoot>
                            <tbody>
                            </tbody>
                        </table>
                        </div>
                    </div>
                </div>
            <div class="col-md-12 form-group">
                <div class="row">
                    <div class="col-md-4 col-md-offset-8">
                        <div class="text-right">
                            <button class="btn btn-primary" type="submit" id="addSaleProducts">Продать</button>
                        </div>
                    </div>
                </div>
            </div>
<%--            </form>--%>



			<div class="col-md-12 form-group">
				<br><br>
				<div class="row">
					<div class="text-left col-md-4 mb-4">
						<h3>Продажи за день: ${currentDate}</h3>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-12">
						<table class="table table-striped table-bordered table-hover table-responsive" id="lastSales">
							<thead>
								<tr>
									<th scope="col" class="text-center">Наименование товара</th>
	                                <th scope="col" class="text-center">Артикул</th>
	                                <th scope="col" class="text-center">Количество товара</th>
	                                <th scope="col" class="text-center">Цена за единицу</th>
	                                <th scope="col" class="text-center">Скидка %</th>
	                                <th scope="col" class="text-center">Стоимость товара за единицу</th>
	                                <th scope="col" class="text-center">Итого</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${salesForThisDay}" var="sale">
									<tr>
										<td>${sale.productByProductId.productName}</td>
										<td>${sale.articul}</td>
										<td>${sale.quantity}</td>
										<td>${sale.productPrice}</td>
										<td>${sale.clientByClientId.discount}</td>
										<td>${sale.salePrice}</td>
										<td><input type="text" id="saleTotal"  value="${sale.productPrice}*${sale.quantity}"  name="saleTotal" readonly/>  </td>											
<!--  									${sale.productPrice}*${sale.quantity}-${sale.productPrice}*${sale.clientByClientId.discount}/100   -->
									</tr>								
								</c:forEach>
							</tbody>
						</table>
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
			var json = { "productId" : products	};
			$.ajax({
				type : "POST",
				contentType : "application/json",
				url : "/loadroductinfobyproductid",
				data : JSON.stringify(json),
				dataType : 'json',
				cache : false,
				timeout : 600000,
				success : function(data) {
				    $('#articul').val(data.articul);
                    $('#productPrice').val(data.productPrice);
//                    $('#productValidityDate').val(data.productStatusByProductId);
                    let validityDateOptions = document.getElementById('productValidityDate').options;
                    $('#productValidityDate').find('option:not(:first)').remove();
                    let productStatusArray = data.productStatusByProductId;
                    for (let i=0; i<productStatusArray.length; i++) {
                        let value = productStatusArray[i].validityDate;
                        validityDateOptions.add(new Option(value, value));
                    }
				},
				 error : function(e) {
					 $('#articul').val("");
					 $('#productPrice').val("");
                     $('#productValidityDate').find('option:not(:first)').remove();
				 }
			});
		});

		$("#allClientsEmail").change(function() {
			var eMail = $(this).find(":selected").text();
			// var json = {"eMail" : eMail };
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
/*					if(data.discount != '' && data.discount != 0) {
						$("#productPriceAfterDiscount").val($('#productPrice').val() - ($('#productPrice').val() * ($('#discount').val() / 100)));
					}else{
						$("#productPriceAfterDiscount").val($('#productPrice').val());
					}
*/
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
            var productStatusArr = [];
			var productName = $("#products").find('option:selected').text();
			var productId = $("#products").find('option:selected').val();
			var articul = $('#articul').val();
			let productPriceAfterDiscount = Number($('#productPriceAfterDiscount').val()).toFixed(2);
			let productQuantity = Number($('#productQuantity').val());
			let productPrice = Number($('#productPrice').val());
			let discount = Number($('#discount').val());
            var productValidityDate = $('#productValidityDate').find('option:selected').text();
			var saleDate = Date.now();
			var clientEmail =  $("#allClientsEmail").find('option:selected').text();
			var clientId =  $("#allClientsEmail").find('option:selected').val();
			var clientByClientId = {
				"clientId": clientId,
				"eMail": clientEmail
			}
			var productSaleDetails = '';
            var productStatus = {
                "productId" : productId,
                "articul" : articul,
                "quantityShopSale" : productQuantity,
                "validityDate" : productValidityDate
            }
            productStatusArr.push(productStatus);
            var product = {
                "productId" : productId,
                "productName" : productName,
                "articul" : articul,
                "productPrice" : productPrice,
                "productStatusByProductId" : productStatusArr,
                //"salesByProductId" : saleArr
            };
            var sale = {
                "productId" : productId,
                "articul" : articul,
                "salePrice" : productPriceAfterDiscount,
                "saleDate": saleDate,
                "quantity": productQuantity,
                "details" : productSaleDetails,
                "productPrice" : productPrice,
                "productByProductId" : product,
                "clientByClientId": clientByClientId
            };
            saleArr.push(sale);   
			let priceForOneAfterDiscont = Number(productPriceAfterDiscount/productQuantity).toFixed(2);
			var rowId = '$<tr id="' + ++tableNumOfRows + '">';
			var rowl = rowId + '<td>' + productName + '</td>'
					+'<td>' + articul + '</td>'
					+'<td><input type="number" class="productQuantityChange" value="' + productQuantity + '"/></td>'
					+'<td>' + productPrice + '</td>'
					+'<td>' + discount + '</td>'
					+'<td>' + priceForOneAfterDiscont + '</td>'
					+'<td><input type="number" class="summPrices" value="' + productPriceAfterDiscount + '" readonly></td>'
					+'<td class="text-center"> <button class="deleteRow btn btn-primary" id="' + tableNumOfRows + ' type="submit"">Удалить</button></td>'
					+'</tr>';	
			tableTotalSum = tableTotalSum + Number(productPriceAfterDiscount);
			saleTable.addEventListener('click', function(evt){
	          	if(evt.target.closest('.deleteRow')) {
	          		evt.target.closest('tr').remove();
	          		var elems = document.querySelectorAll(".summPrices");
	          		tableTotalSum = 0;
	          		for (var i = 0; i < elems.length; ++i){
	          			tableTotalSum = tableTotalSum + Number(elems[i].value);
	          		};
	          		$('#totalSum').val(tableTotalSum);
	          	};           	
	        }); 
			var elems = document.querySelectorAll(".summPrices");
      		tableTotalSum = 0;
      		for (var i = 0; i < elems.length; ++i){
      			tableTotalSum = tableTotalSum + Number(elems[i].value);
      		};
      		$('#totalSum').val(tableTotalSum);
			$('#totalSum').val(tableTotalSum);
			$('#saleTable > tbody').append(rowl);
			$('#products').prop('selectedIndex',0);
			$('#articul').val("");
			$('#productPrice').val("");
			$("#allClientsEmail").prop('selectedIndex',0);
			$('#discount').val("");
			$('#productQuantity').val("");
			$("#productPriceAfterDiscount").val("");
            $('#productValidityDate').find('option:not(:first)').remove();
            $("#addtocheck").attr("disabled", "disabled");
		});

		addtocheck.addEventListener('click', function(){
			var elems = document.querySelectorAll(".summPrices");
      		tableTotalSum = 0;
      		for (var i = 0; i < elems.length; ++i){
      			tableTotalSum = tableTotalSum + Number(elems[i].value);
      		};
      		$('#totalSum').val(tableTotalSum);
        });

		$( "#addSaleProducts" ).click(function() {
			var prod = JSON.stringify(saleArr);
			if (confirm('Вы желаете продать выбранные товары?')) {
				$.ajax({
					type : "POST",
					contentType : "application/json",
					url : "/addSaleProduct",
					data : prod,
					dataType : 'json',
					cache : false,
					timeout : 600000,
					success : function(data) {
						alert(data);
						location.reload(true)
					},
					error : function(data) {
						alert(data);
//						alert("error occured while trying update the database");
					}
				});
			}
			
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

	$('input').change(function(){
		var productQuantity  = $('#productQuantity').val();
		var productPrice = $("#productPrice").val();
		var discount = $("#discount").val();
		var products = $("#products").text();
		$("#productPriceAfterDiscount").val((productPrice*productQuantity)-(productPrice*discount/100));
		if ( productQuantity !='' && productPrice !='' && products !='' && productQuantity !=0 && productPrice !=0 && products !=0){
			$("#addtocheck").removeAttr("disabled");
		} else {
			$("#addtocheck").attr("disabled", "disabled");
		}	
		saleTable.addEventListener('click', function(evt){
		    if(evt.target.closest('.productQuantityChange')) {
		    	$(".productQuantityChange").on("blur", function(){ 
		    		var a = evt.target.closest('tr');
			        a.cells[6].lastChild.value = a.cells[2].childNodes[0].value * a.cells[5].childNodes[0].data; 
			        var elems = document.querySelectorAll(".summPrices");
		      		tableTotalSum = 0;
		      		for (var i = 0; i < elems.length; ++i){
		      			tableTotalSum = tableTotalSum + Number(elems[i].value);
		      		};
		      		$('#totalSum').val(tableTotalSum);    
		    	}); 
		    };   		
		});
		if ($('#discount').val() < 0) $('#discount').val(0);
	    if ($('#discount').val() > 100) $('#discount').val(100);
	    if ($('.productQuantityChange').val() < 0) $('.productQuantityChange').val(0);
	});
	
	$('#products').change(function(){
		$('#productQuantity').val('');
		$('#discount').val('');
		$('#productPriceAfterDiscount').val('');
		$("#addtocheck").attr("disabled", "disabled");
	});
	
	$('#allClientsEmail').change(function(){
		$('#discount').val('0');
		$('#productQuantity').val('0');
	});	
	
});

</script>

</body>