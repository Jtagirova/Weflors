<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head lang="en">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Отчет о продажах</title>
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
                        <label for="datefilter">Выберите период*</label>
                        <input type="text" class="form-control" name="datefilter" placeholder="Весь период" value="" />

<%--                        <select id="date" class="form-control">
                            <option value="Day" label="За Сегодня" />
                            <option value="Week" label="За Неделю" />
                            <option value="Month" label="За Месяц" />
                            <option value="Year" label="За Год" />
                        </select>--%>
                    </div>
                    <div class="col-md-4 mb-4">
                        <label for="allproducts">Выберите товары*</label>
                        <form:select multiple="true" id="allproducts" class="selectpicker form-control"
                                     data-live-search="true" data-none-selected-text="Все товары" path="allproducts">

                            <form:options items="${allproducts}" itemValue="productId"
                                          itemLabel="productName" />
                        </form:select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">


                    </div>
                </div>
            </div>


            <div class="col-md-6 col-md-offset-3">
                <canvas id="myChart3" width="100" height="100"></canvas>
            </div>

            <script>








                var ctx3 = document.getElementById('myChart3').getContext('2d');
                var myChart = new Chart(ctx3, {
                    type: 'bar',
                    data: {
                        labels: ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь','Июль'],
                        datasets: [{
                            label: 'Покупки',
                            data: [12, 19, 3, 5, 2, 3],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.7)',
                                'rgba(54, 162, 235, 0.7)',
                                'rgba(255, 206, 86, 0.7)',
                                'rgba(75, 192, 192, 0.7)',
                                'rgba(153, 102, 255, 0.7)',
                                'rgba(255, 159, 64, 0.7)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1
                        },
                         {
                            label: 'Продажи',
                            data: [10, 17],
                            backgroundColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)'

                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)'

                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                        }
                    }
                });

                var salesReportHelperJSON = {
                    "productIDs": [],
                    "reportStartDatePeriod": "",
                    "reportEndDatePeriod": ""
                };

                var dataCame = {};
                var procuremetsDataForChart = [];
                var salesDataForChart = [];
                var reportLabelsForChart = new Set();



$(function() {

    function updateReportDateLabels() {

        reportLabelsForChart.clear();

        var ruFormat =
            new Intl.DateTimeFormat("ru-RU", {
                year: "numeric",
                month: "long"
            });

        var startDate = moment(salesReportHelperJSON.reportStartDatePeriod);
        var endDate = moment(salesReportHelperJSON.reportEndDatePeriod);


        while (startDate.isBefore(endDate)) {
            //allMonthsInPeriod.add(startDate.format("YYYY-MM"));
            reportLabelsForChart.add(ruFormat.format(startDate));
            startDate = startDate.add(1, "month");
        };

        console.log(reportLabelsForChart);


    }

    function updateSalesReportView(salesReportHelperJSON) {
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/updateSalesReportView",
            data: JSON.stringify(salesReportHelperJSON),
            dataType: 'json',
            cache: false,
            timeout: 600000,
            success: function (data) {
                console.log(data + " has been successfully added")
                dataCame = data;
                procuremetsDataForChart = data.procurementsByProductId;
                updateReportDateLabels();
                removeChartData(myChart);
            },
            error: function (e) {
                alert("error occured while trying update the database with " + e);
            }
        });
    }

    function addChartData(chart, label, data) {
        chart.data.labels.push(label);
        chart.data.datasets.forEach((dataset) => {
            dataset.data.push(data);
        });
        chart.update();
    }

    function removeChartData(chart) {
        chart.data.labels.pop();
        chart.data.datasets.forEach((dataset) => {
            dataset.data.pop();
        });
        chart.update();
    }

    $('input[name="datefilter"]').daterangepicker({
        autoUpdateInput: false,
        locale: {
            cancelLabel: 'Очистить',
            applyLabel: 'Применить'
        }
    });

    $('input[name="datefilter"]').on('apply.daterangepicker', function(ev, picker) {
        $(this).val(picker.startDate.format('YYYY-MM-DD') + ' - ' + picker.endDate.format('YYYY-MM-DD'));

        salesReportHelperJSON.reportStartDatePeriod = picker.startDate.format('YYYY-MM-DD');
        salesReportHelperJSON.reportEndDatePeriod = picker.endDate.format('YYYY-MM-DD');

        updateReportDateLabels();

    });

    $('input[name="datefilter"]').on('cancel.daterangepicker', function(ev, picker) {
        $(this).val('');
        salesReportHelperJSON.reportStartDatePeriod = "";
        salesReportHelperJSON.reportEndDatePeriod = "";
    });

    let selectedProductList = [];
    $('#allproducts').change(function(){
        var selectedProduct = $(this).children("option:selected");
        salesReportHelperJSON.productIDs = [];
        console.log(selectedProduct.length);
        $.each(selectedProduct, function( index, value ) {
            salesReportHelperJSON.productIDs.push(selectedProduct[index].value);
            console.log( selectedProduct[index].value);
        });

        updateSalesReportView(salesReportHelperJSON);

    })


});

            </script>


        </div>
    </div>
</div>