<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head lang="en">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Клиенты</title>
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
                        <div class="col-md-4 mb-4">
                            <h3>Поиск клиента</h3>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-4 mb-4">
                            <input type="text" class="form-control" id="findClient" placeholder="Введите имя клиента"/>
                        </div>
                    </div>
                    <br>
                </div>
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-4 mb-4">
                            <h3>Добавление клиента</h3>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label for="clientName">Имя*</label>
                            <input type="text" class="form-control" id="clientName" name="clientName"
                                   placeholder="Имя клиента"/>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="clientSurname">Фамилия*</label>
                            <input type="text" class="form-control" id="clientSurname" name="clientSurname"
                                   placeholder="Фамилия клиента"/>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="clientBirthday">Дата Рождения*</label>
                            <input type="date" class="form-control" id="clientBirthday" name="clientBirthday"
                                   placeholder="Дата рождения"/>
                        </div>
                    </div>
                    <br><br>
                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label for="clientEmail">E-mail*</label>
                            <input type="text" class="form-control" id="clientEmail" name="clientEmail"
                                   placeholder="E-mail"/>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="clientPhone">Tелефон*</label>
                            <input type="text" class="form-control" id="clientPhone" name="clientPhone"
                                   placeholder="Телефон"/>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="clientDiscount">Скидка%</label>
                            <input type="text" class="form-control" id="clientDiscount" name="clientDiscount"
                                   placeholder="Скидка%"/>
                        </div>

                    </div>
                    <br><br>
                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label for="clientEmail">Адрес</label>
                            <input type="text" class="form-control" id="clientAddress" name="clientAddress"
                                   placeholder="Адрес"/>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="clientZipCode">Индекс</label>
                            <input type="text" class="form-control" id="clientZipCode" name="clientZipCode"
                                   placeholder="Индекс"/>
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
                                <button class="btn btn-primary" type="submit" id="addClient">Добавить</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-12 form-group">
                    <br><br>
                    <div class="row">
                        <div class="text-left col-md-4 mb-4">
                            <h3>Список клиентов</h3>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-12">
                            <%--							<form:form method="POST" id="writeoffForm">--%>
                            <table class="table table-striped table-bordered table-hover table-responsive"
                                   id="clientTable">
                                <thead>
                                <tr>
                                    <th scope="col" class="text-center">Имя Фамилия</th>
                                    <th scope="col" class="text-center">Телефон</th>
                                    <th scope="col" class="text-center">Почтовый адрес</th>
                                    <th scope="col" class="text-center">Скидка</th>
                                    <th scope="col" class="text-center">Дата рождения</th>
                                    <th scope="col" class="text-center">Удаление</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

        </form>
    </div>
</div>
</div>
<script>
    $(document).ready(function () {
        $.ajax({
            type: 'GET',
            url: "/clients/listClients",
            dataType: 'json',
            contentType: 'application/json',
            success: function (data) {
                data.forEach(function (item) {
                    var rowl = '<tr><td>' + item.clientName + " " + item.clientSurname + '</td>' +
                        '<td>' + item.phone + '</td>' +
                        '<td>' + item.eMail + '</td>' +
                        '<td>' + item.discount + '</td>' +
                        '<td>' + item.dateOfBirth + '</td>' +
                        '<td class="text-center"><button id="' + item.clientId + '" class="delete btn btn-primary" type="submit">Удалить</button></td></tr>';
                    $('#clientTable > tbody').append(rowl);
                    var sel = "[id='" + item.clientId + "']";
                    $(sel).click(function (id) {
                        var json = {"cclientId": item.clientId};
                        if (confirm('Вы желаете удалить данного клиента из вашей базы?')) {
                            $.ajax({
                                type: "DELETE",
                                contentType: "application/json",
                                url: "/clients/deleteClient",
                                data: JSON.stringify(json),
                                dataType: 'json',
                                cache: false,
                                timeout: 600000,
                                success: function (data) {
                                    alert(data.responseText);
                                },
                                error: function (data) {
                                    alert(data.responseText);
                                }
                            });
                        }
                    });
                });
            }
        });

        $("#addClient").click(function () {
            var clientName = $('#clientName').val();
            var clientSurname = $('#clientSurname').val();
            var clientBirthday = $('#clientBirthday').val();
            var clientEmail = $('#clientEmail').val();
            var clientPhone = $('#clientPhone').val();
            var clientDiscount = $('#clientDiscount').val();
            var clientAddress = $('#clientAddress').val();
            var clientZipCode = $('#clientZipCode').val();

            var clientJSON = {
                "clientName": clientName,
                "clientSurname": clientSurname,
                "dateOfBirth": clientBirthday,
                "eMail": clientEmail,
                "phone": clientPhone,
                "discount": clientDiscount,
                "address": clientAddress,
                "zipCode": clientZipCode
            };
            var clientsEntity = JSON.stringify(clientJSON);
            if (confirm('Вы желаете добавить данного клиента в вашу базу?')) {
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    url: "/clients/addNewClient",
                    data: clientsEntity,
                    dataType: 'json',
                    cache: false,
                    timeout: 600000,
                    success: function (data) {
                        alert(data.responseText);
                    },
                    error: function (data) {
                        alert(data.responseText);
                    }
                });
            }
        });

        $("#clientTable").searcher({
            inputSelector: "#findClient"
        });

    });

</script>

</html>