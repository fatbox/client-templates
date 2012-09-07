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
    <input style="font-weight: bold" type="submit" name="do_renew" value="{$lang.orderrenewal}"  class="btn btn-success" />
    <input type="button" value="{$lang.cancel}" onclick="$(this).parent().parent().hide().removeClass('shown'); return false;" class="btn " />
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
        <strong class="label label-warning">{$domain.daytoexpire} {if $domain.daytoexpire==1}{$lang.day}{else}{$lang.days}{/if} {$lang.toexpire}!</strong>
        {/if}{/if}</td>
    <td><center>{if !$domain.date_created || $domain.date_created == '0000-00-00'}-{else}{$domain.date_created|dateformat:$date_format}{/if}</center></td>
    <td align="center">{if !$domain.expires || $domain.expires == '0000-00-00' || ($domain.status!='Active' && $domain.status!='Expired') }<center>-</center>{else}{$domain.expires|dateformat:$date_format}{/if}</td>
    <td align="center"><span class="label label-{$domain.status}">{$lang[$domain.status]}</span></td>
    <td align="center"> {if $domain.status == 'Active' || $domain.status == 'Expired'}{if $domain.autorenew=='0'}<span class="Pending">{$lang.Off}</span>{else}<span class="Active">{$lang.On}</span>{/if}{else}-{/if}</td>
    <td align="center">
        {if $domain.status=='Active' || $domain.status == 'Expired'}
          <div class="btn-group">
              <a href="{$ca_url}clientarea/domains/{$domain.id}/{$domain.name}/" class="btn dropdown-toggle" data-toggle="dropdown"><i class="icon-cog"></i> <span class="caret"></span></a>
          <ul class="dropdown-menu">
            
            <li><a href="{$ca_url}clientarea/domains/{$domain.id}/{$domain.name}/">{$lang.managedomain}</a></li>
            <li class="divider"></li>

            <li class="disabled widget_domainrenewal"><a href="{$ca_url}clientarea/domains/&id=renew&ids[]={$domain.id}">{$lang.renew_widget} </a></li>
            {if $domwidgets}{foreach from=$domwidgets item=widg}<li class="disabled widget_{$widg.widget}">
                    <a href="{$ca_url}clientarea/domains/{$domain.id}/{$domain.name}/&widget={$widg.widget}#{$widg.widget}" >
                       {assign var=widg_name value="`$widg.name`_widget"}
			{if $lang[$widg_name]}{$lang[$widg_name]}{elseif $lang[$widg.widget]}{$lang[$widg.widget]}{else}{$widg.name}{/if}
                    </a>
                </li>
                {/foreach} {/if}

           
          </ul>
          </div>
        {else}
        <a href="{$ca_url}clientarea/domains/{$domain.id}/{$domain.name}/" class="btn"><i class="icon-cog"></i></a>
{/if}
       </td>
</tr>
{/foreach}
{/if}
{/if}