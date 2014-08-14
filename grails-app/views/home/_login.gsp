

<div id="parent_log" style="display: none">
    <div id="log">
        <div id="close_log">x</div>

        <form id='login_form' method="POST" action="j_spring_security_check">
            <p class="log_title" id="log_header"><b>Вход</b></p>

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

            <p id="p_error" class='log_text_info'>Неверно введен логин или пароль</p>

            <p>
                <input type='submit' id="submit" class="log_button" value='Войти'/>
            </p>
        </form>
    </div>
</div>
