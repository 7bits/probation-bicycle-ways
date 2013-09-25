<!DOCTYPE html>
<html>
<head>
    <title>Velo-Sity</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'register.css')}"/>
    <g:javascript src="registration.js"/>
</head>

<body>
<div id="parent_reg" style="display: none">
    <div id="reg">
        <button id="close_reg">x</button>
        <p id="p_ok">Вы зарегистрированы. Проверьте свой email.</p>
        <g:form url="[action: 'register', controller: 'register']" name='registerForm' id='registerForm'>
            <p class="reg_text_title" id="reg_header">ЗАРЕГИСТРИРУЙТЕСЬ</p>
                <p class="reg_text_title"><b>Логин</b>(Имя пользователя):</p>
                <input
                        class="reg_input"
                        id='username'
                        name='username'
                        labelCode='user.username.label'
                        size='30'
                        labelCodeDefault='Username'
                        value=""/>
                <br/>
                <span id="username_error" class="reg_text_info"></span>
                <br/>
                <p class="reg_text_title"><b>Адрес электронной почты:</b></p>
                <input
                        class="reg_input"
                        id='email'
                        name='email'
                        value=""
                        size='30'
                        labelCode='user.email.label'
                        labelCodeDefault='E-mail'/>
                <br/>
                <span id="email_error" class="reg_text_info"></span>
                <br/>
                <p class="reg_text_title"><b>Пароль:</b></p>
                <input
                        class="reg_input"
                        id='password'
                        name='password'
                        labelCode='user.password.label'
                        size='30'
                        labelCodeDefault='Password'
                        value=""/>
                <br/>
                <span id="password_error" class="reg_text_info"></span>
                <br/>
                <p class="reg_text_title"><b>Еще раз пароль:</b></p>
                <input
                        class="reg_input"
                        id='password2'
                        name='password2'
                        labelCode='user.password2.label'
                        size='30'
                        labelCodeDefault='Password (again)'
                        value=""/>
                <br/>
                <span id="password2_error" class="reg_text_info"></span>
                <br/>
                <g:submitButton id="reg_submit"name="update" value="ПОЕХАЛИ!"/>
        </g:form>
    </div>
</div>
</body>