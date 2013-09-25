<!DOCTYPE html>
<html>
<head>
    <title>Velo-Sity</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'login.css')}"/>
    <g:javascript src="login.js"/>
</head>

<body>
<div id="parent_log" style="display: none">
    <div id="log">
        <button id="close_log">X</button>

        <form id='loginForm' method="POST" action="j_spring_security_check">
            <p class="reg_text_title" id="log_header">ВХОД</p>

            <p class="reg_text_title"><b>Логин:</b></p>
            <input
                    class='log_input'
                    name='j_username'
                    id='j_username'/>
            <br/>


            <p class="reg_text_title"><b>Пароль:</b></p>
            <input
                   type='password'
                   class='text_ log_input'
                   name='j_password'
                   id='j_password'/>

            <!--
            <p id="remember_me_holder">
                <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me'
                       <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                <label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
            </p>
            -->

            <p>
                <input type='submit' id="submit" value='ВОЙТИ'/>
            </p>
        </form>
    </div>
</div>
</body>