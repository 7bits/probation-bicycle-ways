<header>
<div class="before_menu">
    <menu>
        <p id="logo_text">Велогород</p>
        <g:img id="logo" dir="images" file="logo_header.png"/>
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
                %{--<li class="menu_list_item">--}%
                    %{--<p style="cursor: pointer;" id="p_log" class="menu_text">Войти</p>--}%
                %{--</li>--}%
                <li class="menu_list_item">
                    <p style="cursor: pointer;" id="p_reg" class="menu_text">Регистрация</p>
                </li>
            </sec:ifNotLoggedIn>
            <li class="menu_list_item">
                <div class="mobile">
                    <p class="mobile_menu_text"><a class="mobile_a" href="/">Мобильное<br>приложение</a></p>
                </div>
            </li>
        </ul>
    </menu>

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

<body>
<script type="text/javascript">
    VK.init({
        apiId: ВАШ_API_ID
    });
</script>
</body>