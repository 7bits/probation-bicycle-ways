<!DOCTYPE html>
<html>
<head>
    <title>Registration</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="http://yandex.st/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
    <g:javascript src="registration.js"/>
</head>

<body>
<g:if test="${flash.authenticationFailure}">
    Login failed: ${message(code: "authentication.failure." + flash.authenticationFailure.result).encodeAsHTML()}
</g:if>
<auth:form authAction="signup" success="[controller: 'portal', action: 'newUser']"
           error="[controller: 'portal', action: 'signup']">
    User: <g:textField name="login"/><br/>
    Password: <input type="password" name="password"/><br/>
    Confirm Password: <input type="password" name="passwordConfirm"/><br/>
    <input type="submit" value="Create account"/>
</auth:form>
</body>
</html>