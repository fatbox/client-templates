<div id="sidemenu">


{if $logged=='1'}


<div class="wbox">
<div class="wbox_header">{$lang.logindetails}</div>
<div class="wbox_content">
{$lang.welcomeback} <strong>{$login.firstname} {$login.lastname}</strong> <br />

<span ><small ><strong>{$lang.lastlogin}</strong> {$login.lastlogindate} <br />
<strong>{$lang.lastloginhost}</strong> {$login.lastloginhost}</small></span>
</div></div>


<div class="wbox">
<div class="wbox_header">{$lang.accountinfo}:</div>
<div class="wbox_content">
<strong >{$clientdata.firstname} {$clientdata.lastname}</strong><br />
{if $clientdata.companyname!=''}{$clientdata.companyname}<br />{/if}
{if $clientdata.address1!=''}{$clientdata.address1}<br />{/if}
{if $clientdata.address2!=''}{$clientdata.address2}<br />{/if}
{if $clientdata.city!=''}{$clientdata.city}, {/if}
{if $clientdata.state!=''}{$clientdata.state}, {/if}
{if $clientdata.postcode!=''}{$clientdata.postcode}<br />{/if}
{if $clientdata.country2!=''}{$clientdata.country2}<br />{/if}
{$clientdata.email}<br />
{if $clientdata.credit>0}<br />
	{$lang.credit}: <strong>{$clientdata.credit|price:$currency}</strong>
{/if}

</div></div>

{if $acc_balance && $acc_balance>0}
<div class="yelbox">
<form method="post" action="">
<input type="hidden" name="action" value="payall"/>
<input type="hidden" name="cmd" value="clientarea"/>
{$lang.curbalance}: <strong>{$acc_balance|price:$currency}</strong>
<center><input type="submit" value="{$lang.paynow}" class="padded" style="font-weight:bold;margin:5px;"/></center>
{securitytoken}</form>
</div>
{/if}

{else}


<div class="wbox">
	<div class="wbox_header">{$lang.clientlogin}</div>
<div class="wbox_content">
<form name="loginform" action="" method="post"><input type="hidden" name="action" value="login"/>

<table border="0" width="100%" cellpadding="0" cellspacing="3">

	<tr>
		<td>
		<label for="username" >{$lang.email}</label>
		<input name="username" id="username" value="{$submit.username}" style="width:210px;" class="styled"/>
		</td>		
	</tr>
	
	<tr>
		<td>
		<label for="password" >{$lang.password}</label>
		<input name="password" id="password" type="password" style="width:210px;" class="styled"/><div style="text-align:right"><a href="{$ca_url}root&amp;action=passreminder" style="font-size:10px;text-align:right;">{$lang.passreminder}</a></div>
		</td>		
	</tr>
	<tr><td><input type="submit" value="{$lang.login}" class="padded"/></td></tr>
	
</table>




{securitytoken}</form></div>
</div>

{/if}

{if $enableFeatures.kb!='off'}
<div class="wbox">
<div class="wbox_header">{$lang.needhelp}</div>
<div class="wbox_content">

<form name="kbase" action="{$ca_url}knowledgebase&amp;action=search" method="post"><input type="hidden" name="make" value="search"/>

<table border="0" width="100%" cellpadding="0" cellspacing="3">

	<tr>
		<td>
		<label for="query" >{$lang.search_phrase}</label>
		<input name="query" value="{$query}" id="query" style="width:210px;" class="styled"/>
		</td>		
	</tr>
	
	<tr><td><input type="submit" value="{$lang.search}" class="padded"/></td></tr>
	
</table>




{securitytoken}</form></div>
</div>
{/if}





</div>