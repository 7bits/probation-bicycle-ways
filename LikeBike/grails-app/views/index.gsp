<!DOCTYPE html>
<html>
  <head>
    <title>Velo-Sity</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=visualization"></script>
    <script src="http://yandex.st/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
    <g:javascript src="mapload.js" />
    <style type="text/css">

    @font-face {
      font-family: "Tahoma";
      src: local("Tahoma"), url('${resource(dir: "images", file: "Tahoma.ttf")}');
    }
    body {
      background-color: #ffffff;
      background-image:url('${resource(dir: "images", file: "BG.png")}');  
      margin: 0 auto;
      height: auto;
      width: 1299px;  
    } 
    header {  
      width: 1300px;
      height: 179px;
      margin:0; 
      padding:0;
      background: #42383a;
    }
    #logo {
      margin-left: 230px; 
    }
    #menu {
      width: 1300px;
      height: 55px;
      margin:0; 
      padding:0;
      background: #ede332;
    }
    #nav_menu {  
      margin: 0px auto;  
      padding:0;
      position: relative;
      top: 22px;
      left: 486px;
    }   
    li.nav_button { 
      list-style:none;  
      margin:0;  
      padding:0; 
      float: left;  
    }
    #stat {
      margin-top: -6px;
      margin-left: 47px;
    }
    #statistics_img {
      margin-right: 10px;
    }
    .nav_button a { 
      font: 14px "Tahoma";
      text-decoration: none; 
      color: #000000; 
    }
    #cartoon {
      width: 892px;
      height: 400px;
      margin: 0px auto;
    }
    .cartoon {
      background: #43393b;
      margin: 10px; 
    }
   
    #info{
      width: 872px;
      height: 125px;
      margin-bottom: 10px;
    }
    #instal_app {
      width: 203px;
      height: 180px;
      float: left; 
    }
    #velo_phone{
      width: 203px;
      height: 180px;
      float: left; 
    }
    #phone{
      width: 203px;
      height: 180px;
      float: left; 
    }
    #statistics{
      width: 203px;
      height: 180px;
      float: left; 
    }
    #pocket_route{
      width: 203px;
      height: 180px;
      float: left;
      clear:left; 
    }
    #freand_route{
      width: 203px;
      height: 180px;
      float: left; 
    }
    #tell_us{
      width: 203px;
      height: 180px;
      float: left; 
    }
    #build{
      width: 203px;
      height: 180px;
      float: left; 
    }
    #man_img {
      height: 110px;
      width: 75px;
      position: relative;
      top: -4px;
      left: 9px;
    }
    #empty_phone_img {
      height: 118px;
      width: 77px;
      position: relative;
      top: 0px;
      left: 22px;
    }
    #logo_phone_img {
      width: 48px;
      height: 58px;
      position: relative;
      top: -92px;
      left: 118px;
    }
    #velo_phone_img {
      width: 192px;
      height: 91px;
      position: relative;
      top: 6px;
      left: 3px;
    }
    #phone_img {
      width: 75px;
      height: 116px;
      position: relative;
      top: -14px;
      left: 68px;
    }
    #stat_img {
      width: 187px;
      height: 96px;
      position: relative;
      top: 17px;
      left: 7px;
    }
    #velo2_img {
      width: 120px;
      height: 53px;
      position: relative;
      top: -39px;
      left: 4px;
    }
    #man_phone_img {
      width: 73px;
      height: 132px;
      position: relative;
      top: -36px;
      left: 0px;
    }
    #people_img {
      width: 148px;
      height: 139px;
      position: relative;
      top: -19px;
      left: 51px;
    }
    #velo1_img {
      width: 98px;
      height: 62px;
      position: relative;
      top: 66px;
      left: 11px;
    }
    #man_vk_img {
      width: 110px;
      height: 159px;
      position: relative;
      top: -92px;
      left: 85px;
    }
    #velo3_img {
      width: 105px;
      height: 46px;
      position: relative;
      top: -12px;
      left: 5px;
    }
    #svetofor_img {
      width: 78px;
      height: 120px;
      position: relative;
      top: -10px;
      left: 2px;
    }
    
    .cartoon_text {
      font: 12px "Tahoma";
      text-decoration: none; 
      color: #ffffff; 
      margin-left: 16px;
      margin-top: 7px;
    }

    #map-canvas {
      width:800px; 
      height:600px;
      margin: 20px auto;
      clear: left;
    }

    footer {
      width: 1300px;
      height: 78px;
      margin:0;
      padding:0; 
      background: #43393b;
    }
    #footer_menu {  
      margin: 0px auto;  
      padding:0;
      position: relative;
      top: 22px;
      left: 486px;
    }   
    li.footer_button { 
      list-style:none;  
      margin:0;
      margin-top: 14px;
      margin-right: 80px;  
      padding:0; 
      float: left;  
    }
    #miniLogo {
      float: right;
      position: relative;
      top: 0px;
      left: -225px;
    }
    #vk {
      float: right;
      position: relative;
      top: 24px;
      left: -220px;
    }
    .footer_button a { 
      font: 14px "Tahoma";
      text-decoration: none; 
      color: #ffffff; 
    }
    
    </style>
  </head>
  <body onload="initialize()">

    
    <header>
     <g:img id="logo" dir="images" file="logo.png"/>
  </header>
  <nav id="menu">
      <ul id="nav_menu"> 
        <li class="nav_button"><a href="#">О ПРОЕКТЕ</a></li>  
        <li class="nav_button" id="stat"><a href="#"><g:img id="statistics_img" dir="images" file="statistics.png"/>СТАТИСТИКА</a></li>           
      </ul>
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
  <div id="map-canvas" style="width:800px; height:600px;: #FF0000"></div>
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