<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Add Product</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<div class="container" style="">
    <form class="form-horizontal">
        <br>

        <div class="form-group">
            <div class="col-md-4 mb-3">
                <label for="productarticul">Артикул</label>
                <input type="text" class="form-control" id="productarticul" placeholder="Артикул товара"  required>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-4 mb-3">
                <label for="validationServer01">Наименование товара</label>
                <input type="text" class="form-control" id="validationServer01" placeholder="Введите наименование товара" required>

            </div>
        </div>

        <div class="form-group">
            <div class="col-md-4 mb-3">
                <label for="validationServer02">Категория товара</label>
                <input type="text" class="form-control" id="validationServer02" placeholder="Выберите категорию товара" required>
            </div>

        </div>

        <div class="form-group">
            <div class="col-md-3 mb-3">
                <div class="custom-file">
                    <label class="custom-file-label" for="customFileLang">Загрузите фото товара</label>
                    <input type="file" class="custom-file-input" id="customFileLang" >
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-3 mb-3">
                <label class="custom-file-label" for="customFileLang">Поставщик</label>
                <form:select path="contragents">
                    <form:option value="NONE" label="--- Select ---" />
                    <form:options items="${contragents}" itemValue="contragentId" itemLabel="contragentName" />
                </form:select>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-4 mb-3">
                <label for="productdescription">Описание товара</label>
                <input type="text" class="form-control" id="productdescription" placeholder="Опишите кратко товар">
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-4 mb-3">
                <label for="productheight">Высота</label>
                <input type="text" class="form-control" id="productheight" placeholder="Высота">
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-4 mb-3">
                <label for="productlength">Длина</label>
                <input type="text" class="form-control" id="productlength" placeholder="Длина">
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-4 mb-3">
                <label for="productwidth">Ширина</label>
                <input type="text" class="form-control" id="productwidth" placeholder="Ширина">
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-4 mb-3">
                <label for="productcolor">Цвет</label>
                <input type="text" class="form-control" id="productcolor" placeholder="цвет">
            </div>
        </div>



<%--        <div class="checkbox">
            <label>
                <input type="checkbox"> Check me out
            </label>
        </div>--%>

<%--        <form:form modelAttribute="contragents" method="get">
            <form:select path="contragents">
                <form:option value="NONE" label="--- Select ---" />
                <form:options items="${contragents}" itemValue="contragentId" itemLabel="contragentName" />
            </form:select>
            <input type="submit" />
        </form:form>--%>

<%--        <tr>
            <td>Contragents :</td>
            <td>
                <form:select path="contragents">
                <form:option value="NONE" label="--- Select ---" />
                <form:options items="${contragents}" itemValue="contragentId" itemLabel="contragentName" />
            </form:select>
            </td>
        </tr>--%>
<%--
        <h2 class="hello-title">Hello ${name}!</h2>--%>
<%--
        <div class="form-row">
            <div class="col-md-6 mb-3">
                <label for="validationServer03">City</label>
                <input type="text" class="form-control is-invalid" id="validationServer03" placeholder="City" required>
                <div class="invalid-feedback">
                    Please provide a valid city.
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <label for="validationServer04">State</label>
                <input type="text" class="form-control is-invalid" id="validationServer04" placeholder="State" required>
                <div class="invalid-feedback">
                    Please provide a valid state.
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <label for="validationServer05">Zip</label>
                <input type="text" class="form-control is-invalid" id="validationServer05" placeholder="Zip" required>
                <div class="invalid-feedback">
                    Please provide a valid zip.
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-check">
                <input class="form-check-input is-invalid" type="checkbox" value="" id="invalidCheck3" required>
                <label class="form-check-label" for="invalidCheck3">
                    Agree to terms and conditions
                </label>
                <div class="invalid-feedback">
                    You must agree before submitting.
                </div>
            </div>
        </div>--%>
        <button class="btn btn-primary" type="submit">Сохранить</button>
    </form>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>

</body>
</html>