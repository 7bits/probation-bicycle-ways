<html>
    <head>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'header.css')}"/>
    </head>
    <body>
        <header>
            <div id="panel">
                <div class="mobile_content">
                    <g:img class="mobile_phone" dir="images" file="mobile2.png"/>
                    <div class="panel_text">
                        <p class="panel_title"><b>Мобильное приложение</b></p>
                        <br>
                        <p class="panel_info">позволит вам загружать свои маршруты,<br>видеть свою статистику, делиться<br>своими маршрутами с друзьями.</p>
                    </div>
                    <g:img class="panel_apple" dir="images" file="logo_app_store.png"/>
                    <button id="panelUp" class="panelUp"><b>Свернуть</b></button>
                </div>
            </div>
            <div class="before_menu">
            <menu>
                %{--<p id="logo_text">Велогород</p>--}%
                <g:link controller="home" class="menu_a" action="index"><g:img id="logo_head" dir="images" file="logo_main.png"/></g:link>
                <ul id="menu_list">
                    <li class="menu_list_item">
                        <p class="menu_text"><g:link controller="home" class="menu_a" action="index">О проекте</g:link></p>
                    </li>
                    <li class="menu_list_item">
                        <p class="menu_text"><g:link controller="home" class="menu_a" action="map">Карта маршрутов</g:link></p>
                    </li>
                    <sec:ifNotLoggedIn>
                        <li class="menu_list_item">
                            <p style="cursor: pointer;" id="p_log" class="menu_text">Войти</p>
                        </li>
                    </sec:ifNotLoggedIn>
                    <li class="menu_list_item">
                        <div id="mobile" class="mobile">
                            <p class="mobile_menu_text"><a id="mobile_a" href="">Мобильное<br>приложение</a></p>
                        </div>
                    </li>
                </ul>
            </menu>
            </div>

        %{--<span id="after"></span>--}%
            <sec:ifLoggedIn>
                <div class="if_login">
                    <div class="if_login_body">
                        <div class="login_text">
                            <p class="login_menu_text">Вы вошли как&nbsp;</p>
                            <p class="name"> <sec:username/> &nbsp;&nbsp;&nbsp;<g:link class="logout" controller='logout'>Выйти</g:link></p>
                        </div>
                    </div>
                </div>
            </sec:ifLoggedIn>
        </header>
    </body>
</html>