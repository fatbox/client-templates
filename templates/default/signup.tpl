<h1 class="clientarea2">{$lang.createaccount}</h1>


<form method="post" action="" name="signupform">
{include file='ajax.signup.tpl}

<br />
<center><input type="submit" value="{$lang.submit}" class="padded" style="font-weight:bold"/></center>
{securitytoken}</form>
