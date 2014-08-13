

        %{--<div id="vk_auth"></div>--}%

<header>
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
</header>