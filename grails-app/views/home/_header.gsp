<head>
    <asset:stylesheet href="header.css"/>
    <asset:javascript src="mobile.js"/>
</head>
<body>
    <header>
        <div id="panel">
            <div class="mobileContent">
                <g:img class="mobilePhone" dir="images" file="mobile2.png"/>
                <div class="panelText">
                    <p class="panelTitle"><b>Мобильное приложение</b></p>
                    <br>
                    <p class="panelInfo">позволит вам загружать свои маршруты,<br>видеть свою статистику, делиться<br>своими маршрутами с друзьями.</p>
                </div>
                <g:img class="panelApple" dir="images" file="logo_app_store.png"/>
                <button id="panelUp" class="panelUp"><b>Свернуть</b></button>
            </div>
        </div>
        <div class="beforeMenu">
        <menu>
            <g:link controller="home" class="menuA" action="index"><g:img id="logoHead" dir="images" file="logo_main.png"/></g:link>
            <ul id="menuList">
                <li class="menuListItem">
                    <p class="menuText"><g:link controller="home" class="menuA" action="index">О проекте</g:link></p>
                </li>
                <li class="menuListItem">
                    <p class="menuText"><g:link controller="home" class="menuA" action="map">Карта маршрутов</g:link></p>
                </li>
                <sec:ifNotLoggedIn>
                    <li class="menuListItem">
                        <p style="cursor: pointer;" id="pLog" class="menuText">Войти</p>
                    </li>
                </sec:ifNotLoggedIn>
                <li class="menuListItem">
                    <div id="mobile" class="mobile">
                        <p class="mobileMenuText"><a id="mobileA" href="">Мобильное<br>приложение</a></p>
                    </div>
                </li>
            </ul>
        </menu>
        </div>
        <sec:ifLoggedIn>
            <div class="ifLogin">
                <div class="ifLoginBody">
                    <div class="loginText">
                        <p class="loginMenuText">Вы вошли как&nbsp;</p>
                        <p class="name"> <sec:username/> &nbsp;&nbsp;&nbsp;<g:link class="logout" controller='login' action="logout">Выйти</g:link></p>
                    </div>
                </div>
            </div>
        </sec:ifLoggedIn>
    </header>
</body>