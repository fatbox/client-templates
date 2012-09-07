{if $service}


	{if $service.showbilling}
<tr>
    <td width="160" align="right">{$lang.registrationdate}</td>
    <td>{$service.date_created|dateformat:$date_format}</td>
</tr>
{/if}
<tr >
    <td align="right">{$lang.service}</td>
    <td>{$service.catname} - {$service.name} {if $upgrades && $upgrades!='-1'}<a href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/&make=upgrades&upgradetarget=service" class="lmore">{$lang.UpgradeDowngrade}</a>{/if}</td>
</tr>

		{if $service.domain!=''}
<tr>
    <td align="right">{$lang.domain}</td>
    <td><a target="_blank" href="http://{$service.domain}">{$service.domain}</a></td>
</tr>
		{/if}
		{if $service.custom}
			{foreach from=$service.custom item=cst}
<tr >
    <td align="right">{$cst.name}</td>
    <td>{include file=$cst.configtemplates.clientarea}
    </td>
</tr>

			{/foreach}

		{/if}
	{if $service.showbilling}
{if $service.firstpayment!=0 }
<tr>
    <td align="right">{$lang.firstpayment_amount}</td>
    <td>{$service.firstpayment|price:$currency}</td>
</tr>
{/if}
   		{if $service.billingcycle!='Free' && $service.billingcycle!='Once' && $service.billingcycle!='One Time' && $service.total>0}
<tr >
    <td align="right">{if $service.billingcycle=='Hourly'}{$lang.curbalance}{else}{$lang.reccuring_amount}{/if}</td>
    <td>{$service.total|price:$currency} {if $service.billingcycle=='Hourly'}({$lang.updatedhourly}){/if}</td>
</tr>
{/if}
{if $service.billingcycle!='Free' && $service.billingcycle!='Once' && $service.billingcycle!='One Time' && $service.next_due!='' && $service.next_due!='0000-00-00'}
<tr>
    <td align="right">{$lang.nextdue}</td>
    <td>{$service.next_due|dateformat:$date_format}</td>
</tr>
{/if}

<tr >
    <td align="right">{$lang.bcycle}</td>
    <td>{$lang[$service.billingcycle]}</td>
</tr>
{/if}


<tr>
    <td align="right" style="border:none">{$lang.status}</td>
    <td style="border:none"><span class="{$service.status}">{$lang[$service.status]}</span></td>
</tr>

{/if}