$('document').ready(function () {
    document.getElementById('close_log').onclick = function () {
        document.getElementById('parent_log').style.display = 'none';
    }
    document.getElementById('p_log').onclick = function () {
        document.getElementById('parent_log').style.display = 'block';
    }
});