<!DOCTYPE html>
<html>
<head>
    <title>Velo-Sity</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=latin,cyrillic-ext' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'header.css')}"/>
    <script type="text/javascript" src="js/vk_logout.js"></script>
    <script type="text/javascript" src="//vk.com/js/api/openapi.js?115"></script>
    <script type="text/javascript"> VK.init({apiId: 4479951, onlyWidgets: true});</script>
    %{--<g:javascript src="vk_auth.js"/>--}%
    %{--<g:javascript src="vk.js"/>--}%
    <g:javascript src="vk_like.js"/>
    <link href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

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
                <p class="menu_text"><a class="menu_a" href="/">О проекте</a></p>
            </li>
            <li class="menu_list_item">
                <p class="menu_text"><a class="menu_a" href="map">Карта маршрутов</a></p>
            </li>
            <li class="menu_list_item">
                <p style="cursor: pointer;" id="p_log" class="menu_text">Войти</p>
            </li>
            <li class="menu_list_item">
                <div id="mobile">
                    <p class="mobile_menu_text"><a class="mobile_a" href="/">Мобильное<br>приложение</a></p>
                </div>
            </li>
        </ul>
    </menu>

%{--<span id="after"></span>--}%

    <sec:ifLoggedIn>
        <div class="if_login">
            <div class="login_text">
                <p class="login_menu_text">Вы вошли как&nbsp;</p>
                <p class="name"> <sec:username/> &nbsp;&nbsp;&nbsp;<g:link class="logout" controller='logout'>Выйти</g:link></p>
            </div>
        </div>
    </sec:ifLoggedIn>

</body>