<!DOCTYPE html>
<html>
<head>
    <title>Velo-Sity</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    %{--<script src="http://yandex.st/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>--}%
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'likebike.css')}"/>
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <g:javascript src="carousel.js"/>
</head>

<body>
<g:render template="/home/header"/>
<g:render template="/home/register"/>
<g:render template="/home/login"/>

<div id="myCarousel" class="carousel slide">
    <!-- Carousel indicators -->
    <g:img class="title" dir="images" file="title.png"/>
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>
    <!-- Carousel items -->
    <div class="carousel-inner">
        <div class="item active">
            <g:img dir="images" file="s1.png"/>
        </div>
        <div class="item">
            <g:img dir="images" file="s2.png"/>
        </div>
        <div class="item">
            <g:img dir="images" file="s3.png"/>
        </div>
        <div class="item">
            <g:img dir="images" file="s4.png"/>
        </div>
    </div>
    <!-- Carousel nav -->
    %{--<a class="carousel-control left" href="#myCarousel"--}%
       %{--data-slide="prev">&lsaquo;</a>--}%
    %{--<a class="carousel-control right" href="#myCarousel"--}%
       %{--data-slide="next">&rsaquo;</a>--}%
</div>

<div id="info"><br><br>
    <h1 id="h_text">О ПРОЕКТЕ</h1><br>

    <p id="main_text">
        Велодорожки для города может построить Департамент транспорта<br> и развития транспортной инфраструктуры, но для этого нужно знать,<br>
        где проходят основные веломаршруты.<br><br> В этом может помочь любой велосипедист. Для этого нужно установить<br> на телефон приложение, которое
        ежедневно будет отслеживать ваш веломаршрут.<br> Так нам станет понятно, где омичи любят кататься больше всего.<br><br>
        Собрав необходимые данные, мы предложим готовый проект специалистам<br> из Департамента, и велодорожки появятся в самых
        нужных и удобных местах Омска.<br><br>
    </p>
    <p id="idea">
        Поддержи нашу идею - построим велодорожки вместе!
    </p><br><br>

</div>

<div id="cartoon">
    <p id="this_work"><br>КАК ЭТО РАБОТАЕТ</p><br>
    <ul id="cartoon_ul_image">
        <li class="cartoon_li_image1">
            <g:img id="cartoon_one_img" class="cartoon_img" dir="images" file="mobile.png"/>
        </li>
        <li class="cartoon_li_image2">
            <g:img id="cartoon_second_img" class="cartoon_img" dir="images" file="bike.png"/>
        </li>
        <li class="cartoon_li_image3">
            <g:img id="cartoon_third_img" class="cartoon_img" dir="images" file="notebook.png"/>
        </li>
        <li class="cartoon_li_image4">
            <g:img id="cartoon_fourth_img" class="cartoon_img" dir="images" file="building.png"/>
        </li>

    </ul>
    <g:img id="line" class="line_img" dir="images" file="line.png"/>

    <ul id="cartoon_ul_text">
        <li class="cartoon_li_text1">
            <p class="cartoon_p">Запусти приложение</p>
        </li>
        <li class="cartoon_li_text2">
            <p class="cartoon_p">Прокатись<br> на велосипеде</p>
        </li>
        <li class="cartoon_li_text3">
            <p class="cartoon_p">Загрузи<br> свои треки на карту</p>
        </li>
        <li class="cartoon_li_text4">
            <p id="cartoon_fourth_p" class="cartoon_p">Поддержи наш проект</p>
        </li>

    </ul>

</div>

<g:render template="/home/footer"/>
</body>
</html>