<ul class="nav nav-tabs">
    <li ><a href="{$ca_url}clientarea/">{$lang.dashboard}</a></li>
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="{$ca_url}cart/">{$lang.order}<b class="caret"></b></a>
        <div class="dropdown-menu">
            {include file='menus/menu.dropdown.cart.tpl'}
        </div>

    </li>

    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="{$ca_url}clientarea/">{$lang.services}<b class="caret"></b></a>
        <div class="dropdown-menu">
            {include file='menus/menu.dropdown.services.tpl'}
        </div>
    </li>

    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="{$ca_url}clientarea/">{$lang.account}<b class="caret"></b></a>
        <div class="dropdown-menu">
            {include file='menus/menu.dropdown.account.tpl'}
        </div>
    </li>


    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="{$ca_url}support/">{$lang.support}<b class="caret"></b></a>
        <div class="dropdown-menu">
            {include file='menus/menu.dropdown.support.tpl'}
        </div>
    </li>


    {if $enableFeatures.affiliates!='off'}
    <li class="{if $clientdata.is_affiliate}dropdown{/if}"><a href="{$ca_url}affiliates/" {if $clientdata.is_affiliate}class="dropdown-toggle" data-toggle="dropdown"{/if}>{$lang.affiliates}{if $clientdata.is_affiliate}<b class="caret"></b>{/if}</a>
       {if $clientdata.is_affiliate}<div class="dropdown-menu">
            {include file='menus/menu.dropdown.affiliates.tpl'}
        </div>{/if}
    </li>
	{/if}

    {foreach from=$HBaddons.client_mainmenu item=ad}
        <li ><a href="{$ca_url}{$ad.link}/" >{$ad.name}</a></li>
    {/foreach}
</ul>


