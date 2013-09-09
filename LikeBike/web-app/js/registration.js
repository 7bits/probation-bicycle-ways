$('document').ready(function(){
  $('#regForm').submit( function(e){
    e.preventDefault();
    loginVal=$('#login').val();
    passwordVal=$('#password').val();
    conPasswordVal=$('#conPassword').val();
    msgData = {
      asasas: "asdasdasdasdasd",
      login: loginVal,
      password: passwordVal,
      conPassword: conPasswordVal
    }
    $.ajax({
      url: "user/saveUser", 
      type: "post", 
      data: msgData,
      dataType: "json",
      success: function(data){
        alert(data);
        //document.getElementById('msgform').style.display = 'none';
        //var divpop = document.getElementById('form');
        //var p = document.createElement('msg');
        //p.innerHTML = 'Ваше сообщение отправлено.';
        //p.style.color = "#0a0";
        //divpop.appendChild(p);
      },
      error: function(jqXHR){
        data = jQuery.parseJSON( jqXHR.responseText );
        alert("OK");
        //var pForm = document.createElement('p_msg');
        //pForm.innerHTML = 'Данные некорректны.';
        //pForm.style.color = "#a00";
        //document.getElementById('form').appendChild(pForm);
        //if(data.notLogin) {
        //  document.getElementById('errorMsg').style.display = 'inline'; 
        //}
        //if(data.notEmail) {
        //  document.getElementById('errorMsg').style.display = 'inline'; 
        //}
        //if(data.notMassage) {
        //  document.getElementById('errorMsg').style.display = 'inline'; 
        //}
      }
    })
  });
});