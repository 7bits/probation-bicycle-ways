/**
 * Created by anton on 14/08/14.
 */

$('document').ready(function () {
//    document.getElementById('p_error').style.display = 'none';
//    document.getElementById('p_error').style.display = 'none';

//    if( getParameterByName('login_error') == 1 ) {
//        document.getElementById('loader_background').style.display = 'block';
//        document.getElementById('p_error').style.display = 'block';
//    }

    document.getElementById('get_all_routes').onclick = function () {
        document.getElementById('loader_background').style.display = 'block';
    }

    document.getElementById('get_users_routes').onclick = function () {
        document.getElementById('loader_background').style.display = 'block';
    }

//    document.getElementById('loader_background').onclick = function () {
//        document.getElementById('loader_background').style.display = 'none';
//    }

//    if( document.getElementById('p_log') != null) {
//        document.getElementById('p_log').onclick = function () {
//            document.getElementById('parent_log').style.display = 'block';
//        }
//    }
});