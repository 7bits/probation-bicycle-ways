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
    $('#loginForm').submit(function (e) {
        $('#loaderBackground')[0].style.display = 'block';
        rotator.start();
        e.preventDefault();
        var command = {
            j_username: $('#j_username').val(),
            j_password: $('#j_password').val(),
        }
        $('#usernameError')[0].innerHTML = '';
        $('#passwordError')[0].innerHTML = '';
        $.ajax({
            type: 'POST',
            url: $('#loginForm')[0].action,
            datatype: JSON,
            data: command,
            complete: function (data) {
                $('#loaderBackground')[0].style.display = 'none';
                rotator.stop();
            },
            success: function (data) {
                if (data.error) {
                    $('#password')[0].value = '';
                    $('#pError')[0].innerHTML = data.error;
                    $('#pError').css("display", 'block');
                }
                else{
                    location.reload();
                }

            },
            error: function (jqXHR) {
                data = jQuery.parseJSON(jqXHR.responseText);
                alert("ERROR");
            }
        });
    });
    
    $('#registerForm').submit(function (e) {
        $("#loaderBackground")[0].style.display = 'block';
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
        $('#usernameError')[0].innerHTML = '';
        $('#emailError')[0].innerHTML = '';
        $('#passwordError')[0].innerHTML = '';
        $('#password2Error')[0].innerHTML = '';
        $.ajax({
            type: 'POST',
            url: getUrl() + '/register/register',
            datatype: JSON,
            data: command,
            complete: function (data) {
                $('#loaderBackground')[0].style.display = 'none';
                rotator.stop();
            },
            success: function (data) {
                if (data.status!=true) {
                    $('#password')[0].value = '';
                    $('#password2')[0].value = '';

                    if (data.username != null) {
                        $('#usernameError')[0].innerHTML = data.username;
                    }
                    if (data.email != null) {
                        $('#emailError')[0].innerHTML = data.email;
                    }
                    if (data.password != null) {
                        $('#passwordError')[0].innerHTML = data.password;
                    }
                    if (data.password2 != null) {
                        $('#password2Error')[0].innerHTML = data.password2;
                    }
                }
                else{
                    $('#username')[0].value = '';
                    $('#email')[0].value = '';
                    $('#password')[0].value = '';
                    $('#password2')[0].value = '';
                    $('#registerForm')[0].style.display = 'none';
                    $('#pOk')[0].style.display = 'block';
                }

            },
            error: function (jqXHR) {
                data = jQuery.parseJSON(jqXHR.responseText);
                alert("ERROR");
            }
        });
    });
});