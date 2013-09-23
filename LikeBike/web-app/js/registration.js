$('document').ready(function () {

    document.getElementById('close_reg').onclick = function () {
        document.getElementById('parent_reg').style.display = 'none';
    }
    document.getElementById('p_reg').onclick = function () {
        document.getElementById('parent_reg').style.display = 'block';
    }

    $('#registerForm').submit(function(e){
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
                alert("OK");
                if(data.hasError) {
                    document.getElementById('username_error').value = data.username;
                    document.getElementById('email_error').value = data.email;
                    document.getElementById('password_error').style.value = data.password;
                    document.getElementById('password2_error').style.value = data.password2;

                }

            },
            error: function(jqXHR){
                data = jQuery.parseJSON( jqXHR.responseText );
                alert("ERROR");
            }
        });
    });
});