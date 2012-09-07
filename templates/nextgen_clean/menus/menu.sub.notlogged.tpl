{if $cmd=='root' && $infopages}

<ul class="nav nav-pills pa1">
    {foreach from=$infopages item=paged}
    <li {if $page && $page.title==$paged.title}class='active'{/if}><a href="{$ca_url}page/{$paged.url}/" >{$paged.title}</a></li>
	{/foreach}

    {foreach from=$HBaddons.client_submenu item=ad}
        <li ><a href="{$ca_url}{$ad.link}/" >{$ad.name}</a></li>
    {/foreach}
</ul>

{elseif $cmd=='tickets' || $cmd=='knowledgebase' || $cmd=='support'  || $cmd=='downloads'  || $cmd=='netstat'}

<ul class="nav nav-pills pa1">

    <li {if $cmd=='support'}class='active'{/if}><a href="{$ca_url}support/"  {if $cmd=='support'}class='active'{/if}>{$lang.supporthome}</a></li>
    <li {if $cmd=='tickets'}class='active'{/if}><a href="{if $logged=='1'}{$ca_url}tickets{else}{$ca_url}tickets/new/{/if}"  >{$lang.mytickets}</a></li>
	{if $enableFeatures.kb!='off'}
    <li {if $cmd=='knowledgebase'}class="active"{/if}><a href="{$ca_url}knowledgebase/"  >{$lang.knowledgebase}</a></li>
	{/if}
	{if $enableFeatures.downloads!='off'}
    <li  {if $cmd=='downloads'}class="active"{/if}><a href="{$ca_url}downloads/" >{$lang.downloads}</a></li>
	{/if}
	{if $enableFeatures.netstat!='off'}
    <li  {if $cmd=='netstat'}class="active"{/if}><a href="{$ca_url}netstat/" >{$lang.netstat}</a></li>
	{/if}


</ul>

{elseif $cmd=='cart' || $cmd=='checkdomain'}
<ul class="nav nav-pills pa1">
    <li  {if $cmd=='cart'}class='active'{/if}><a href="{$ca_url}cart/" >{$lang.placeorder}</a></li>
    {if $enableFeatures.domains!='off' && $domaincategories}
    {foreach from=$domaincategories item=cat}
    <li  {if $cmd=='checkdomain' && $domain_cat==$cat.id}class='active'{/if}><a href="{$ca_url}checkdomain/{$cat.slug}/" >{$cat.name}</a></li>
    {/foreach}
    {/if}

</ul>

{/if}





<div class="clear"></div>