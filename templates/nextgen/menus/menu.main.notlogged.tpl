<ul class="nav nav-tabs">
    <li class="{if $cmd=='root'}{/if}"><a href="{$ca_url}">{$lang.homepage}</a></li>
    <li class="{if $cmd=='cart' || $cmd=='checkdomain'}{/if} dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="{$ca_url}cart/">{$lang.order}<b class="caret"></b></a>
        <div class="dropdown-menu">
            {include file='menus/menu.dropdown.cart.tpl'}
        </div>

    </li>
    <li class="{if $cmd=='tickets' || $cmd=='chat' || $cmd=='knowledgebase' || $cmd=='downloads' || $cmd=='netstat'|| $cmd=='support'}{/if} dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="{$ca_url}{if $enableFeatures.kb!='off'}knowledgebase/{else}tickets/new/{/if}">{$lang.support}<b class="caret"></b></a>
        <div class="dropdown-menu">
            {include file='menus/menu.dropdown.support.tpl'}
        </div>
    </li>
    
    <li class="{if $cmd=='clientarea' || $cmd=='dns'}{/if}"><a href="{$ca_url}clientarea/">{$lang.clientarea}</a></li>
    
    {if $enableFeatures.affiliates!='off'}
    <li class="{if $cmd=='affiliates'}{/if}"><a href="{$ca_url}affiliates/">{$lang.affiliates}</a></li>
	{/if}
  {foreach from=$HBaddons.client_mainmenu item=ad}
        <li ><a href="{$ca_url}{$ad.link}/" >{$ad.name}</a></li>
    {/foreach}
</ul>


