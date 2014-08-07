<!DOCTYPE html>
<html>
<head>
    <title>Velo-Sity</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'header.css')}"/>

    <script type="text/javascript" src="js/vk_logout.js"></script>
    <script type="text/javascript" src="//vk.com/js/api/openapi.js?115"></script>
    <script type="text/javascript"> VK.init({apiId: 4479951, onlyWidgets: true});</script>
    %{--<g:javascript src="vk_auth.js"/>--}%
    %{--<g:javascript src="vk.js"/>--}%
    <g:javascript src="vk_like.js"/>

</head>

<body>
<header>
        %{--<div id="vk_auth"></div>--}%
</header>

<div class="before_menu">
<menu>
    <p id="logo_text">Велогород</p>
    <g:img id="logo" dir="images" file="logo_header.png"/>
    <ul id="menu_list">
        <li class="menu_list_item">
            <p class="menu_text"><a class="menu_a" href="/">О ПРОЕКТЕ</a></p>
        </li>
        <li class="menu_list_item">
            <p class="menu_text"><a class="menu_a" href="map">КАРТА МАРШРУТОВ</a></p>
        </li>
        <li class="menu_list_item">
            %{--<p class="menu_text"><a class="menu_a" href="loginPage">ВОЙТИ</a></p>--}%
            <p class="menu_text"><a class="menu_a" href="login">ВОЙТИ</a></p>
        </li>
        <sec:ifLoggedIn>
            <li class="menu_list_item">
                <p style="cursor: pointer;" class="menu_text">Вы зашли как <sec:username/> (<g:link
                        controller='logout'>Выйти</g:link>)</p>
            </li>
        </sec:ifLoggedIn>
        %{--<sec:ifNotLoggedIn>--}%
            %{--<li class="menu_list_item">--}%
                %{--<p style="cursor: pointer;" id="p_log" class="menu_text">ВОЙТИ</p>--}%
            %{--</li>--}%
        %{--</sec:ifNotLoggedIn>--}%
        <li class="menu_list_item">
            <div id="mobile">
                <p class="menu_text"><a class="mobile_a" href="/">МОБИЛЬНОЕ<br>ПРИЛОЖЕНИЕ</a></p>
            </div>
        </li>
    </ul>
</menu>
</div>
%{--<span id="after"></span>--}%

</body>