<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<br><br>
            <nav class="navbar navbar-expand-lg navbar-light bg-light well">

                <div class="navbar-header">
                    <!-- Бренд или название сайта -->
<h2>                        <i class="glyphicon glyphicon-grain"></i>
                            <large><b>${formName}</b></large></h2>

                    <%--<p class="navbar-text">Система учета товаров и продаж</p>--%>

                </div>
                <!-- Основная часть меню (ссылки, формы и другие элементы) -->
                <div class="collapse navbar-collapse" id="navbar-main">


                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="#"><sec:authentication property="principal.username" /><%=request.getUserPrincipal().getName()%></a></li>
                        <li class="active"><a href="/logout">Выход</a></li>
                        <li role="separator" class="divider"></li>
                        <li class="active"></li>

                    </ul>
                    <!-- Содержимое основной части -->
                </div>
            </nav>