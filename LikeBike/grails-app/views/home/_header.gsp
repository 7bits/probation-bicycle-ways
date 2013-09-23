<!DOCTYPE html>
<html>
<head>
    <title>Velo-Sity</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'header.css')}"/>
</head>

<body>

<header>
    <g:img id="razmetka" dir="images" file="razmetka.png"/>
    <g:img id="logo" dir="images" file="logo.png"/>
    <p id="label_download_app">Скачать приложение:</p>
    <a href="#"><g:img id="button_android_link" dir="images" file="android.png"/></a>
    <a href="#"><g:img id="button_app_store_link" dir="images" file="appStore.png"/></a>
</header>

<menu>
    <ul id="menu_list">
        <li class="menu_list_item">
            <p class="menu_text">О ПРОЕКТЕ</p>
        </li>
        <li class="menu_list_item">
            <p class="menu_text"><a class="menu_a" href="map">КАРТА МАРШРУТОВ</a></p>
        </li>
        <li class="menu_list_item">
            <p style="cursor: pointer;" id="p_reg">РЕГИСТРАЦИЯ</p>
        </li>

        <li class="menu_list_item">
            <sec:ifLoggedIn>
                Вы зашли как <sec:username/> (<g:link controller='logout'>Выйти</g:link>)
            </sec:ifLoggedIn>
            <sec:ifNotLoggedIn>
                <p style="cursor: pointer;" id="p_log" class="menu_text">ВХОД</p>
            </sec:ifNotLoggedIn>
        </li>
    </ul>
</menu>
</body>