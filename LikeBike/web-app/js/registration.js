$('document').ready(function () {

    document.getElementById('close_reg').onclick = function () {
        document.getElementById('parent_reg').style.display = 'none';
    }
    document.getElementById('p_reg').onclick = function () {
        document.getElementById('parent_reg').style.display = 'block';
    }


    $('#registerForm').submit(function(e){
        e.preventDefault();
        command = {
            username: $('#username'),
            email: $('#email'),
            password: $('#password'),
            password2: $('#password2')
        };
        $.ajax({
            type : 'GET',
            url : 'register/register',
            datatype: JSON,
            data :  command,
            success: function(data){
                alert("OK");
            },
            error: function(jqXHR){
                data = jQuery.parseJSON( jqXHR.responseText );
                alert("ERROR");
            }
        });
    });
});