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
        <form id='loginForm' method="POST" action="j_spring_security_check">
            <p>
                <label for='username'><g:message code="springSecurity.login.username.label"/>:</label>
                <input name='j_username' id='j_username'/>
            </p>

            <p>
                <label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
                <input type='password' class='text_' name='j_password' id='j_password'/>
            </p>

            <p id="remember_me_holder">
                <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me'
                       <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                <label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
            </p>

            <p>
                <input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>
            </p>
        </form>

        <button id="close_log">Close</button>
    </div>
</div>
</body>