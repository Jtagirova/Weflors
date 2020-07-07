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

	
				<div class="col-md-12 form-group">
					<div class="row">
						<div class="text-left col-md-4 mb-4">
							<h3>Списанные товары</h3>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-12">
						<table class="table table-striped table-bordered table-hover table-responsive" id="tableProducts">
							<thead>
								<tr>
									<th scope="col" class="text-center">Наименование</th>
									<th scope="col" class="text-center">Артикул</th>
									<th scope="col" class="text-center">Срок годности</th>
									<th scope="col" class="text-center">Дата продажи</th>
									<th scope="col" class="text-center">Стоимость товара</th>
									<th scope="col" class="text-center">Стоимость продажи</th>
									<th scope="col" class="text-center">Количество</th>
									<th scope="col" class="text-center">Причина</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${writeOffProductList}" var="product">
								<tr>
									<td>${product[0]}</td>
									<td>${product[1]}</td>
									<td>${product[2]}</td>
									<td>${product[3]}</td>
									<td>${product[4]}</td>
									<td>${product[5]}</td>
									<td>${product[6]}</td>
									<td>${product[7]}</td>
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

</body>

<script>

$(document).ready(function() {
	

});

</script>