<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Добавление товара</title>
</head>
<body>
	<form:form method="POST">
		<div class="form-group">
			<div class="col-md-3 mb-3">
				<label class="custom-file-label" for="customFileLang">Наименовани
					товара</label>
				<form:select path="products">
					<form:option value="NONE" label="--- Select ---" />
					<form:options items="${products}" itemValue="productId"
						itemLabel="productName" />
				</form:select>
			</div>
		</div>
	</form:form>
	


</body>