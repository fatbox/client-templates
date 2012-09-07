<div class="cntn"><div class="row">
    <div class="span8">
        <div class="row ">

            {if $offer_total>0}
            <div class="span5">
                <ul class="span5 servicesmenu">
                    <li class="nav-header span5">{$lang.my_servicesinfo}</li>
                    {foreach from=$offer item=offe}
	{if $offe.total>0}
                    <li ><a href="{$ca_url}clientarea/services/{$offe.slug}/" >{$offe.name} <span class="counter">{$offe.total}</span></a></li>
	{/if}
	{/foreach}
                    {if $offer_domains}
                    <li ><a href="{$ca_url}clientarea/domains/" >{$lang.domains} <span class="counter">{$offer_domains}</span></a></li>
                    {/if}
                </ul>

            </div>
            {else}
            <div class="span5 introduction">
                <p class="silver">{$lang.servicesintroduction}</p>
                <button class="btn btn-success" href="index.php?/cart/"><i class="icon-shopping-cart icon-white"></i> {$lang.proceedtocart}</button>

            </div>
            {/if}
            <div class="span3">
                <center>
                    <div class="iconwrap"><span style="" class="iconfont-gear iconfont-size5 silver"></span><br/></div>
                    <p class="silver">{$lang.my_services}</p>
                </center>
            </div>

        </div>
    </div>
</div></div>