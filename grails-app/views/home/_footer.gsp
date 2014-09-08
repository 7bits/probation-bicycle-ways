<html>
<head>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'footer.css')}"/>
</head>
<body>
    <footer>
        <div class="on_footer">
            <g:img id="logo_footer" dir="images" file="icon_main-01.png"/>
            %{--<menu_footer>--}%
                <ul id="menu_list_footer">
                    <li class="menu_list_item_footer">
                        <p class="menu_text_footer"><g:link controller="home" class="menu_a_footer" action="index">О проекте</g:link></p>
                    </li>
                    <li class="menu_list_item"_footer>
                        <p class="menu_text_footer"><g:link controller="home" class="menu_a_footer" action="map">Карта маршрутов</g:link></p>
                    </li>
                </ul>
            %{--</menu_footer>--}%
            %{--<div id="vk"></div>--}%
            <div id="vk_like"></div>
        </div>
    </footer>
</body>