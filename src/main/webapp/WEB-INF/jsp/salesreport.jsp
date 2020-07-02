<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
                        <input type="text" class="form-control" id="datefilter" name="datefilter"
                               placeholder="Весь период" value=""/>

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
                                          itemLabel="productName"/>
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

                function showInitialReport() {
                    var ruFormat =
                        new Intl.DateTimeFormat("ru-RU", {
                            year: "numeric",
                            month: "long"
                        });
                    let initialProcurementsByProductId = [
                        <c:forEach items="${allproducts}" var="product">
                        <c:forEach items="${product.procurementsByProductId}" var="procurement">
                        {procurementDate: Date.parse("${procurement.procurementDate}"), quantity: parseInt("${procurement.quantity}")},
                        //initialProcurementsByProductId.set(ruFormat1.format(moment("${procurement.procurementDate}")) , ${procurement.quantity});
                        </c:forEach>
                        </c:forEach>
                    ];

                    let initialSalesByProductId = [
                        <c:forEach items="${allproducts}" var="product">
                        <c:forEach items="${product.salesByProductId}" var="sale">
                        {saleDate: Date.parse("${sale.saleDate}"), quantity: parseInt("${sale.quantity}")},
                        </c:forEach>
                        </c:forEach>
                    ];


                    jQuery.each(initialProcurementsByProductId, function (i, val) {
                        var procurementDate = ruFormat.format(val.procurementDate);

                        if (monthQuantityMapForProcurements.get(procurementDate) != null
                            && monthQuantityMapForProcurements.get(procurementDate) != undefined) {

                            monthQuantityMapForProcurements.set(procurementDate,
                                monthQuantityMapForProcurements.get(procurementDate) + val.quantity);

                        } else {
                            monthQuantityMapForProcurements.set(procurementDate, val.quantity);
                        }
                    });


                    jQuery.each(initialSalesByProductId, function (i, val) {
                        var saleDate = ruFormat.format(val.saleDate);

                        if (monthQuantityMapForSales.get(saleDate) != null
                            && monthQuantityMapForSales.get(saleDate) != undefined) {

                            monthQuantityMapForSales.set(saleDate,
                                monthQuantityMapForSales.get(saleDate) + val.quantity);

                        } else {
                            monthQuantityMapForSales.set(saleDate, val.quantity);
                        }
                    });
                }

                var updateReportDateLabels = function () {

                    reportLabelsForChart.clear();

                    var ruFormat =
                        new Intl.DateTimeFormat("ru-RU", {
                            year: "numeric",
                            month: "long"
                        });

                    var startDate, endDate;
                    if (salesReportHelperJSON.reportStartDatePeriod == "" || salesReportHelperJSON.reportEndDatePeriod == "") {
                        startDate = moment(new Date(2020, 0));
                        endDate = moment(Date.now());
                    } else {
                        startDate = moment(salesReportHelperJSON.reportStartDatePeriod);
                        endDate = moment(salesReportHelperJSON.reportEndDatePeriod);
                    }

                    while (startDate.isBefore(endDate)) {
                        //allMonthsInPeriod.add(startDate.format("YYYY-MM"));
                        reportLabelsForChart.add(ruFormat.format(startDate));
                        startDate = startDate.add(1, "month");
                    }
                    ;

                    console.log(reportLabelsForChart);
                    reportLabelsForChartArray = Array.from(reportLabelsForChart);
                    jQuery.each(reportLabelsForChartArray, function (i, value) {

                        if (monthQuantityMapForProcurements.get(value) != undefined || monthQuantityMapForSales.get(value) != undefined) {

                            if (!reportLabelsToShow.includes(value)) {
                                reportLabelsToShow.push(value);
                            }

                            if (monthQuantityMapForProcurements.get(value) != undefined) {
                                procurementsDataForChart.push(monthQuantityMapForProcurements.get(value));
                            } else {
                                procurementsDataForChart.push(0);
                            }

                            if (monthQuantityMapForSales.get(value) != undefined) {
                                salesDataForChart.push(monthQuantityMapForSales.get(value));
                            } else {
                                salesDataForChart.push(0);
                            }

                        }

                    });

                }

                var generateRandomColorPaletteForChart = function (internalData) {
                    var internalDataLength = internalData.length;
                    i = 0;
                    while (i <= internalDataLength) {
                        var randomR = Math.floor((Math.random() * 130) + 100);
                        var randomG = Math.floor((Math.random() * 130) + 100);
                        var randomB = Math.floor((Math.random() * 130) + 100);

                        var graphBackground = "rgb("
                            + randomR + ", "
                            + randomG + ", "
                            + randomB + ")";
                        graphColors.push(graphBackground);

                        var graphOutline = "rgb("
                            + (randomR - 80) + ", "
                            + (randomG - 80) + ", "
                            + (randomB - 80) + ")";
                        graphOutlines.push(graphOutline);

                        var hoverColors = "rgb("
                            + (randomR + 25) + ", "
                            + (randomG + 25) + ", "
                            + (randomB + 25) + ")";
                        hoverColor.push(hoverColors);

                        i++;
                    }
                    ;
                }

                var updateChartInformation = function () {
                    //clear current view
                    myChart.data.labels = new Array();
                    myChart.data.datasets = new Array();

                    //update data labels and prepare report colors
                    myChart.data.labels = reportLabelsToShow;
                    generateRandomColorPaletteForChart(myChart.data.labels);

                    //update report data
                    myChart.data.datasets =
                        [{
                            label: "Закупки",
                            data: procurementsDataForChart,
                            backgroundColor: graphColors,
                            hoverColor: hoverColor,
                            borderColor: graphOutlines,
                            borderWidth: 1
                        }, {
                            label: "Продажи",
                            data: salesDataForChart,
                            backgroundColor: hoverColor,
                            hoverColor: hoverColor,
                            borderColor: graphOutlines,
                            borderWidth: 1
                        }
                        ]

                    //draw report data
                    myChart.update();

                }


                var ctx3 = document.getElementById('myChart3').getContext('2d');
                var myChart = new Chart(ctx3, {
                    type: 'bar',
                    data: {},
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

                let monthQuantityMapForProcurements = new Map();
                let monthQuantityMapForSales = new Map();

                let reportLabelsToShow = [];

                var procurementsDataForChart = [];
                var salesDataForChart = [];
                var reportLabelsForChart = new Set();
                var reportLabelsForChartArray = [];

                var graphColors = [];
                var graphOutlines = [];
                var hoverColor = [];

                showInitialReport();
                updateReportDateLabels();
                updateChartInformation();




                $(document).ready(function () {


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
                                console.log(data + " has been successfully added");

                                reportLabelsToShow = [];
                                monthQuantityMapForProcurements = new Map();
                                monthQuantityMapForSales = new Map();
                                procurementsDataForChart = [];
                                salesDataForChart = [];
                                reportLabelsForChart = new Set();
                                reportLabelsForChartArray = [];

                                //////////
                                procuremetsDataForChart = data.procurementsByProductId;
                                var ruFormat =
                                    new Intl.DateTimeFormat("ru-RU", {
                                        year: "numeric",
                                        month: "long"
                                    });
                                if (data.length != undefined && data.length > 0) {

                                    jQuery.each(data, function (j, value) {
                                        if (value.procurementsByProductId != undefined && value.procurementsByProductId.length > 0) {
                                            jQuery.each(value.procurementsByProductId, function (i, val) {
                                                var procurementDate = ruFormat.format(moment(val.procurementDate));

                                                if (monthQuantityMapForProcurements.get(procurementDate) != null
                                                    && monthQuantityMapForProcurements.get(procurementDate) != undefined) {

                                                    monthQuantityMapForProcurements.set(procurementDate,
                                                        monthQuantityMapForProcurements.get(procurementDate) + val.quantity);

                                                } else {
                                                    monthQuantityMapForProcurements.set(procurementDate, val.quantity);
                                                }
                                            });
                                        }

                                        if (value.salesByProductId != undefined && value.salesByProductId.length > 0) {
                                            jQuery.each(value.salesByProductId, function (i, val) {
                                                var saleDate = ruFormat.format(moment(val.saleDate));

                                                if (monthQuantityMapForSales.get(saleDate) != null
                                                    && monthQuantityMapForSales.get(saleDate) != undefined) {

                                                    monthQuantityMapForSales.set(saleDate,
                                                        monthQuantityMapForSales.get(saleDate) + val.quantity);

                                                } else {
                                                    monthQuantityMapForSales.set(saleDate, val.quantity);
                                                }
                                            });
                                        }
                                    });

                                }

                                updateReportDateLabels();
                                updateChartInformation();
                            },
                            error: function (e) {
                                alert("error occured while trying update the database with " + e);
                            }
                        });
                    }

                    $('input[name="datefilter"]').daterangepicker({
                        autoUpdateInput: false,
                        locale: {
                            cancelLabel: 'Очистить',
                            applyLabel: 'Применить'
                        }
                    });

                    $('input[name="datefilter"]').on('apply.daterangepicker', function (ev, picker) {
                        $(this).val(picker.startDate.format('YYYY-MM-DD') + ' - ' + picker.endDate.format('YYYY-MM-DD'));

                        salesReportHelperJSON.reportStartDatePeriod = picker.startDate.format('YYYY-MM-DD');
                        salesReportHelperJSON.reportEndDatePeriod = picker.endDate.format('YYYY-MM-DD');

                        updateReportDateLabels();

                        getSelectedProductIDsList();
                        updateSalesReportView(salesReportHelperJSON);

                    });

                    $('input[name="datefilter"]').on('cancel.daterangepicker', function (ev, picker) {
                        $(this).val('');
                        salesReportHelperJSON.reportStartDatePeriod = "";
                        salesReportHelperJSON.reportEndDatePeriod = "";

                    });

                    function getSelectedProductIDsList() {
                        var selectedProduct = $('#allproducts').children("option:selected");
                        salesReportHelperJSON.productIDs = [];
                        console.log(selectedProduct.length);
                        $.each(selectedProduct, function (index, value) {
                            salesReportHelperJSON.productIDs.push(selectedProduct[index].value);
                            console.log(selectedProduct[index].value);
                        });
                    }

                    $('#allproducts').change(function () {

                        getSelectedProductIDsList();

                        updateSalesReportView(salesReportHelperJSON);

                    })


                });

            </script>


        </div>
    </div>
</div>