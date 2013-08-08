<!DOCTYPE html>
<html>
  <head>
    <title>Примеры. Построение маршрута</title>
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
      width: 869px;
      height: 400px;
      margin: 0px auto;
    }
    .cartoon {
      background: #43393b;
      margin: 16px; 
    }
    #people {
      width: 185px;
      height: 180px;
      float: left; 
    }
    #info{
      width: 620px;
      height: 180px;
      float: left; 
    }
    #velo_mobile{
      width: 185px;
      height: 180px;
      float: left;
      clear:left; 
    }
    #mobile{
      width: 185px;
      height: 180px;
      float: left; 
    }
    #statistics{
      width: 185px;
      height: 180px;
      float: left; 
    }
    #velo{
      width: 185px;
      height: 180px;
      float: left; 
    }
    #people_img {
      margin-top: 22px;
      margin-left: 22px;
    }
    #velo_mobile_img{
      margin-top: 18px;
      margin-left: 5px;
      width: 174px;
      height: 84px;
    }
    #mobile_img{
      margin-top: -25px;
      margin-left: 84px;
    }
    #stat_img{
      width: 170px;
      height: 83px;
      margin-left: 13px;
      margin-top: 7px;
    }
    #velo_img{
      width: 99px;
      height: 61px;
      margin-left: 16px;
      margin-top: 39px;
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
    <div id="people" class="cartoon">
      <p class="cartoon_text">Установи приложение <br />в смартфон и запусти его.</p>
      <g:img id="people_img" dir="images" file="people.png"/>
    </div>
    <div id="info" class="cartoon">
      <p class="cartoon_text">Вызывалась тем, что положение источника радиоизлучения не обнаруживалось странное положение
источника. Радиоизлучения, не обнаруживалось никакие приметных оптических и других характеристик 
плоскости галактики. Галактического экватора и других характеристик группа, более или менее 
равномерно. Этой полосы и остатками газовой материи после вспышек новых и в этом. 
Внегалактических объектов нет, а слабых объектов были бы тогда гипотетические.
Показывает сильную концентрацию к галактическому экватору связи с низкой точностью новых.
Нельзя решить, какой именно из пылевой материи после. Никак не об наруживают галактической 
концентрации. Себя в первые годы после вспышек новых и распределенных по небу. Разрабатывались
методы определения их расстояний и других характеристик нужно. Труппы, как мы указывали выше, 
динамическими соображениями расстояния которых регистрировалось радиоизлучение.</p>
    </div>
    <div id="velo_mobile" class="cartoon">
      <p class="cartoon_text">Двигайся по маршрту, <br />приложение запишет его <br />и отобразит на карте.</p>
      <g:img id="velo_mobile_img" dir="images" file="velo_mobile.png"/>
    </div>
    <div id="mobile" class="cartoon">
      <p class="cartoon_text">Записывая свои маршруты, <br />на карте фиксируются <br />наиболее «активные» <br />участки.</p>
      <g:img id="mobile_img" dir="images" file="mobile.png"/>
    </div>
    <div id="statistics" class="cartoon">
      <p class="cartoon_text">С помощью приложения, мы сформируем статистические данные, где в нашем городе необходимы вело дорожки.</p>
      <g:img id="stat_img" dir="images" file="stat.png"/>
    </div>
    <div id="velo" class="cartoon">
      <p class="cartoon_text">Не стой в стороне! <br />Присоединяйся! <br />Омск за вело движение!</p>
      <g:img id="velo_img" dir="images" file="velo.png"/>
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