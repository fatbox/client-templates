
<h2>{$lang.addfunds}</h2>


<div class="brcrm">{$lang.addfunds_d}</div>
<div class="p19">
    <form method="post" action="">
        <input type="hidden" name="make" value="addfunds" />
        <table border="0" cellspacing="0" cellpadding="3" width="100%">
            <tr>
                <td><label>{$lang.trans_amount}:</label> <input name="funds" class="styled span2" size="4" value="{$mindeposit}"/></td>
            </tr>
            <tr>
                <td><label>{$lang.trans_gtw}:</label>
                 <select name="gateway" class="styled ">{foreach from=$gateways key=gatewayid item=paymethod}
                    <option value="{$gatewayid}">{$paymethod}</option>
                    {/foreach}</select>
                </td>
            </tr>
        </table>
				 

        <div class="form-actions">
            <div class="left">
                {$lang.MinDeposit}: <strong>{$mindeposit|price:$currency}</strong> <br/>
                {$lang.MaxDeposit}: <strong>{$maxdeposit|price:$currency}</strong>
            </div>
            <div class="right">
                <input type="submit" class="btn btn-info btn-large" value="{$lang.addfunds}" style="font-weight:bold"/>
            </div>
            <div class="clear"></div>
        </div>
				{securitytoken}
    </form>
</div>