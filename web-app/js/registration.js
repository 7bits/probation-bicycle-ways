function theRotator() {
    $('div#rotator ul li').css({opacity: 0.0});
    $('div#rotator ul li:first').css({opacity: 1.0});
    setInterval('rotate()',375);
}

function rotate() {
    var current = ($('div#rotator ul li.show')?  $('div#rotator ul li.show') : $('div#rotator ul li:first'));
    var next = ((current.next().length) ? ((current.next().hasClass('show')) ? $('div#rotator ul li:first') :current.next()) : $('div#rotator ul li:first'));
    next.css({opacity: 0.0})
        .addClass('show')
        .animate({opacity: 1.0}, 125);
    current.animate({opacity: 0.0}, 125)
        .removeClass('show');
};


$('document').ready(function () {
    document.getElementById('p_ok').style.display = 'none'

    document.getElementById('close_reg').onclick = function () {
        //document.getElementById('reg').style.hight = '660px';
        document.getElementById('parent_reg').style.display = 'none';
    }
    if (document.getElementById('p_reg') != null) {
        document.getElementById('p_reg').onclick = function () {
            /*var spinner = new Spinner({
                lines: 7, // количество линий для отрисовки
                length: 6, // длина каждой линии
                width: 3, // толщина линий
                radius: 4, // радиус внутреннего круга
                color: '#000', // #rbg или #rrggbb
                speed: 1, // кругов в секунду
                trail: 100, // процент послесвечения
                shadow: true // отрисовка тени
            }).spin(document.getElementById("reg_submit")); // Положить в нод DOM "ajaxContentHolder"
            */
            document.getElementById('p_ok').style.display = 'none';
            document.getElementById('parent_reg').style.display = 'block';
            document.getElementById('register_form').style.display = 'block';
        }
    }

    $('#register_form').submit(function (e) {
        document.getElementById('loader_background').style.display = 'block';
        theRotator();
        e.preventDefault();
        var command = {
            username: $('#username').val(),
            email: $('#email').val(),
            password: $('#password').val(),
            password2: $('#password2').val()
        }
        data = {
            command: command
        }
        $.ajax({
            type: 'POST',
            url: 'register/register',
            datatype: JSON,
            data: command,
            success: function (data) {
                document.getElementById('loader_background').style.display = 'none';
                if (data.hasError) {
                    document.getElementById('password').value = '';
                    document.getElementById('password2').value = '';

                    if (data.username == 'right') {
                        document.getElementById('username_error').innerHTML = '';
                    }
                    if (data.email == 'right') {
                        document.getElementById('email_error').innerHTML = '';
                    }
                    if (data.password == 'right') {
                        document.getElementById('password_error').innerHTML = '';
                    }
                    if (data.password2 == 'right') {
                        document.getElementById('password2_error').innerHTML = '';
                    }


                    if (data.username == 'userNameHold') {
                        document.getElementById('username_error').innerHTML = 'Данное имя уже ипользуется';
                    }
                    if (data.username == 'empty') {
                        document.getElementById('username_error').innerHTML = 'Имя не должно быть пустым';
                    }
                    if (data.email == 'empty') {
                        document.getElementById('email_error').innerHTML = 'email не должен быть пустым';
                    }
                    if (data.email == 'emailNotValide') {
                        document.getElementById('email_error').innerHTML = 'Неверный email';
                    }
                    if (data.password != 'right') {
                        document.getElementById('password_error').innerHTML = 'Неверный пароль. Пароль не должен быть короче 8 символов';
                    }
                    if (data.password2 == 'passwordNotMatch') {
                        document.getElementById('password2_error').innerHTML = 'Пароли не совпадают';
                    }
                }
                if (!data.hasError) {
                    document.getElementById('username').value = '';
                    document.getElementById('email').value = '';
                    document.getElementById('password').value = '';
                    document.getElementById('password2').value = '';
                    document.getElementById('register_form').style.display = 'none';
                    document.getElementById('p_ok').style.display = 'block';
                }

            },
            error: function (jqXHR) {
                data = jQuery.parseJSON(jqXHR.responseText);
                alert("ERROR");
            }
        });
    });
});