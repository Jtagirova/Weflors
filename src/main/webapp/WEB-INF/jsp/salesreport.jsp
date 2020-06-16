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
                        <input type="text" class="form-control" name="datefilter" value="" />

<%--                        <select id="date" class="form-control">
                            <option value="Day" label="За Сегодня" />
                            <option value="Week" label="За Неделю" />
                            <option value="Month" label="За Месяц" />
                            <option value="Year" label="За Год" />
                        </select>--%>
                    </div>
                    <div class="col-md-4 mb-4">
                        <label for="allproducts">Выберите Продукты*</label>
                        <form:select multiple="true" id="allproducts" class="selectpicker form-control" data-selected-text-format="count" data-none-selected-text="Все продукты" path="allproducts">

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

            <div class="col-md-4">
                <canvas id="myChart" width="100" height="100"></canvas>
            </div>
            <div class="col-md-4">
                <canvas id="myChart2" width="100" height="100"></canvas>
            </div>
            <div class="col-md-4">
                <canvas id="myChart3" width="100" height="100"></canvas>
            </div>

            <script>
/*                var ctx = document.getElementById('myChart').getContext('2d');
                var stackedLine = new Chart(ctx, {
                    type: 'line',
                    data: [20, 10, 7, 12, 15],
                    options: {
                        scales: {
                            yAxes: [{
                                stacked: true
                            }]
                        }
                    }
                });*/
                var data = {
                    datasets: [{
                        data: [10, 20, 30],
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                        ]
                    }],

                    // These labels appear in the legend and in the tooltips when hovering different arcs
                    labels: [
                        'Red',
                        'Yellow',
                        'Blue'
                    ]
                };
                var ctx = document.getElementById('myChart');
                // For a pie chart
                var myPieChart = new Chart(ctx, {
                    type: 'pie',
                    data: data,

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

                // And for a doughnut chart
                var ctx2 = document.getElementById('myChart2');
                var myDoughnutChart = new Chart(ctx2, {
                    type: 'doughnut',
                    data: data,
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


                var ctx3 = document.getElementById('myChart3').getContext('2d');
                var myChart = new Chart(ctx3, {
                    type: 'bar',
                    data: {
                        labels: ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь','Июль'],
                        datasets: [{
                            label: 'Покупки',
                            data: [12, 19, 3, 5, 2, 3],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.4)',
                                'rgba(54, 162, 235, 0.4)',
                                'rgba(255, 206, 86, 0.4)',
                                'rgba(75, 192, 192, 0.4)',
                                'rgba(153, 102, 255, 0.4)',
                                'rgba(255, 159, 64, 0.4)'
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
                                'rgba(255, 99, 132, 0.7)',
                                'rgba(54, 162, 235, 0.7)'

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


$(function() {

    $('input[name="datefilter"]').daterangepicker({
        autoUpdateInput: false,
        locale: {
            cancelLabel: 'Clear'
        }
    });

    $('input[name="datefilter"]').on('apply.daterangepicker', function(ev, picker) {
        $(this).val(picker.startDate.format('MM/DD/YYYY') + ' - ' + picker.endDate.format('MM/DD/YYYY'));
    });

    $('input[name="datefilter"]').on('cancel.daterangepicker', function(ev, picker) {
        $(this).val('');
    });

});

let selectedDatePeriod = [];
let selectedProductList = [];
$('#allproducts').change(function(){
    var selectedCountry = $(this).children("option:selected");
    console.log(selectedCountry.length);
    $.each(selectedCountry, function( index, value ) {
        console.log( selectedCountry[index].value);
    });
    //selectedProductList =
})

            </script>


        </div>
    </div>
</div>