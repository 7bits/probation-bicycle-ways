<!DOCTYPE html>
<html>
  <head>
    <title>Velo-Sity</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=visualization"></script>
    <script src="http://yandex.st/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
    <g:javascript src="mapload.js" />
    <link rel="stylesheet" href="${resource(dir:'css', file: 'likebike.css')}" />
  </head>
  <body onload="initialize()">
    <header>
      <g:img id="logo" dir="images" file="logo.png"/>
    </header>
    <nav id="menu">
      <form id="load_file" action="route/loadFile" method="post" target="hiddenframe" enctype="multipart/form-data">
        <input type="file" id="userfile" name="userFile" />
        <input type="submit" name="upload" id="upload" value="Импортировать" />
      </form> 
        <!--<ul id="nav_menu">
        <li class="nav_button"><a href="#">О ПРОЕКТЕ</a></li>  
        <li class="nav_button" id="stat"><a href="#"><g:img id="statistics_img" dir="images" file="statistics.png"/>СТАТИСТИКА</a></li>           
      </ul>-->
    </nav>
    <div id="cartoon">
      <div id="info" class="cartoon">
        <p class="cartoon_text">Основной нашей задачей является донести информацию до Департамента транспорта и развития транспортной инфраструктуры города Омска,
о необходимости начать кампанию по развитию велосипедной инфраструктуры, и самого образа велосипеда как одного из альтернативных
способов передвижения по городу. Городу нужны велодорожки. <br /><br />
На сегодняшний день велосипедисты могут воспользоваться услугами нашего сайта, который объединяет единомышленников-любителей 
велосипеда. На нем можно найти различные вело маршруты, которые модераторы и активисты сообществ предлагают пользователям.
Используйте наше приложение, для того чтобы загрузить свой маршрут. Поддержите нашу идею – построим велодорожки в Омске вместе!</p>
      </div>
      <div id="instal_app" class="cartoon">
        <p class="cartoon_text">Установи приложение <br />в смартфон и запусти его.</p>
        <g:img id="man_img" dir="images" file="man.png"/>
        <g:img id="empty_phone_img" dir="images" file="empty_phone.png"/>
        <g:img id="logo_phone_img" dir="images" file="mini_logo.png"/>
      </div>
      <div id="velo_phone" class="cartoon">
        <p class="cartoon_text">Двигайся по маршрту, <br />приложение запишет его <br />и отобразит на карте.</p>
        <g:img id="velo_phone_img" dir="images" file="velo_phone.png"/>
      </div>
      <div id="phone" class="cartoon">
        <p class="cartoon_text">На карте фиксируются <br />наиболее «активные» участки дороги.</p>
        <g:img id="phone_img" dir="images" file="phone.png"/>
      </div>
      <div id="statistics" class="cartoon">
        <p class="cartoon_text">Получаем статистические <br />данные вело движения.</p>
        <g:img id="stat_img" dir="images" file="stat.png"/>
      </div>
      <div id="pocket_route" class="cartoon">
        <p class="cartoon_text">Приложение Velo City - это <br />все вело маршруты <br />у тебя в кармане.</p>
        <g:img id="velo2_img" dir="images" file="velo2.png"/>
        <g:img id="man_phone_img" dir="images" file="man_phone.png"/>
      </div>
      <div id="freand_route" class="cartoon">
        <p class="cartoon_text">Просматривай маршруты <br />друзей.</p>
        <g:img id="people_img" dir="images" file="people.png"/>
      </div>
      <div id="tell_us" class="cartoon">
        <p class="cartoon_text">Расскажи о нас!</p>
        <g:img id="velo1_img" dir="images" file="velo1.png"/>
        <g:img id="man_vk_img" dir="images" file="man_vk.png"/>
      </div>
      <div id="build" class="cartoon">
        <p class="cartoon_text">Построй вело дорожки вместе <br />с нами!</p>
        <g:img id="velo3_img" dir="images" file="velo3.png"/>
        <g:img id="svetofor_img" dir="images" file="svetofor.png"/>
      </div>
    </div>
    <div id="map-canvas"></div>
    <footer>
      <ul id="footer_menu"> 
        <li class="footer_button"><a href="#">О НАС</a></li>  
        <li class="footer_button"><a href="#">ПРИЛОЖЕНИЕ</a></li>           
      </ul>
      <g:img id="vk" dir="images" file="vk_logo.png"/>
      <g:img id="miniLogo" dir="images" file="mini_logo.png"/>
    </footer>
  </body>
</html>