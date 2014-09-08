<html>
<head>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'footer.css')}"/>
</head>
<body>
    <footer>
        <div class="onFooter">
            <g:img id="logoFooter" dir="images" file="icon_main-01.png"/>
            %{--<menu_footer>--}%
                <ul id="menuListFooter">
                    <li class="menuListItemFooter">
                        <p class="menuTextFooter"><g:link controller="home" class="menuFooter" action="index">О проекте</g:link></p>
                    </li>
                    <li class="menuListItemFooter">
                        <p class="menuTextFooter"><g:link controller="home" class="menuFooter" action="map">Карта маршрутов</g:link></p>
                    </li>
                </ul>
            %{--</menu_footer>--}%
            %{--<div id="vk"></div>--}%
            <div id="vkLike"></div>
        </div>
    </footer>
</body>