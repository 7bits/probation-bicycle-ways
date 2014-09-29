<g:applyLayout name="main">
    <head>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'index.css')}"/>
        <g:javascript src="carousel.js"/>
    </head>

    <body>
    <div class="carousel_body">
        <div id="myCarousel" class="carousel slide">
            <!-- Carousel indicators -->
            <g:img class="title" dir="images" file="1-01.png"/>
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
            </ol>
            <!-- Carousel items -->
            <div class="carousel-inner">
                <div class="item active">
                    <div class="carouselItem carouselItem1"></div>
                </div>
                <div class="item">
                    <div class="carouselItem carouselItem2"></div>
                </div>
                <div class="item">
                    <div class="carouselItem carouselItem3"></div>
                </div>
                <div class="item">
                    <div class="carouselItem carouselItem4"></div>
                </div>
            </div>
        </div>
    </div>

        <div class="info"><br><br>
            <div class="infoText">
                <h1 id="hText">О ПРОЕКТЕ</h1><br>

                <p id="mainText">
                    Велодорожки для города может построить Департамент транспорта<br> и развития транспортной инфраструктуры, но для этого нужно знать,<br>
                    где проходят основные веломаршруты.<br><br> В этом может помочь любой велосипедист. Для этого нужно установить<br> на телефон приложение, которое
                    ежедневно будет отслеживать ваш веломаршрут.<br> Так нам станет понятно, где омичи любят кататься больше всего.<br><br>
                    Собрав необходимые данные, мы предложим готовый проект специалистам<br> из Департамента, и велодорожки появятся в самых
                    нужных и удобных местах Омска.<br><br>
                </p>
                <p id="idea">
                    <b>Поддержи нашу идею — построим велодорожки вместе!</b>
                </p><br><br>
            </div>

        </div>

        <div class="cartoon">
            <div class="cartoonInfo">
                <p id="thisWork"><br>КАК ЭТО РАБОТАЕТ</p><br>
                <ul id="cartoonUlImage">
                    <li class="cartoonLiImage1">
                        <g:img id="cartoonOneImg" class="cartoonImg" dir="images" file="mobile.png"/>
                    </li>
                    <li class="cartoonLiImage2">
                        <g:img id="cartoonSecondImg" class="cartoonImg" dir="images" file="bike.png"/>
                    </li>
                    <li class="cartoonLiImage3">
                        <g:img id="cartoonThirdImg" class="cartoonImg" dir="images" file="notebook.png"/>
                    </li>
                    <li class="cartoonLiImage4">
                        <g:img id="cartoonFourthImg" class="cartoonImg" dir="images" file="maps.png"/>
                    </li>
                </ul>

                <g:img id="line" class="lineImg" dir="images" file="line.png"/>

                <ul id="cartoonUlText">
                    <li class="cartoonLiText1">
                        <p class="cartoonP">Запусти приложение</p>
                    </li>
                    <li class="cartoonLiText2">
                        <p class="cartoonP">Прокатись<br> на велосипеде</p>
                    </li>
                    <li class="cartoonLiText3">
                        <p class="cartoonP">Загрузи<br> свои треки на карту</p>
                    </li>
                    <li class="cartoonLiText4">
                        <p id="cartoonFourthP" class="cartoonP">Поддержи наш проект</p>
                    </li>
                </ul>
            </div>
        </div>
    </body>
</g:applyLayout>