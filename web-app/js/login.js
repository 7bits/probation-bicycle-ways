$('document').ready(function () {
    document.getElementById('p_error').style.display = 'none';
    document.getElementById('p_error').style.display = 'none';

    if( getParameterByName('login_error') == 1 ){
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
function getParameterByName(name) {

    name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}