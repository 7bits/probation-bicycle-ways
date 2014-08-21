
<div id="loader_background" style="display: none">
    <div id="rotator">
        <ul>
            <li class="show"><g:img id="logo" dir="images/bicycle" file="1.png" width="68" height="41" /></li>
            <li><g:img id="logo" dir="images/bicycle" file="2.png" width="68" height="41" /></li>
            <li><g:img id="logo" dir="images/bicycle" file="3.png" width="68" height="41" /></li>
            <li><g:img id="logo" dir="images/bicycle" file="4.png" width="68" height="41" /></li>
            <li><g:img id="logo" dir="images/bicycle" file="5.png" width="68" height="41" /></li>
            <li><g:img id="logo" dir="images/bicycle" file="6.png" width="68" height="41" /></li>
            <li><g:img id="logo" dir="images/bicycle" file="7.png" width="68" height="41" /></li>
            <li><g:img id="logo" dir="images/bicycle" file="8.png" width="68" height="41" /></li>
        </ul>
    </div>
</div>


<div id="parent_reg" style="display: none">
    <div id="reg">
        <div id="close_reg">x</div>

        <p id="p_ok">Вы зарегистрированы. Проверьте свой email.</p>
        <g:form url="[action: 'register', controller: 'register']" name='register_form' id='register_form'>
            <p class="reg_title" id="reg_header"><b>Регистрация</b></p>

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
            <g:submitButton id="reg_submit" name="update" value="Зарегистрироваться"/>
            <span id="spiner"></span>
        </g:form>
    </div>
</div>