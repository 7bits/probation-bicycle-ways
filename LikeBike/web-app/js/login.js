$('document').ready(function () {
    document.getElementById('p_error').style.display = 'none';
    function getParam(name){
        if(name=(new RegExp('[?&]'+encodeURIComponent(name)+'=([^&]*)')).exec(location.search))
            return decodeURIComponent(name[1]);
    }
    if( getParam('login_error') == 1 ){
        document.getElementById('parent_log').style.display = 'block';
        document.getElementById('p_error').style.display = 'block';
    }

    document.getElementById('close_log').onclick = function () {
        document.getElementById('parent_log').style.display = 'none';
    }
    document.getElementById('p_log').onclick = function () {
        document.getElementById('parent_log').style.display = 'block';
    }

    $('#loginForm').submit(function (e) {

    });
});