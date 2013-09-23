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
        <g:form url="[action: 'register', controller: 'register']" name='registerForm'>
            <g:if test='${emailSent}'>
                <br/>
                <g:message code='spring.security.ui.register.sent'/>
            </g:if>
            <g:else>
                <label>username:</label>
                <input
                        id='username'
                        name='username'
                        labelCode='user.username.label'
                        size='30'
                        labelCodeDefault='Username'
                        value=""/>
                <br/>
                <p id="usermame_error">123123123</p>
                <br/>
                <label>email:</label>
                <input
                        id='email'
                        name='email'
                        value=""
                        size='30'
                        labelCode='user.email.label'
                        labelCodeDefault='E-mail'/>
                <br/>
                <p id="email_error"></p>
                <br/>
                <label>password:</label>
                <input
                        id='password'
                        name='password'
                        labelCode='user.password.label'
                        size='30'
                        labelCodeDefault='Password'
                        value=""/>
                <br/>
                <p id="password_error"></p>
                <br/>
                <label>password2:</label>
                <input
                        id='password2'
                        name='password2'
                        labelCode='user.password2.label'
                        size='30'
                        labelCodeDefault='Password (again)'
                        value=""/>
                <br/>
                <p id="password2_error"></p>
                <br/>
                <g:submitButton name="update" value="Register"/>
            </g:else>
        </g:form>
        <button id="close_reg">Close</button>
    </div>
</div>
</body>