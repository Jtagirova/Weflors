<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<div class="col-md-3">

    <!-- It can be fixed with bootstrap affix http://getbootstrap.com/javascript/#affix-->
    <nav class="navbar navbar-collapse" >
        <ul id="sidebar" style="padding-bottom: 25%;" class="well sidebar-nav  bg">
            <a href="#" class="navbar-left"><img src="/img/weflors_logo_grey.jpg" height="60"></a>
            <h3>&nbsp
            </h3>

            <%--                    <h3><i class="glyphicon glyphicon-grain"></i>
                                    <large><b>WeFlors</b></large>
                                </h3>--%>
            <%--                    <a class="navbar-brand" href="/">
                                    <img src="/img/weflors_logo.jpg" height="40" alt="WeFlors">
                                </a>--%>

            <hr>
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="#">Главная</a></li>
                <hr>
                <h4><i class="glyphicon glyphicon-briefcase"></i>
                    <b>Учет товара</b>
                </h4>
                <li><a href="/addproduct">Добавить товар</a></li>
                <li><a href="#">Список товаров</a></li>
                <li><a href="/productsale">Продажа товара</a></li>
                <li><a href="#">Списание товара</a></li>
            </ul>
            <hr>
            <h4><i class="glyphicon glyphicon-book"></i>
                <b>Справочники</b>
            </h4>
            <ul class="nav nav-pills nav-stacked">
                <li><a href="#">Поставщики</a></li>
                <li><a href="#">Категории товара</a></li>
                <li><a href="#">Клиенты</a></li>
                <li><a href="#">Пользователи</a></li>
            </ul>
            <hr>
            <h4><i class="glyphicon glyphicon-stats"></i>
                <b>Отчеты</b>
            </h4>
            <ul class="nav nav-pills nav-stacked">
                <li><a href="#">Отчет о продажах</a></li>
                <li><a href="#">Отчет о списанном товаре</a></li>

            </ul>
    </nav>

</div>