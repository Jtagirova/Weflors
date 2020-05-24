<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%--<dependency>
    <groupId>org.springframework.security</groupId>
    <artifactId>spring-security-taglibs</artifactId>
    <version>${your-version}</version>
</dependency>--%>
<%--<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>--%>

<%--<security:authorize access="isAuthenticated()">
    authenticated as <security:authentication property="principal.username" />
</security:authorize>--%>

<%--<html xmlns:th="https://www.thymeleaf.org"
      xmlns:sec="https://www.thymeleaf.org/thymeleaf-extras-springsecurity5">
<body>
<div sec:authorize="isAuthenticated()">
    Authenticated as <span sec:authentication="name"></span></div>
</body>
</html>--%>


<!DOCTYPE html>
<head lang="en">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>Добавить товар</title>
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
                <div class="col-md-8 form-group">
                    <div class="row">
                        <div class="col-md-6 mb-4">
                            <label for="nomernakladnoj">Номер накладной</label>
                            <input type="text" class="form-control" id="nomernakladnoj" placeholder="Номер накладной"
                                   required>
                        </div>
                        <div class="col-md-6 mb-4">
                            <label for="productheight">Высота</label>
                            <input type="text" class="form-control" id="productheight" placeholder="Высота">
                        </div>
                    </div>

                    <br>
                    <div class="row">
                        <div class="col-md-6 mb-4">
                            <label for="productarticul">Артикул</label>
                            <input type="text" class="form-control" id="productarticul" placeholder="Артикул товара"
                                   required>
                        </div>
                        <div class="col-md-6 mb-4">
                            <label for="productlength">Длина</label>
                            <input type="text" class="form-control" id="productlength" placeholder="Длина">
                        </div>
                    </div>

                    <br>
                    <div class="row">
                        <div class="col-md-6 mb-4">
                            <label for="productname">Наименование товара</label>
                            <input type="text" class="form-control" id="productname" placeholder="Наименование товара"
                                   required>
                        </div>
                        <div class="col-md-6 mb-4">
                            <label for="productwidth">Ширина</label>
                            <input type="text" class="form-control" id="productwidth" placeholder="Ширина">
                        </div>
                    </div>

                    <br>
                    <div class="row">
                        <div class="col-md-6 mb-4">
                            <label for="productTypeList">Категория товара</label>
                            <form:select class="form-control" path="productTypeList" id="productTypeList">
                                <form:option value="NONE" label="Категория товара"/>
                                <form:options items="${productTypeList}"/>
                            </form:select>
                            <%--                                    <input type="text" class="form-control" id="producttype" placeholder="Выберите категорию товара" required>--%>
                        </div>
                        <div class="col-md-6 mb-4">
                            <label for="productcolor">Цвет</label>
                            <input type="text" class="form-control" id="productcolor" placeholder="Цвет">
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

                    <br>
                    <div class="row">
                        <div class="col-md-12 mb-3">
                            <label for="productdescription">Описание товара</label>
                            <textarea class="form-control rounded-0" id="productdescription"
                                      placeholder="Опишите товар кратко" rows="3"></textarea>
                        </div>
                    </div>

                    <br>
                    <div class="row">
                        <div class="col-md-4 mb-4">
                            <label for="procurementcountry">Страна поставки</label>
                            <input type="text" class="form-control" id="procurementcountry"
                                   placeholder="Страна поставки">
                        </div>

                        <div class="col-md-4 mb-4">
                            <label class="custom-file-label" for="contragents">Поставщик</label>
                            <form:select class="form-control" path="contragents" id="contragents">
                                <form:option value="NONE" label="Выбрать поставщика"/>
                                <form:options items="${contragents}" itemValue="contragentId"
                                              itemLabel="contragentName"/>--%>
                            </form:select>
                        </div>
                        <div class="col-md-4 mb-4">
                            <label for="procurementdate">Дата поставки</label>
                            <input type="date" class="form-control" id="procurementdate">
                        </div>
                    </div>

                    <br>
                    <div class="row">

                        <div class="col-md-2 mb-4">
                            <label for="productquantity">Количество</label>
                            <input type="text" class="form-control" id="productquantity" placeholder="Количество">
                        </div>
                        <div class="col-md-4 mb-4">
                            <label for="validitydate">Срок годности</label>
                            <input type="date" class="form-control" id="validitydate">
                        </div>

                        <div class="col-md-3 mb-4">
                            <label for="procurementprice">Цена закупки</label>
                            <input type="text" class="form-control" id="procurementprice" placeholder="Цена закупки">
                        </div>

                        <div class="col-md-3 mb-4">
                            <label for="productprice">Цена продажи</label>
                            <input type="text" class="form-control" id="productprice" placeholder="Цена продажи">
                        </div>
                    </div>

                    <br>
                    <div class="row">
                        <div class="col-md-12 mb-3">
                            <label for="procurementdetails">Детали поставки</label>
                            <textarea class="form-control rounded-0" id="procurementdetails"
                                      placeholder="Детали поставки" rows="1"></textarea>
                        </div>
                    </div>

                    <br>
                    <div class="row">
                        <div class="text-right">
                            <button class="btn btn-primary" type="submit" id="addproduct">Сохранить</button>
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
        function addDataToDatabase(dataToAdd, handleUrl, entity) {
            $.ajax({
                type : "POST",
                contentType : "application/json",
                url : handleUrl,
                data : JSON.stringify(dataToAdd),//productStr,
                dataType : 'json',
                cache : false,
                timeout : 600000,
                success : function(data) {
                    console.log(entity + " has been successfully added")
                },
                error : function(e) {
                    alert("error occured while trying update the database with " + entity);
                }
            });
        }

        $("#addproduct").click(function() {
            var pictureUrl = "lol";
            var nomernakladnoj = $('#nomernakladnoj').val();
            var productheight = $('#productheight').val();
            var productarticul = $('#productarticul').val();
            var productlength = $('#productlength').val();
            var productname = $('#productname').val();
            var productwidth = $('#productwidth').val();
            var productTypeList = $("#productTypeList").find('option:selected').text();
            var productcolor = $('#productcolor').val();
            var productdescription = $('#productdescription').val();
            var procurementcountry = $('#procurementcountry').val();
            var contragents = $("#contragents").find('option:selected').val();
            var contragentName = $("#contragents").find('option:selected').text();
            var procurementdate = $('#procurementdate').val();
            var productquantity = $('#productquantity').val();
            var validitydate = $('#validitydate').val();
            var procurementprice = $('#procurementprice').val();
            var productprice = $('#productprice').val();
            var procurementdetails = $('#procurementdetails').val();



            //
            // procurement.push(procurementJson);
            // var conrtagentEntity = $.ajax({
            //     type : "POST",
            //     contentType : "application/json",
            //     url : "/getContragentById",
            //     data : JSON.stringify(contragents),//productStr,
            //     dataType : 'json',
            //     cache : false,
            //     timeout : 600000,
            //     success : function(data) {
            //         console.log(data);
            //         return data;
            //     },
            //     error : function(e) {
            //         // console.log(data);
            //         // alert("error occured while trying update the database");
            //         // $('#discount').val("");
            //         // $("#productPriceAfterDiscount").val($('#productPrice').val());
            //     }
            // });

            var conrtagent = {
                "contragentId" : contragents,
                "contragentName" : contragentName
            }

            var procurement = [];
            var procurementJson = {
                "articul" : productarticul,
                "procurementPrice" : procurementprice,
                "procurementDate" : procurementdate,
                "quantity" : productquantity,
                "details" : procurementdetails,
                "validityDate" : validitydate,
                "contragentsByContragentId" : conrtagent
            };
           var productDetails = {
                "productDescription" : productdescription,
                "height" : productheight,
                "length" : productlength,
                "width" : productwidth,
                "color" : productcolor
            };
            procurement.push(procurementJson);

            var productStatusByProductId = {
                "articul" : productarticul,
                "validityDate" : validitydate
            };



            // productStatus : {
            //     productId : "",
            //     articul : productarticul,
            //     procurementprice : procurementprice,
            //     productprice : productprice,
            //     productquantity : productquantity,
            //     validitydate : validitydate
            // }
            var product = {
                "productName" : productname,
                "productType" : productTypeList,
                "articul" : productarticul,
                "pictureUrl" : pictureUrl,
                "originOfProduct" : procurementcountry,
                "procurementsByProductId" : procurement,
                "contragentsByContragentId" : conrtagent,
                "productDetailsByProductId" : productDetails,
                "productStatusByProductId" : productStatusByProductId
            };
               // procurement : procurement,
               // contragents : contragents



            //var productStr = JSON.stringify(product);

            //var stringifyproduct = JSON.stringify(product);



            $.ajax({
                type : "POST",
                contentType : "application/json",
                url : "/addproduct",
                data : JSON.stringify(product),//productStr,
                dataType : 'json',
                cache : false,
                timeout : 600000,
                success : function(data) {
                    console.log(data);
/*                    addDataToDatabase(procurement, "/addProcurement", "Procurement Entity");
                    addDataToDatabase(productdetails, "/addProductDetails", "Product Details Entity");
                    addDataToDatabase(productstatus, "/addProductStatus", "Product Status Entity");*/
                },
                error : function(e) {
                    console.log(e);
                    alert("error occured while trying update the database");
                    // $('#discount').val("");
                    // $("#productPriceAfterDiscount").val($('#productPrice').val());
                }
            });
            // var procurementJson = {
            //     productId : "",
            //     articul : productarticul,
            //     procurementprice : procurementprice,
            //     procurementdate : procurementdate,
            //     productquantity : productquantity,
            //     procurementdetails : procurementdetails,
            //     validitydate : validitydate,
            //     productentity: {
            //         productId : "",
            //         productname : productname,
            //         productType : productTypeList,
            //         articul: productarticul,
            //         pictureUrl : pictureUrl,
            //         contragentsId : contragents,
            //         procurementcountry : procurementcountry
            //     },
            //
            // };
        });

    });
</script>
</html>
