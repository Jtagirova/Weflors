<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<div class="col-md-3">

    <!-- It can be fixed with bootstrap affix http://getbootstrap.com/javascript/#affix-->
    <nav class="navbar navbar-collapse" >
        <ul id="sidebar" style="padding-bottom: 25%;" class="well sidebar-nav bg">
            <a href="/" class="navbar-center">
                <h2>Цветочный магазин</h2>
                <h1>WeFlors</h1></span>
            </a>


            <%--                    <h3><i class="glyphicon glyphicon-grain"></i>
                                    <large><b>WeFlors</b></large>
                                </h3>--%>
            <%--                    <a class="navbar-brand" href="/">
                                    <img src="/img/weflors_logo.jpg" height="40" alt="WeFlors">
                                </a>--%>

            <hr>
            <ul class="nav nav-pills nav-stacked">

                <h4><i class="glyphicon glyphicon-briefcase"></i>
                    <b>Учет товара</b>
                </h4>
                <li><a href="/addproduct">Добавить товар</a></li>
                <li><a href="/productslist">Список товаров</a></li>
                <li><a href="/productsale">Продажа товара</a></li>
                <li><a href="/productwriteoff">Списание товара</a></li>
            </ul>
            <hr>
            <h4><i class="glyphicon glyphicon-book"></i>
                <b>Справочники</b>
            </h4>
            <ul class="nav nav-pills nav-stacked">
                <li><a href="/contragents">Поставщики</a></li>
                <li><a href="/typeproduct">Категории товара</a></li>
                <li><a href="/clients">Клиенты</a></li>
                <li><a href="/users">Пользователи</a></li>
            </ul>
            <hr>
            <h4><i class="glyphicon glyphicon-stats"></i>
                <b>Отчеты</b>
            </h4>
            <ul class="nav nav-pills nav-stacked">
                <li><a href="/salesreport">Отчет о продажах</a></li>
                <li><a href="#">Отчет о списанном товаре</a></li>

            </ul>
    </nav>

</div>