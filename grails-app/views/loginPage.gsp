<%--
  Created by IntelliJ IDEA.
  User: anton
  Date: 06/08/14
  Time: 21:08
--%>
<html>
<head>
    <title>Velo-Sity</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'login.css')}"/>
    <g:javascript src="login.js"/>
</head>

<g:render template="/home/header"/>
<g:render template="/home/register"/>
<g:render template="/home/login"/>

<div id="div"></div>

<body>
<div id="parent_log">
    <div id="log">
        <div id="close_log">x</div>

        <form id='login_form' method="POST" action="j_spring_security_check">
            <p class="log_text_title" id="
            log_header">ВХОД</p>

            <p id="p_error" class='log_text_info'>Неверное имя или пароль.</p>

            <p class="log_text_title"><b>Логин:</b></p>
            <input
                    class='log_input'
                    name='j_username'
                    id='j_username'/>
            <br/>

            <p class="log_text_title"><b>Пароль:</b></p>
            <input
                    type='password'
                    class='text_ log_input'
                    name='j_password'
                    id='j_password'/>
            <p>
                <input type='submit' id="submit" value='ВОЙТИ'/>
            </p>
        </form>
    </div>
</div>
</body>
</html>