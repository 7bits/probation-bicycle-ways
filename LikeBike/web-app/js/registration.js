$('document').ready(function () {
    document.getElementById('p_ok').style.display = 'none'

    document.getElementById('close_reg').onclick = function () {
        //document.getElementById('reg').style.hight = '660px';
        document.getElementById('parent_reg').style.display = 'none';
    }
    document.getElementById('p_reg').onclick = function () {
        document.getElementById('p_ok').style.display = 'none';
        document.getElementById('parent_reg').style.display = 'block';
        document.getElementById('register_form').style.display = 'block';
    }

    $('#register_form').submit(function(e){
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
            type : 'POST',
            url : 'register/register',
            datatype: JSON,
            data : command,
            success: function(data){
                if(data.hasError) {
                    document.getElementById('password').value = '';
                    document.getElementById('password2').value = '';

                    if(data.username == 'right') {
                        document.getElementById('username_error').innerText = '';
                    }
                    if(data.email == 'right') {
                        document.getElementById('email_error').innerText = '';
                    }
                    if(data.password == 'right') {
                        document.getElementById('password_error').innerText = '';
                    }
                    if(data.password2 == 'right') {
                        document.getElementById('password2_error').innerText = '';
                    }


                    if(data.username == 'userNameHold') {
                        document.getElementById('username_error').innerText = 'Данное имя уже ипользуется.';
                    }
                    if(data.username == 'empty') {
                        document.getElementById('username_error').innerText = 'Имя не должно быть пустым';
                    }
                    if(data.email == 'empty') {
                        document.getElementById('email_error').innerText = 'email не должен быть пустым';
                    }
                    if(data.email == 'emailNotValide') {
                        document.getElementById('email_error').innerText = 'Неверный email.';
                    }
                    if(data.password != 'right') {
                        document.getElementById('password_error').innerText = 'Неверный пароль. Пароль не должен быть короче 8 символов.';
                    }
                    if(data.password2 == 'passwordNotMatch') {
                        document.getElementById('password2_error').innerText = 'Пароли не совпадают.';
                    }
                }
                if(!data.hasError) {
                    document.getElementById('username').value = '';
                    document.getElementById('email').value = '';
                    document.getElementById('password').value = '';
                    document.getElementById('password2').value = '';
                    document.getElementById('register_form').style.display = 'none';
                    document.getElementById('p_ok').style.display = 'block';
                }

            },
            error: function(jqXHR){
                data = jQuery.parseJSON( jqXHR.responseText );
                alert("ERROR");
            }
        });
    });
});