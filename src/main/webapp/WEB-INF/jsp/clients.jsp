<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
                            <input type="text" class="form-control" id="findClient" 
                            	placeholder="Введите имя клиента"/>
                        </div>
                    </div>
                    <br>
                </div>

                <sec:authorize access="hasAuthority('admin')">
               
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
                                   placeholder="Имя клиента" maxlength ="50"/>
                            <input type="hidden" id="clientId" name="clientId"/>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="clientSurname">Фамилия*</label>
                            <input type="text" class="form-control" id="clientSurname" name="clientSurname"
                                   placeholder="Фамилия клиента" maxlength ="50"/>
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
                            <input type="email" class="form-control" id="clientEmail" name="clientEmail"
                                   placeholder="E-mail" title="Email должен быть в формате example@google.com" 
                                   pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" maxlength ="50"/>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="clientPhone">Tелефон*</label>
                          	<input type="tel" class="form-control" id="clientPhone" name="clientPhone"
                                   placeholder="Телефон" maxlength ="15"/>     
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="clientDiscount">Скидка%</label>
                            <input type="text" class="form-control" id="clientDiscount" name="clientDiscount"
                                   placeholder="Скидка%" pattern="\d+" maxlength ="3"/>
                        </div>
                    </div>
                    <br><br>
                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label for="clientEmail">Адрес</label>
                            <input type="text" class="form-control" id="clientAddress" name="clientAddress"
                                   placeholder="Адрес" max ="50"/>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="clientZipCode">Индекс</label>
                            <input type="number" class="form-control" id="clientZipCode" name="clientZipCode"
                                   oninput="this.value=this.value.replace(/[^0-9]/g,'');" placeholder="Индекс" max ="15"/>
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
                                <button class="btn btn-primary" type="submit" id="addClient" disabled>Добавить</button>
                                <button class="btn btn-primary" type="submit" id="updateClient" disabled>Сохранить изменения</button>
                                <button class="btn btn-primary" type="submit" id="cancel">Отменить</button>
                            </div>
                        </div>
                    </div>
                </div>

                </sec:authorize>

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
                                    <th scope="col" class="text-center">Сумма покупок</th>
                                    <th scope="col" class="text-center">Дата рождения</th>
                                    <sec:authorize access="hasAuthority('admin')"> <th scope="col" class="text-center">Изменение / Удаление</th> </sec:authorize>
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

		$('#updateClient').hide();
		$('#cancel').hide();
		$('#clientPhone').mask('+375(29)0000000');
	
        $.ajax({
            type: 'GET',
            url: "/clients/list",
            dataType: 'json',
            contentType: 'application/json',
            success: function (data) {
                data.forEach(function (item) {
                    var rowl = '<tr><td>' + item.clientName + " " + item.clientSurname + '</td>' +
                        '<td>' + item.phone + '</td>' +
                        '<td>' + item.eMail + '</td>' +
                        '<td>' + item.discount + '</td>' +
                        '<td>' + item.amountPurchased + '</td>' +
                        '<td>' + item.dateOfBirth + '</td>' +
                        '<sec:authorize access="hasAuthority(\'admin\')">' +
        				'<td class="text-center"><input type="button" changeId="'+ item.clientId +'" class="btn btn-primary" value="Изменить">' + ' / ' +
        				'<button deleteId="'+ item.clientId +'" class="btn btn-primary" type="submit">Удалить</button></td>' +
                        '</sec:authorize>' +
                        '</tr>';
                    $('#clientTable > tbody').append(rowl);

                    var cid = "[changeId='" + item.clientId + "']";
        			$(cid).click(function (id) {
        				$("#updateClient").attr("disabled", "disabled");
        				$('#clientId').val(item.clientId);
        				$('#clientName').val(item.clientName);
        	            $('#clientSurname').val(item.clientSurname);
        	            $('#clientBirthday').val(item.dateOfBirth);
        	            $('#clientEmail').val(item.eMail);
        	            $('#clientPhone').val(item.phone);
        	            $('#clientDiscount').val(item.discount);
        	            $('#clientAddress').val(item.address);
        	            $('#clientZipCode').val(item.zipCode);
        				$('#addClient').hide();
        				$('#updateClient').show();	
        				$('#cancel').show();	
        			});
        			var did = "[deleteId='" + item.clientId + "']";
        			$(did).click(function (id) {
        			    if (confirm('Вы желаете удалить данного клиента из вашей базы данных?')) {
        			        $.ajax({
        						type : "DELETE",
        						contentType : "application/json",
        						url : "/clients/delete",
        						data : JSON.stringify(item.clientId),
        						dataType : 'text',
        						cache : false,
        						timeout : 600000,
        						success : function(data) {
        							alert(data);
        						},
        						error : function(data) {	
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
            var zipCode = $('#clientZipCode').val();
            var clientZipCode = zipCode.replace(/\s+/g, ' ').trim();
            var clientJSON = {
                "clientName": clientName,
                "clientSurname": clientSurname,
                "dateOfBirth": clientBirthday,
                "eMail": clientEmail,
                "phone": clientPhone,
                "discount": clientDiscount,
                "address": clientAddress,
                "zipCode": clientZipCode,
                "totalAmountPurchased": 0
            };
            var clientsEntity = JSON.stringify(clientJSON);
            if (confirm('Вы желаете добавить данного клиента в вашу базу данных?')) {
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    url: "/clients/add",
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
                location.reload(true);
            }
            $("#addClient").attr("disabled", "disabled");
        });
        
        $("#updateClient").click(function() {
        	var clientId = $('#clientId').val();
        	var clientName = $('#clientName').val();
            var clientSurname = $('#clientSurname').val();
            var clientBirthday = $('#clientBirthday').val();
            var clientEmail = $('#clientEmail').val();
            var clientPhone = $('#clientPhone').val();
            var clientDiscount = $('#clientDiscount').val();
            var clientAddress = $('#clientAddress').val();
            var zipCode = $('#clientZipCode').val();
            var clientZipCode = zipCode.replace(/\s+/g, ' ').trim();
            var json = {
            	"clientId" : clientId,	
                "clientName": clientName,
                "clientSurname": clientSurname,
                "dateOfBirth": clientBirthday,
                "eMail": clientEmail,
                "phone": clientPhone,
                "discount": clientDiscount,
                "address": clientAddress,
                "zipCode": clientZipCode
            }; 
    		var clientEntity = JSON.stringify(json);
            if (confirm('Вы желаете изменить данные о клиенте в вашей базе данных?')) {
            	$.ajax({
        			type : "POST",
        			contentType : "application/json",
        			url : "/clients/update",
        			data : clientEntity,
        			dataType : 'json',
        			cache : false,
        			timeout : 600000,
        			success : function(data) {
        				alert(data.responseText);
        			},
        			error : function(data) {	
        				alert(data.responseText);
        			}
        		});	
            	location.reload(true);
            }
            $("#addClient").attr("disabled", "disabled");
            $('#updateClient').hide();
    	});	
        
        $("#cancel").click(function() {	
    		location.reload(true);
    	});

        $('input').change(function(){
    		var clientName = $('#clientName').val();
    		var clientSurname = $('#clientSurname').val();
    		var clientBirthday = $('#clientBirthday').val();
    		var clientEmail = $('#clientEmail').val();
    		var clientPhone = $('#clientPhone').val();
    		var clientDiscount = $('#clientDiscount').val();
            var clientAddress = $('#clientAddress').val();
            var clientZipCode = $('#clientZipCode').val();
    		if ( clientName !='' && clientSurname !='' && clientBirthday !='' && clientEmail !='' && clientPhone !=''){
    			$('#addClient').removeAttr('disabled');
    			$('#updateClient').removeAttr('disabled');
    		} else {
    			$('#addClient').attr('disabled', 'disabled');
    			$('#updateClient').attr('disabled', 'disabled');
    		}
    		if (clientDiscount ==''){
    			$('#clientDiscount').val(0);
    		} 
    		if (clientAddress ==''){
    			$('#clientAddress').val(0);
    		} 
    		if (clientZipCode ==''){
    			$('#clientZipCode').val(0);
    		} 
    	});
        
        $('#clientTable').searcher({
            inputSelector: '#findClient'
        });
        

});

</script>
</body>
</html>