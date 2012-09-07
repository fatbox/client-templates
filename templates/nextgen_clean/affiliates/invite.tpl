<h1 class="affiliates2">{$lang.affiliates|capitalize}</h1>
    

    <h2 style="margin:10px 0px;">{$lang.ycm} {if $config.AffType=='Percent'}{$config.AffValue}%{else}{$config.AffValue|price:$currency}{/if} {$lang.persale}</h2>
    <div style="font-size:14px;line-height:20px">
        {$lang.notaffiliateyet}
        {if $config.AffBonus>0}
            <strong>{$lang.get}{$config.AffBonus|price:$currency} {$lang.justsign}</strong>
        {/if}
    </div>
    <br />

    <form action="" method="post">
        <input type="hidden" value="activateaffiliate" name="make" />
        <center>
            <input type="submit" class="btn btn-success btn-large" style="font-weight:bold;font-size:16px;padding:15px 10px;" value="{$lang.becomeaffiliate}"/>
        </center>
        {securitytoken}
    </form>
    <br />
    <br />