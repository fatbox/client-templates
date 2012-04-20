{if $service}



<h1 class="gears2">{$service.catname} - {$service.name}</h1>
<div class="cbreadcrumb"><a href="{$ca_url}clientarea/"><strong>{$lang.clientarea}</strong></a> &raquo;<a href="{$ca_url}clientarea/services/{$service.slug}/"><strong>{$service.catname}</strong></a>
    
{if $widget}&raquo; <a href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/"><strong>{$service.name}</strong></a> &raquo; {if $lang[$widget.name]}{$lang[$widget.name]}{elseif $widget.fullname}{$widget.fullname}{else}{$widget.name}{/if} {else}
&raquo; <strong>{$service.name}</strong>{/if}</div>


	{include file="service_upgrades.tpl"}
{if $widget.appendtpl && !$custom_template}
    {include file=$widget.appendtpl}
{/if}

{if $custom_template}
	{include file=$custom_template}
{elseif $widget.replacetpl}
    {include file=$widget.replacetpl}

{else}
{if $service.isvpstpl  && $service.ptype!='Server'}
	{include file="services.vps.tpl"}
{/if}
{if $service.ptype!='Server'}
<div class="tabb" style="display:none;" id="_ocustom"></div>
{/if}



<div class="left" style="width:630px">
{if $service.isvpstpl && $service.ptype=='Server'}
	{include file="services.vps.tpl"}
{/if}
{if $service.ptype=='Server'}
    <div class="tabb" style="display:none;" id="_ocustom"></div>
{/if}

    <div class="wbox" {if $service.status=='Active' && $service.ptype=='Server'}style="display:none"{/if} id="billing_info" >
        <div class="wbox_header">
{$lang.billing_info|capitalize}
        </div>
        <div class="wbox_content">
            <table width="100%" cellspacing="0" cellpadding="0" border="0" class="checker">

	  {if $service.isvps && !$service.isvpstpl}
{if $service.bw_limit!='0'}
                <tr class="even">
                    <td align="right">{$lang.bandwidth}</td>
                    <td>{$service.bw_limit} {$lang.gb}</td>
                </tr>
		{/if} {if $service.disk_limit!='0'}
                <tr>
                    <td align="right">{$lang.disk_limit}</td>
                    <td>{$service.disk_limit} {$lang.gb}</td>
                </tr>
		{/if}
   		{if $service.guaranteed_ram!='0'}
                <tr class="even">
                    <td align="right">{$lang.memory}</td>
                    <td>{$service.guaranteed_ram} {$lang.mb}</td>
                </tr>   {/if}
		{if $service.burstable_ram!='0'}
                <tr>
                    <td align="right">{$lang.burstable_ram}</td>
                    <td>{$service.burstable_ram}  {$lang.mb}</td>
                </tr>   {/if}

                <tr class="even">
                    <td align="right">{$lang.ipadd}</td>
                    <td>{if $service.vpsip}{$service.vpsip}{else}{$service.ip}{/if}</td>
                </tr>
		{if $service.additional_ip}
                <tr>
                    <td align="right" valign="top">{$lang.additionalip}</td>
                    <td>{foreach from=$service.additional_ip item=ip}{$ip}<br />{/foreach}</td>
                </tr>
		{/if}
{/if}

{include file='service_billing.tpl'}

            </table>


        </div></div>



	{if $addons}
    <div class="wbox">
        <div class="wbox_header">
	{$lang.accaddons|capitalize}
        </div>

        <div class="wbox_content">
            <table width="100%" cellspacing="0" cellpadding="0" border="0" class="checker">

                <tr><td colspan="2" style="border:none">


                        <table cellspacing="0" cellpadding="0" border="0" width="100%" class="styled">
                            <colgroup class="firstcol"></colgroup>
                            <colgroup class="alternatecol"></colgroup>
                            <colgroup class="firstcol"></colgroup>
                            <colgroup class="alternatecol"></colgroup>

                            <tbody>
                                <tr>
                                    <th width="40%" align="left">{$lang.addon}</th>
                                   {if $service.showbilling} <th align="left">{$lang.price}</th>
                                    <th>{$lang.nextdue}</th>
                                    <th >{$lang.status}</th>{/if}

                                </tr>
	{foreach from=$addons item=addon name=foo}
                                <tr {if $smarty.foreach.foo.index%2 == 0}class="even"{/if}>
                                    <td>{$addon.name} {if $addon.info && $addon.status == 'Active'}<a href="" onclick="showAddonInfo(this,{$addon.id}); return false;" style="color: red; font-size: 11px">{$lang.moreinfo}</a>{/if}</td>
                                    {if $service.showbilling}<td>{$addon.recurring_amount|price:$currency}</td>
                                    <td align="center">{$addon.next_due|dateformat:$date_format}</td>
                                    <td align="center" ><span class="{$addon.status}">{$lang[$addon.status]}</span></td>{/if}

                                </tr>
    {if $addon.info && $addon.status == 'Active'}
                                <tr class="addoninfo_r{$addon.id} {if $smarty.foreach.foo.index%2 == 0} even{/if}" style="display:none">
                                    <td colspan="4"> <div style="padding: 10px">
                {$addon.info|replace:'"':"'"|nl2br}</div>
                                    </td>
                                </tr>
    {/if}
	{/foreach}
                            </tbody>

                        </table>{if $service.status!='Fraud' && $service.status!='Cancelled' && $service.status!='Terminated'}{$service.id|string_format:$lang.clickaddaddons}{/if}



                    </td></tr>
            </table>
        </div></div>
    <script type="text/javascript">
        {literal}
            function showAddonInfo(elem,id) {
                if($('.addoninfo_r'+id).hasClass('shown')) {
                    $('.addoninfo_r'+id).removeClass('shown').hide();
                    $(elem).html('{/literal}{$lang.moreinfo}{literal}');}
                else {
                    $('.addoninfo_r'+id).addClass('shown').show();
                    $(elem).html('{/literal}{$lang.hide}{literal}');
                }
            }
        {/literal}
    </script>
{elseif $haveaddons && $service.status!='Fraud' && $service.status!='Cancelled' && $service.status!='Terminated'}
    <div class="wbox">
        <div class="wbox_header">
            <strong>{$lang.accaddons|capitalize}</strong>
        </div>
        <div class="wbox_content">
	{$service.id|string_format:$lang.clickaddaddons}
        </div></div>
{/if}



</div>
{include file='service.sidemenu.tpl'}
{/if}
{else}
{if $action=='services' && $cid}
<h1 class="gears2">{foreach from=$offer item=o}{if $action=='services' && $cid==$o.id}{$o.name}{/if}{/foreach}</h1>
{else}
<h1 class="gears2">{$lang[$action]|capitalize}</h1>
{/if}

{if $services}

 {if $custom_template}
			{include file=$custom_template}
		{else}
<a href="{$ca_url}clientarea&amp;action=services&amp;cid={$cid}" id="currentlist" style="display:none" updater="#updater"></a>
<table cellspacing="0" cellpadding="0" border="0" width="100%" class="styled">
    <colgroup class="firstcol"></colgroup>
    <colgroup class="alternatecol"></colgroup>
    <colgroup class="firstcol"></colgroup>
    <colgroup class="alternatecol"></colgroup>
    <colgroup class="firstcol"></colgroup>
    <colgroup class="alternatecol"></colgroup>
    <tbody>
        <tr>
            <th><a href="{$ca_url}clientarea&amp;action={$action}&amp;cid={$cid}&amp;orderby=name|ASC"  class="sortorder">{$lang.service}</a></th>
      {if $action=='vps'}
            <th width="70"><a href="{$ca_url}clientarea&amp;action={$action}&amp;cid={$cid}&amp;orderby=domain|ASC"  class="sortorder">{$lang.hostname}</a></th>
	  {else}
            <th width="70"><a href="{$ca_url}clientarea&amp;action={$action}&amp;cid={$cid}&amp;orderby=total|ASC"  class="sortorder">{$lang.price}</a></th>
	  {/if}
	  {if $action=='vps'}
            <th width="90">{$lang.ipadd}</th>
	  {else}
            <th width="90"><a href="{$ca_url}clientarea&amp;action={$action}&amp;cid={$cid}&amp;orderby=billingcycle|ASC"  class="sortorder">{$lang.bcycle}</a></th>
	  {/if}

            <th><a href="{$ca_url}clientarea&amp;action={$action}&amp;cid={$cid}&amp;orderby=status|ASC"  class="sortorder">{$lang.status}</a></th>
            <th width="113"><a href="{$ca_url}clientarea&amp;action={$action}&amp;cid={$cid}&amp;orderby=next_due|ASC"  class="sortorder">{$lang.nextdue}</a></th>
            <th width="20"></th>
        </tr>
    </tbody>
    <tbody id="updater">

  {include file='ajax.services.tpl'}
    </tbody>

</table>			
		{/if} 





<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr><td width="50%" align="left">
{if $cid}
{foreach from=$offer item=oo}
{if $cid==$oo.id && $oo.visible=='1'}<br /><form method="post" action="{$ca_url}cart&cat_id={$cid}"><input type="submit" value="{$lang.Add} {$oo.name}" />{securitytoken}</form>{/if}
{/foreach}
{/if}
        </td><td align="right">{if $totalpages>1}{$lang.page}
            <select name="page" id="currentpage">
{section name=foo loop=$totalpages}          
                <option value='{$smarty.section.foo.iteration-1}'>{$smarty.section.foo.iteration}</option>
{/section}    
            </select>
 {$lang.pageof}<strong> {$totalpages}</strong>{/if}</td></tr>
</table> 

<br />
{else}

{if $cid}
{foreach from=$offer item=oo}
{if $cid==$oo.id && $oo.visible=='1'}<form method="post" action="{$ca_url}cart&cat_id={$cid}">{$lang.nothing}&nbsp;<input type="submit" value="{$lang.Add} {$oo.name}" />{securitytoken}</form>{/if}
{/foreach}
{else}
{$lang.nothing}&nbsp;
{/if}
{/if}
{/if}
