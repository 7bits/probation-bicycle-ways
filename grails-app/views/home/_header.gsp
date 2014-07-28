<!DOCTYPE html>
<html>
<head>
    <title>Velo-Sity</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'header.css')}"/>

    <script type="text/javascript" src="js/vk_logout.js"></script>
    <script type="text/javascript" src="//vk.com/js/api/openapi.js?115"></script>
    <script type="text/javascript"> VK.init({apiId: 1, onlyWidgets: true});</script>
    <g:javascript src="vk_auth.js"/>
    %{--<g:javascript src="vk_like.js"/>--}%
    <script type="text/javascript">  VK.init({apiId: 1}); </script>

</head>

<body>

<div id="before_menu"></div>
<header>
    <div id="on_header">
        <p id="hi"></p>
        <div id="logo"><g:img dir="images" file="logo.png"/></div>

        <div id="download_app">
            <p id="label_download_app">Скачать приложение:</p>
            <a href="#"><g:img id="button_android_link" dir="images" file="android.png"/></a>
            <a href="#"><g:img id="button_app_store_link" dir="images" file="appStore.png"/></a>
        </div>


        <div id="vk_auth"></div>
        %{--<div id="vk_like"></div>--}%

    </div>


    %{--<div id="vk_like"></div>--}%
    %{--<script type="text/javascript">--}%
    %{--VK.Widgets.Like("vk_like", {type: "button"});--}%
    %{--</script>--}%


</header>

<menu>
    <ul id="menu_list">
        <li class="menu_list_item">
            <p class="menu_text"><a class="menu_a" href="/">О ПРОЕКТЕ</a></p>
        </li>
        <li class="menu_list_item">
            <p class="menu_text"><a class="menu_a" href="map">КАРТА МАРШРУТОВ</a></p>
        </li>
        <sec:ifLoggedIn>
            <li class="menu_list_item">
                <p style="cursor: pointer;" class="menu_text">Вы зашли как <sec:username/> (<g:link
                        controller='logout'>Выйти</g:link>)</p>
            </li>
        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn>
            <li class="menu_list_item">
                <p style="cursor: pointer;" id="p_reg" class="menu_text">РЕГИСТРАЦИЯ</p>
            </li>
            <li class="menu_list_item">
                <p style="cursor: pointer;" id="p_log" class="menu_text">ВХОД</p>
            </li>
        </sec:ifNotLoggedIn>
    </ul>
</menu>
<span id="after"></span>



</body>