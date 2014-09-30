<html>
<head>
    <asset:stylesheet href="footer.css"/>
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
            <div id="vkLike"></div>
        </div>
        <div class="yandexMetrika">
            <!-- Yandex.Metrika informer -->
            <a href="https://metrika.yandex.ru/stat/?id=26394696&amp;from=informer"
               target="_blank" rel="nofollow"><img src="//bs.yandex.ru/informer/26394696/3_1_FFFFFFFF_EFEFEFFF_0_pageviews"
                                                   style="width:88px; height:31px; border:0;" alt="Яндекс.Метрика" title="Яндекс.Метрика: данные за сегодня (просмотры, визиты и уникальные посетители)" onclick="try{Ya.Metrika.informer({i:this,id:26394696,lang:'ru'});return false}catch(e){}"/></a>
            <!-- /Yandex.Metrika informer -->

            <!-- Yandex.Metrika counter -->
            <script type="text/javascript">
                (function (d, w, c) {
                    (w[c] = w[c] || []).push(function() {
                        try {
                            w.yaCounter26394696 = new Ya.Metrika({id:26394696,
                                webvisor:true,
                                clickmap:true,
                                trackLinks:true,
                                accurateTrackBounce:true});
                        } catch(e) { }
                    });

                    var n = d.getElementsByTagName("script")[0],
                            s = d.createElement("script"),
                            f = function () { n.parentNode.insertBefore(s, n); };
                    s.type = "text/javascript";
                    s.async = true;
                    s.src = (d.location.protocol == "https:" ? "https:" : "http:") + "//mc.yandex.ru/metrika/watch.js";

                    if (w.opera == "[object Opera]") {
                        d.addEventListener("DOMContentLoaded", f, false);
                    } else { f(); }
                })(document, window, "yandex_metrika_callbacks");
            </script>
            <noscript><div><img src="//mc.yandex.ru/watch/26394696" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
            <!-- /Yandex.Metrika counter -->
        </div>
    </footer>
</body>