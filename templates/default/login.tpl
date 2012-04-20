{if $action=='passreminder'}
<div id="loginbox_container">
<h1 class="restricted2">{$lang.didyouforget}</h1>
{if $thanks}


{else}

{$lang.forgetintro}


<div class="gbox">
<form name="" action="" method="post">
<table border="0" cellpadding="3" cellspacing="0" width="100%">
<tr>
<td width="50%" align="left">
	<label for="email_remind" class="styled">{$lang.forgetenter}</label>
	<input name="email_remind" style="width:80%" value="{$sub_email}" class="styled"/><br /><br />

<input type="submit" value="{$lang.sendmepass}" class="padded" style="font-weight:bold"/>
</td>
<td width="50%">
<strong>{$lang.spamnote}</strong><br />
{$lang.spamnote1}
<strong>{$lang.spamnote2} {$emdomain}</strong>
</td>

</tr>


</table>{securitytoken}</form>
{/if}




</div></div>


{else}
<div id="loginbox_container">
<h1 class="restricted2">{$lang.restricted}</h1>
{$lang.restrictedarea}


<div class="gbox">
<center><form name="" action="" method="post">
<table border="0" cellpadding="0" cellspacing="6" width="80%">
<tr>

<td align="left" colspan="2"><label for="username" class="styled">{$lang.email}</label><input name="username" value="{$submit.username}" class="styled" style="width:96%"/></td>
</tr>

<tr>

<td align="left" colspan="2"><label for="password"  class="styled">{$lang.password}</label><input name="password" type="password" class="styled"  style="width:96%"/>
</td>
</tr>
<tr>

<td align="left"  >
<a href="{$ca_url}root&amp;action=passreminder" class="list_item">{$lang.passreminder}</a><br />
<a href="{$ca_url}signup/" class="list_item">{$lang.createaccount}</a>
</td>
<td align="right">
<input type="hidden" name="action" value="login"/>
<input type="submit" value="{$lang.login}" class="padded" style="font-weight:bold"/></td>
</tr>

<tr><td></td></tr>

</table>{securitytoken}</form>
</center>

</div>
</div>

{/if}