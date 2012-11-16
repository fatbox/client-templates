{if $service}

{include file='services/service_details.tpl'}

{else}


    {if !$custom_template}
    <div class="bordered-section article">
    {/if}

{if $action=='services' && $cid}
<h2>{foreach from=$offer item=o}{if $action=='services' && $cid==$o.id}{$o.name}{/if}{/foreach}</h2>
{else}
<h2>{$lang[$action]|capitalize}</h2>
{/if}

{if $services}

{if $custom_template}
			{include file=$custom_template}
		{else}
<a href="{$ca_url}clientarea&amp;action=services&amp;cid={$cid}" id="currentlist" style="display:none" updater="#updater"></a>
<table cellspacing="0" cellpadding="0" border="0" width="100%" class="table table-striped fullscreen">
    <tbody>
        <tr>
            <th><a href="{$ca_url}clientarea&amp;action={$action}&amp;cid={$cid}&amp;orderby=name|ASC"  class="sortorder">{$lang.service}</a></th>
            <th width="80"><a href="{$ca_url}clientarea&amp;action={$action}&amp;cid={$cid}&amp;orderby=status|ASC"  class="sortorder">{$lang.status}</a></th>
            
            {if $action=='vps'}
            <th width="70"><a href="{$ca_url}clientarea&amp;action={$action}&amp;cid={$cid}&amp;orderby=domain|ASC"  class="sortorder">{$lang.hostname}</a></th>
            <th width="90">{$lang.ipadd}</th>
	  {else}
            <th width="70"><a href="{$ca_url}clientarea&amp;action={$action}&amp;cid={$cid}&amp;orderby=total|ASC"  class="sortorder">{$lang.price}</a></th>
            <th width="90"><a href="{$ca_url}clientarea&amp;action={$action}&amp;cid={$cid}&amp;orderby=billingcycle|ASC"  class="sortorder">{$lang.bcycle}</a></th>
	  {/if}

            <th width="113"><a href="{$ca_url}clientarea&amp;action={$action}&amp;cid={$cid}&amp;orderby=next_due|ASC"  class="sortorder">{$lang.nextdue}</a></th>
            <th width="50"></th>
        </tr>
    </tbody>
    <tbody id="updater">

        {include file='ajax/ajax.services.tpl'}
    </tbody>

</table>			
		{/if} 





                <table border="0" cellpadding="0" cellspacing="0" width="100%" class="fullscreen">
    <tr><td width="50%" align="left">
            {if $cid}
            {foreach from=$offer item=oo}
            {if $cid==$oo.id && $oo.visible=='1'}<br /><form method="post" action="{$ca_url}cart&cat_id={$cid}">
                <button class="btn btn-info"><i class="icon-shopping-cart icon-white"></i> {$lang.Add} {$oo.name}</button>{securitytoken}</form>{/if}
            {/foreach}
            {/if}
        </td><td align="right">
            <div class="clear"></div>
            {if $totalpages}
            <div class="right p19 pt0">
                <div class="pagelabel left ">{$lang.page}</div>
                <div class="btn-group right" data-toggle="buttons-radio" id="pageswitch">
                    {section name=foo loop=$totalpages}
                    <button class="btn {if $smarty.section.foo.iteration==1}active{/if}">{$smarty.section.foo.iteration}</button>
                    {/section}
                </div>
                <input type="hidden" id="currentpage" value="0" />


            </div>
            {/if}
            <div class="clear"></div>
        </td></tr>
</table> 
{else}
    <div class="p19">
        <h3>{$lang.nothing}</h3>
    {if $cid}

        {foreach from=$offer item=oo}
        {if $cid==$oo.id && $oo.visible=='1'}<form method="post" action="{$ca_url}cart&cat_id={$cid}">
            <button class="btn btn-success"><i class="icon-shopping-cart icon-white"></i> {$lang.Add} {$oo.name}</button>{securitytoken}</form>{/if}
        {/foreach}
       
        {/if}
            </div>

{/if}


    {if !$custom_template}
        </div>
    {/if}
{/if}