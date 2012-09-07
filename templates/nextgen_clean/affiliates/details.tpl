<div class="bordered-section article">
<h2 {if !$payout}class="bbottom"{/if}>{$lang.affiliate}</h2>


{if $payout}


<div class="ribbon form-horizontal">

            <div class="control-group">
                <label for="appendedPrependedInput" class="control-label left" style="width:auto">{$lang.withdrawinfo}</label>
                <div class="right">
                    <a href="{$ca_url}tickets/new/" class="btn btn-success btn-large"><i class="icon-ok-sign icon-white"></i> {$lang.payout}</a>
                </div>
            </div>

    </div>
    <div class="ribbon-shadow-l"></div>
    <div class="ribbon-shadow-r"></div>
{/if}
<div class="p19"><h3>{$lang.Statistics}</h3></div>

<table width="100%" border=0 class="table table-striped fullscreen" cellspacing="0">

    <tbody>
        <tr>
            <td align="right" width="160">{$lang.Commissions}:</td>
            <td ><strong>{$stats.monthly_commision}</strong> / <strong>{$stats.total_commision}</strong> ({$lang.thismonth} / {$lang.total})</td>
        </tr>
        <tr class="even">
            <td align="right">{$lang.referred}</td>
            <td >{$stats.monthly_visits} / {$stats.total_visits} ({$lang.thismonth} / {$lang.total})</td>
        </tr>
        <tr >
            <td align="right">{$lang.singupreferred}</td>
            <td >{$stats.monthly_singups} / {$stats.total_singups} ({$lang.thismonth} / {$lang.total})</td>
        </tr>
        <tr class="even">
            <td align="right">{$lang.curbalance}</td>
            <td >{$affiliate.balance|price:$affiliate.currency_id}</td>
        </tr>
    </tbody>
</table>



</div>
<div class="divider"></div>
{if $integration_code!=''}
<div class="row">
    <div class="span6">
        <h3>{$lang.intcodes}</h3>
        <pre class="prettyprint linenums">{$integration_code}</pre>
        </div>
    <div class="span6">
        
   
        <h3>{$lang.preview}</h3>
        {$integration_code}
    </div>
    <div class="clear"></div>
</div>

{/if}