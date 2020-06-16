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
                <h2>Букеты которые мы делаем:</h2>
            </div>

            <div class="col-md-12">
                <br>
                <div class="row">
                    <div class="col-md-3 mb-3 zoom">
                        <a href="#"><img src="/img/mainpage_bouquet1.png" class="img-responsive"></a>
                    </div>
                    <div class="col-md-3 mb-3 zoom">
                        <a href="#"><img src="/img/mainpage_bouquet2.png" class="img-responsive"></a>
                    </div>
                    <div class="col-md-3 mb-3 zoom">
                        <a href="#"><img src="/img/mainpage_bouquet3.png" class="img-responsive"></a>
                    </div>
                    <div class="col-md-3 mb-3 zoom">
                        <a href="#"><img src="/img/mainpage_bouquet4.png" class="img-responsive"></a>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-3 mb-3 zoom">
                        <a href="#"><img src="/img/mainpage_bouquet5.png" class="img-responsive"></a>
                    </div>
                    <div class="col-md-3 mb-3 zoom">
                        <a href="#"><img src="/img/mainpage_bouquet6.png" class="img-responsive"></a>
                    </div>
                    <div class="col-md-3 mb-3 zoom">
                        <a href="#"><img src="/img/mainpage_bouquet7.png" class="img-responsive"></a>
                    </div>
                    <div class="col-md-3 mb-3 zoom">
                        <a href="#"><img src="/img/mainpage_bouquet8.png" class="img-responsive"></a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</body>


