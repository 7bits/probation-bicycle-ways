<!DOCTYPE html>
<html>
  <head>
    <title>Примеры. Построение маршрута</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="//api-maps.yandex.ru/2.0/?load=package.standard,package.geoObjects&lang=ru-RU" type="text/javascript"></script>
    <script src="http://yandex.st/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
    <g:javascript src="mapload.js" />
    <g:javascript src="heatMap/heatmap.js" />
    <style type="text/css">

    @font-face {
      font-family: "Tahoma";
      src: local("Tahoma"), url('${resource(dir: "images", file: "Tahoma.ttf")}');
    }
    #heatmapArea {
      position:relative;
      float:left;
      width:600px;
      height:400px;
      background-image:url(http://www.patrick-wied.at/static/heatmapjs/demo/realtime_heatmap/graphic.png);
      border:1px dashed black;
    }
    #canvasMap {
      width: 800px;
      height: 600px;
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
      background: rgb(139,138,138); /* Old browsers */
      background: -moz-linear-gradient(left, rgba(139,138,138,1) 0%, rgba(139,138,138,1) 100%); /* FF3.6+ */
      background: -webkit-gradient(linear, left top, right top, color-stop(0%,rgba(139,138,138,1)), color-stop(100%,rgba(139,138,138,1))); /* Chrome,Safari4+ */
      background: -webkit-linear-gradient(left, rgba(139,138,138,1) 0%,rgba(139,138,138,1) 100%); /* Chrome10+,Safari5.1+ */
      background: -o-linear-gradient(left, rgba(139,138,138,1) 0%,rgba(139,138,138,1) 100%); /* Opera 11.10+ */
      background: -ms-linear-gradient(left, rgba(139,138,138,1) 0%,rgba(139,138,138,1) 100%); /* IE10+ */
      background: linear-gradient(to right, rgba(139,138,138,1) 0%,rgba(139,138,138,1) 100%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#8b8a8a', endColorstr='#8b8a8a',GradientType=1 ); /* IE6-9 */  
    }
    #logo {
      margin-left: 230px; 
    }
    #menu {
      width: 1300px;
      height: 55px;
      margin:0; 
      padding:0;
      background: -moz-linear-gradient(left, rgba(241,203,50,1) 0%, rgba(241,203,50,1) 100%); /* FF3.6+ */
      background: -webkit-gradient(linear, left top, right top, color-stop(0%,rgba(241,203,50,1)), color-stop(100%,rgba(241,203,50,1))); /* Chrome,Safari4+ */
      background: -webkit-linear-gradient(left, rgba(241,203,50,1) 0%,rgba(241,203,50,1) 100%); /* Chrome10+,Safari5.1+ */
      background: -o-linear-gradient(left, rgba(241,203,50,1) 0%,rgba(241,203,50,1) 100%); /* Opera 11.10+ */
      background: -ms-linear-gradient(left, rgba(241,203,50,1) 0%,rgba(241,203,50,1) 100%); /* IE10+ */
      background: linear-gradient(to right, rgba(241,203,50,1) 0%,rgba(241,203,50,1) 100%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f1cb32', endColorstr='#f1cb32',GradientType=1 ); /* IE6-9 */
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
    #statistics {
      margin-right: 10px;
    }
    .nav_button a { 
      font: 14px "Tahoma";
      text-decoration: none; 
      color: #000000; 
    }
    #map {
      width:800px; 
      height:600px;
      margin: 20px auto;
    }

    footer {
      width: 1300px;
      height: 78px;
      margin:0;
      padding:0; 
      background: rgb(74,71,70); /* Old browsers */
      background: -moz-linear-gradient(left, rgba(74,71,70,1) 0%, rgba(80,77,74,1) 21%, rgba(82,79,74,1) 49%, rgba(78,75,68,1) 74%, rgba(69,67,59,1) 100%); /* FF3.6+ */
      background: -webkit-gradient(linear, left top, right top, color-stop(0%,rgba(74,71,70,1)), color-stop(21%,rgba(80,77,74,1)), color-stop(49%,rgba(82,79,74,1)), color-stop(74%,rgba(78,75,68,1)), color-stop(100%,rgba(69,67,59,1))); /* Chrome,Safari4+ */
      background: -webkit-linear-gradient(left, rgba(74,71,70,1) 0%,rgba(80,77,74,1) 21%,rgba(82,79,74,1) 49%,rgba(78,75,68,1) 74%,rgba(69,67,59,1) 100%); /* Chrome10+,Safari5.1+ */
      background: -o-linear-gradient(left, rgba(74,71,70,1) 0%,rgba(80,77,74,1) 21%,rgba(82,79,74,1) 49%,rgba(78,75,68,1) 74%,rgba(69,67,59,1) 100%); /* Opera 11.10+ */
      background: -ms-linear-gradient(left, rgba(74,71,70,1) 0%,rgba(80,77,74,1) 21%,rgba(82,79,74,1) 49%,rgba(78,75,68,1) 74%,rgba(69,67,59,1) 100%); /* IE10+ */
      background: linear-gradient(to right, rgba(74,71,70,1) 0%,rgba(80,77,74,1) 21%,rgba(82,79,74,1) 49%,rgba(78,75,68,1) 74%,rgba(69,67,59,1) 100%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#4a4746', endColorstr='#45433b',GradientType=1 ); /* IE6-9 */
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
  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link type="text/css" href="${createLinkTo(dir:'css',file:'likebike.css')}" />
    <g:javascript src="/heatMap/heatmap.js" />
    <link rel="shortcut icon" type="image/png" href="http://www.patrick-wied.at/img/favicon.png" />
  </head>
  <body>
	<header>
     <g:img id="logo" dir="images" file="logo.png"/>
  </header>
  <nav id="menu">
      <ul id="nav_menu"> 
        <li class="nav_button"><a href="#">О ПРОЕКТЕ</a></li>  

        <li class="nav_button" id="stat"><a href="#"><g:img id="statistics" dir="images" file="statistics.png"/>СТАТИСТИКА</a></li>           
      </ul>
  </nav>
	<div id="map"></div>
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