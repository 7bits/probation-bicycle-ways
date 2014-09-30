<head>
    <asset:stylesheet href="login.css"/>
    <asset:stylesheet href="register.css"/>
    <asset:javascript src="login.js"/>
</head>
<body>
    <div id="parentLog">
        <div id="log" class="log">
            <ul class="nav nav-tabs" role="tablist">
                <li class="active"><a href="#login" class="tabTitle" role="tab" data-toggle="tab">Логин</a></li>
                <li><a href="#register" class="tabTitle" role="tab" data-toggle="tab">Регистрация</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="login">
                    <form id='loginForm' method="POST" action="${createLink(uri: '/j_spring_security_check')}">

                        <p class="logTextTitle">Логин</p>
                        <input
                                class='logInput'
                                name='j_username'
                                id='j_username'/>
                        <br/>

                        <p class="logTextTitle">Пароль</p>

                        <input
                                type='password'
                                class='logInput'
                                name='j_password'
                                id='j_password'/>

                        <p id="pError" class='logTextInfo'></p>
                        <input type='submit' id="submit" class="logButton" value='Войти'/>
                    </form>
                    <div id="vk_auth"></div>
                </div>
                <div class="tab-pane" id="register">
                    <p id="pOk" style="display: none">На указанный адрес электронной почты отправлено письмо с подтверждением.<br>
                                                        Пройдите по ссылке в письме для завершения регистрации.
                    </p>
                    <g:form name='registerForm' id='registerForm'>
                        <p class="regTextTitle">Логин</p>
                        <input
                                class="regInput"
                                id='username'
                                name='username'
                                labelCode='user.username.label'
                                labelCodeDefault='Username'
                                value=""/>
                        <br/>
                        <span id="usernameError" class="regTextInfo"></span>
                        <br/>

                        <p class="regTextTitle">E-mail</p>
                        <input
                                class="regInput"
                                id='email'
                                name='email'
                                value=""
                                labelCode='user.email.label'
                                labelCodeDefault='E-mail'/>
                        <br/>
                        <span id="emailError" class="regTextInfo"></span>
                        <br/>

                        <p class="regTextTitle">Пароль</p>
                        <input
                                type='password'
                                class="regInput"
                                id='password'
                                name='password'
                                labelCode='user.password.label'
                                labelCodeDefault='Password'
                                value=""/>
                        <br/>
                        <span id="passwordError" class="regTextInfo"></span>
                        <br/>

                        <p class="regTextTitle">Еще раз пароль</p>
                        <input
                                type='password'
                                class="regInput"
                                id='password2'
                                name='password2'
                                labelCode='user.password2.label'
                                labelCodeDefault='Password (again)'
                                value=""/>
                        <br/>
                        <span id="password2Error" class="regTextInfo"></span>
                        <br/>
                        <button id="regSubmit">Зарегистрироваться</button>
                        <span id="spiner"></span>
                    </g:form>
                </div>
            </div>
        </div>
    </div>
</body>