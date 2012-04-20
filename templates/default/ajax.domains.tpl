{if $getRenewPeriods}
    {if $renew_prices}
        <br />
            <form action="" method="post">
                <input type="hidden" name="submit" value="1" />
                <input type="hidden" name="renew" value="1" />
                    {$lang.chooseperiod}:
                    <select name="period">
                        {if $renew_prices}
                            {foreach from=$renew_prices item=rprice}
                                <option value="{$rprice.period}">{$rprice.period} {$lang.years} @ {$rprice.renew|price:$currency}</option>
                            {/foreach}
                        {/if}
                    </select> <br />
                    <input style="font-weight: bold" type="submit" name="do_renew" value="{$lang.orderrenewal}" />
                    <input type="submit" value="{$lang.cancel}" onclick="{literal}$(this).parent().parent().hide().removeClass('shown'); return false;{/literal}"/>
            {securitytoken}</form>
    {else}
        <font style="color: #C00">{$lang.renewnotavailable}</font>
    {/if}
{else}
    {if $domains}
    {foreach from=$domains item=domain name=foo}
     <tr {if $domain.status == 'Expired'}class="expired"{elseif $domain.status == 'Active' && $domain.daytoexpire < 60 && $domain.daytoexpire >= 0}class="nearexpire"{elseif $smarty.foreach.foo.index%2 == 0}class="even"{/if}>

        <td><input type="checkbox" name="ids[]" value="{$domain.id}" onclick="c_unc(this)" class="idchecker" {if $domain.status!='Active' && $domain.status!='Expired'}disabled="disabled" {/if} /></td>
        <td>
            <a href="{$ca_url}clientarea/domains/{$domain.id}/{$domain.name}/">{$domain.name}</a>
            {if $domain.status == 'Active' || $domain.status == 'Expired'}
            {if $domain.daytoexpire < 60 && $domain.daytoexpire >= 0}
                <strong>{$domain.daytoexpire} {if $domain.daytoexpire==1}{$lang.day}{else}{$lang.days}{/if} {$lang.toexpire}!</strong>
            {/if}{/if}</td>
        <td><center>{if !$domain.date_created || $domain.date_created == '0000-00-00'}-{else}{$domain.date_created|dateformat:$date_format}{/if}</center></td>
        <td align="center">{if !$domain.expires || $domain.expires == '0000-00-00' || ($domain.status!='Active' && $domain.status!='Expired') }<center>-</center>{else}{$domain.expires|dateformat:$date_format}{/if}</td>
        <td align="center"><span class="{$domain.status}">{$lang[$domain.status]}</span></td>
        <td align="center"> {if $domain.status == 'Active' || $domain.status == 'Expired'}{if $domain.autorenew=='0'}<span class="Pending">{$lang.Off}</span>{else}<span class="Active">{$lang.On}</span>{/if}{else}-{/if}</td>
        <td align="center"><a href="{$ca_url}clientarea/domains/{$domain.id}/{$domain.name}/" class="view3">view</a></td>

        </tr>
    {/foreach}
      {/if}
{/if}