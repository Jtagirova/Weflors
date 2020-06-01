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
    <title>Главная страница</title>
    <jsp:include page="/WEB-INF/jsp/base_layout/head_links.jsp"></jsp:include>
</head>
<body>

<div class="container-fluid ">
    <div class="row">
        <jsp:include page="/WEB-INF/jsp/base_layout/leftnav.jsp"></jsp:include>
        <div class="col-md-8">
            <jsp:include page="/WEB-INF/jsp/base_layout/topnav.jsp"></jsp:include>
            <!-- Form Content Here -->
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-6 mb-6 col-md-offset-4">
                        <h3>Добро пожаловать в наш магазин</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-6 col-md-offset-4">
                        <h3>часы работы : Пн, Вт, Ср, Пт, Сб, Вс с 8:00 до 21:00</h3>
                    </div>
                </div>
                <br><br>
                <div class="row">
                    <div class="col-md-6 mb-6 col-md-offset-1">
                        <h3>У нас Вы можете приобрести цветы, буктами и в розницу и сопутсвующие товары</h3>
                    </div>
                </div>
                <br><br><br><br><br><br><br><br>
                <div class="col-md-8 col-md-offset-3">
                    <div class="carousel slide" id="myCarousel">
                        <div class="carousel-inner">
                            <div class="item active">
                                <div class="col-md-4"><a href="#"><img src="/img/carousel_flowers_1.jpg" class="img-responsive"></a></div>
                            </div>
                            <div class="item">
                                <div class="col-md-4"><a href="#"><img src="/img/carousel_flowers_2.jpg" class="img-responsive"></a></div>
                            </div>
                            <div class="item">
                                <div class="col-md-4"><a href="#"><img src="/img/carousel_flowers_3.jpg" class="img-responsive"></a></div>
                            </div>
                            <div class="item">
                                <div class="col-md-4"><a href="#"><img src="/img/carousel_flowers_4.jpg" class="img-responsive"></a></div>
                            </div>
                            <div class="item">
                                <div class="col-md-4"><a href="#"><img src="/img/carousel_flowers_5.jpg" class="img-responsive"></a></div>
                            </div>

                        </div>
                        <a class="left carousel-control" href="#myCarousel" data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a>
                        <a class="right carousel-control" href="#myCarousel" data-slide="next"><i class="glyphicon glyphicon-chevron-right"></i></a>
                    </div>
                </div>
                <script>
                    $('#myCarousel').carousel({
                        interval: 10000
                    })

                    $('.carousel .item').each(function(){
                        var next = $(this).next();
                        if (!next.length) {
                            next = $(this).siblings(':first');
                        }
                        next.children(':first-child').clone().appendTo($(this));

                        if (next.next().length>0) {
                            next.next().children(':first-child').clone().appendTo($(this));
                        }
                        else {
                            $(this).siblings(':first').children(':first-child').clone().appendTo($(this));
                        }
                    });
                </script>
                <style>
                    /* override position and transform in 3.3.x */
                    .carousel-inner .item.left.active {
                        transform: translateX(-33%);
                    }
                    .carousel-inner .item.right.active {
                        transform: translateX(33%);
                    }

                    .carousel-inner .item.next {
                        transform: translateX(33%)
                    }
                    .carousel-inner .item.prev {
                        transform: translateX(-33%)
                    }

                    .carousel-inner .item.right,
                    .carousel-inner .item.left {
                        transform: translateX(0);
                    }
                </style>

<%--                <div class="col-md-12">
                    <br><br><br>
                <!-- Carousel -->
                <div id="Carousel" class="carousel slide">
                    <ol class="carousel-indicators">
                        <li data-target="#Carousel" data-slide-to="0" class="active"></li>
                        <li data-target="#Carousel" data-slide-to="1"></li>
                        <li data-target="#Carousel" data-slide-to="2"></li>
                        <li data-target="#Carousel" data-slide-to="3"></li>
                        <li data-target="#Carousel" data-slide-to="4"></li>
                    </ol>

                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="/img/carousel_flowers_1.jpg">
                        </div>
                        <div class="item">
                            <img src="/img/carousel_flowers_2.jpg">
                        </div>
                        <div class="item">
                            <img src="/img/carousel_flowers_3.jpg">
                        </div>
                        <div class="item">
                            <img src="/img/carousel_flowers_4.jpg">
                        </div>
                        <div class="item">
                            <img src="/img/carousel_flowers_5.jpg">
                        </div>
                    </div>

                    <a class="left carousel-control" href="#Carousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a class="right carousel-control" href="#Carousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                </div>

            </div>--%>
            </div>
        </div>
    </div>
</div>


