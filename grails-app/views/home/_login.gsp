<head>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'login.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'register.css')}"/>
    <g:javascript src="login.js"/>
</head>
<body>
    <div id="parent_log">
        <div id="log" class="log">
            <ul class="nav nav-tabs" role="tablist">
                <li class="active"><a href="#login" class="tab_title" role="tab" data-toggle="tab">Логин</a></li>
                <li><a href="#register" class="tab_title" role="tab" data-toggle="tab">Регистрация</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="login">
                    <form id='login_form' method="POST" action="${createLink(uri: '/j_spring_security_check')}">

                        <p class="log_text_title">Логин</p>
                        <input
                                class='log_input'
                                name='j_username'
                                id='j_username'/>
                        <br/>

                        <p class="log_text_title">Пароль</p>

                        <input
                                type='password'
                                class='text_ log_input'
                                name='j_password'
                                id='j_password'/>

                        <p id="p_error" class='log_text_info'>Неверно введен логин или пароль.</p>

                        <p>
                            <input type='submit' id="submit" class="log_button" value='Войти'/>
                        </p>
                    </form>
                    <div id="vk_auth"></div>
                </div>
                <div class="tab-pane" id="register">
                    %{--<div id="p_ok" style="display: none">--}%
                        %{--<p class="reg_text">--}%
                            %{--На указанный адрес электронной почты отправлено письмо с подтверждением.<br>--}%
                            %{--Пройдите по ссылке в письме для завершения регистрации.--}%
                        %{--</p>--}%
                        %{--<button id="good">Хорошо</button>--}%
                    %{--</div>--}%
                    <p id="p_ok" style="display: none">На указанный адрес электронной почты отправлено письмо с подтверждением.<br>
                                                        Пройдите по ссылке в письме для завершения регистрации.
                    </p>
                    <g:form name='register_form' id='register_form'>
                        <p class="reg_text_title">Логин</p>
                        <input
                                class="reg_input"
                                id='username'
                                name='username'
                                labelCode='user.username.label'
                                labelCodeDefault='Username'
                                value=""/>
                        <br/>
                        <span id="username_error" class="reg_text_info"></span>
                        <br/>

                        <p class="reg_text_title">E-mail</p>
                        <input
                                class="reg_input"
                                id='email'
                                name='email'
                                value=""
                                labelCode='user.email.label'
                                labelCodeDefault='E-mail'/>
                        <br/>
                        <span id="email_error" class="reg_text_info"></span>
                        <br/>

                        <p class="reg_text_title">Пароль</p>
                        <input
                                type='password'
                                class="reg_input"
                                id='password'
                                name='password'
                                labelCode='user.password.label'
                                labelCodeDefault='Password'
                                value=""/>
                        <br/>
                        <span id="password_error" class="reg_text_info"></span>
                        <br/>

                        <p class="reg_text_title">Еще раз пароль</p>
                        <input
                                type='password'
                                class="reg_input"
                                id='password2'
                                name='password2'
                                labelCode='user.password2.label'
                                labelCodeDefault='Password (again)'
                                value=""/>
                        <br/>
                        <span id="password2_error" class="reg_text_info"></span>
                        <br/>
                        <button id="reg_submit">Зарегистрироваться</button>
                        <span id="spiner"></span>
                    </g:form>
                </div>
            </div>
        </div>
    </div>
</body>