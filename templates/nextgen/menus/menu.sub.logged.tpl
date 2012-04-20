{if ($cmd=='root' || $cmd=='page') && $infopages}
<ul class="nav nav-pills pa1">
    {foreach from=$infopages item=paged}
    <li {if $page && $page.title==$paged.title}class='active'{/if}><a href="{$ca_url}page/{$paged.url}/" >{$paged.title}</a></li>
	{/foreach}
</ul>

{elseif $cmd=='affiliates' && $affiliate}

<ul class="nav nav-pills pa1">
    <li {if $action=='default'}class='active'{/if}><a  href="{$ca_url}{$cmd}/">{$lang.affiliatecenter}</a></li>
    <li {if $action=='commissions'}class='active'{/if}><a  href="{$ca_url}{$cmd}/commissions/">{$lang.mycommisions}</a></li>
    <li {if $action=='vouchers' || $action=='addvoucher'}class='active'{/if}><a  href="{$ca_url}{$cmd}/vouchers/">{$lang.myvouchers}</a></li>
    <li {if $action=='payouts'}class='active'{/if}><a  href="{$ca_url}{$cmd}/payouts/">{$lang.payouts}</a></li>
</ul>

{elseif $cmd=='clientarea' || $cmd == 'dns' || $cmd=='profiles'}

{if $action!='details' && $action!='password' && $action!='ccard'  && $action!='addfunds'   && $action!='ipaccess' && $action!='invoices' && $action!='history' && $action!='emails' && $cmd!='profiles' && $action!='_default' && $action!='default'}
<ul class="nav nav-pills pa1">
    <li  {if $cmd=='clientarea' && $action=='default'}class='active'{/if}><a  href="{$ca_url}clientarea/">{$lang.summary}</a></li>

            {if $offer}
                    {foreach from=$offer item=o}
    <li  {if $action=='services' && $cid==$o.id || $service.category_id==$o.id}class='active'{/if}><a href="{$ca_url}clientarea/services/{$o.slug}/"  >{$o.name}</a></li>
                    {/foreach}
            {/if}


             {if $enableFeatures.domains!='off'}
    <li {if $cmd=='clientarea' && $action=='domains'}class='active'{/if}><a href="{$ca_url}clientarea/domains/" >{$lang.mydomains}</a></li>
    {/if}
</ul>
{else}
<div class="divider"></div>
{/if}

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