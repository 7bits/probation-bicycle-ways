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
        document.getElementById('usernameError').innerHTML = '';
        document.getElementById('emailError').innerHTML = '';
        document.getElementById('passwordError').innerHTML = '';
        document.getElementById('password2Error').innerHTML = '';
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

                    if (data.username != null) {
                        document.getElementById('usernameError').innerHTML = data.username;
                    }
                    if (data.email != null) {
                        document.getElementById('emailError').innerHTML = data.email;
                    }
                    if (data.password != null) {
                        document.getElementById('passwordError').innerHTML = data.password;
                    }
                    if (data.password2 != null) {
                        document.getElementById('password2Error').innerHTML = data.password2;
                    }
                }
                if (!data.hasError) {
                    document.getElementById('username').value = '';
                    document.getElementById('email').value = '';
                    document.getElementById('password').value = '';
                    document.getElementById('password2').value = '';
                    document.getElementById('registerForm').style.display = 'none';
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