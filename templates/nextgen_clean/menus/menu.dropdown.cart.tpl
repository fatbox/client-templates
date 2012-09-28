<div class="cntn"><div class="row">
    <div class="span8">
        <div class="row ">
            <div class="span5">
                <ul class="span5">
                    <li class="nav-header span5">{$lang.placeorder}</li>
                    {foreach from=$orderpages item=op}
                        <li><a href="{$ca_url}cart/{$op.slug}/">{$op.name}</a></li>
                    {/foreach}


                </ul>
            </div>
            <div class="span3">
                <center>
                    <div class="iconwrap"><span style="" class="iconfont-cloud iconfont-size5 silver"></span><br/></div>
                    <p class="silver">{$lang.checkoffersphrase}</p>
                    <button href="{$ca_url}cart/" class="btn btn-success"><i class="icon-shopping-cart icon-white"></i> {$lang.proceedtocart}</button>
                </center>
            </div>
        </div>
    </div>
</div></div>