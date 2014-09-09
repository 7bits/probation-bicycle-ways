var rotator = new Rotator();

$( document ).ready(function () {
    $('#pError').css("display","none");
    if( getParameterByName('login_error') == 1 ){
        $("#parentLog").css("display",'block');
        $('#pError').css("display", 'block');
    }
    if( $('#pLog') != null){
        $('#pLog').click ( function () {
            $("#parentLog").css("display", 'block');
        });
    }
    $("#parentLog").click(function (data) {
        var clicked = data.target || data.srcElement;
        if(clicked == $("#parentLog")[0]){
            $("#parentLog")[0].style.display="none";
        }
    });
    
    document.getElementById('pOk').style.display = 'none'
    $('#registerForm').submit(function (e) {
        document.getElementById('loaderBackground').style.display = 'block';
        rotator.start();
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
            url: getUrl() + '/register/register',
            datatype: JSON,
            data: command,
            complete: function (data) {
                document.getElementById('loaderBackground').style.display = 'none';
                rotator.stop();
            },
            success: function (data) {
                if (data.hasError) {
                    document.getElementById('password').value = '';
                    document.getElementById('password2').value = '';

                    if (data.username == 'right') {
                        document.getElementById('usernameError').innerHTML = '';
                    }
                    if (data.email == 'right') {
                        document.getElementById('emailError').innerHTML = '';
                    }
                    if (data.password == 'right') {
                        document.getElementById('passwordError').innerHTML = '';
                    }
                    if (data.password2 == 'right') {
                        document.getElementById('password2Error').innerHTML = '';
                    }


                    if (data.username == 'userNameHold') {
                        document.getElementById('usernameError').innerHTML = 'Данное имя уже ипользуется.';
                    }
                    if (data.username == 'empty') {
                        document.getElementById('usernameError').innerHTML = 'Имя не должно быть пустым';
                    }
                    if (data.email == 'empty') {
                        document.getElementById('emailError').innerHTML = 'email не должен быть пустым';
                    }
                    if (data.email == 'emailNotValide') {
                        document.getElementById('emailError').innerHTML = 'Неверный email.';
                    }
                    if (data.password != 'right') {
                        document.getElementById('passwordError').innerHTML = 'Неверный пароль. Пароль не должен быть короче 8 символов.';
                    }
                    if (data.password2 == 'passwordNotMatch') {
                        document.getElementById('password2Error').innerHTML = 'Пароли не совпадают.';
                    }
                }
                if (!data.hasError) {
                    document.getElementById('username').value = '';
                    document.getElementById('email').value = '';
                    document.getElementById('password').value = '';
                    document.getElementById('password2').value = '';
                    document.getElementById('register_form').style.display = 'none';
                    document.getElementById('pOk').style.display = 'block';
                }

            },
            error: function (jqXHR) {
                data = jQuery.parseJSON(jqXHR.responseText);
                alert("ERROR");
            }
        });
    });
});