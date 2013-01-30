<div class="bordered-section article">
        <h2>{$lang.promocodes}</h2>



<div class="ribbon form-horizontal">

            <div class="control-group">
                <label for="appendedPrependedInput" class="control-label left" style="width:auto">{$lang.voucherinfo}</label>
                <div class="right">
                    <a href="{$ca_url}{$cmd}/addvoucher/" class="btn btn-success btn-large"><i class="icon-plus icon-white"></i> {$lang.newvoucher}</a>
                </div>
            </div>

    </div>
    <div class="ribbon-shadow-l"></div>
    <div class="ribbon-shadow-r"></div>


        <p class="p19">&nbsp;</p>
            <table cellspacing="0" cellpadding="0" border="0" width="100%" class="table table-striped fullscreen" style="text-align: center">
                <colgroup class="firstcol"></colgroup>
                <colgroup class="alternatecol"></colgroup>

                <colgroup class="firstcol"></colgroup>
                <colgroup class="alternatecol"></colgroup>

                <colgroup class="firstcol"></colgroup>
                <colgroup class="alternatecol"></colgroup>
                <tbody>
                    <tr>
                        <th>{$lang.vouchercode}</th>
                        <th>{$lang.discount}</th>
                        <th>{$lang.margin}</th>
                        <th>{$lang.used}</th>
                        {if 'config:AffVAudience:1'|checkcondition}<th>{$lang.audience}</th>{/if}
                        <th>{$lang.expires}</th>
                        <th style="width:30px;"></th>
                    </tr>
                </tbody>
                <tbody>
                    {if $vouchers}
                    {foreach from=$vouchers item=voucher name=vouchers}
                        <tr {if $smarty.foreach.vouchers.index%2 == 0}class="even"{/if}>

                            <td>{$voucher.code}</td>
                            <td>{if $voucher.type=='Percent'}{$voucher.value}%{else}{$voucher.value|price:$affiliate.currency_id}{/if}</td>
                            <td>{if $voucher.type=='Percent'}{$voucher.margin}%{else}{$voucher.margin|price:$affiliate.currency_id}{/if}</td>
                            <td>{$voucher.num_usage}</td>
                            {if 'config:AffVAudience:1'|checkcondition}<td>{if $voucher.clients=='new'}{$lang.newcustommers}{elseif $voucher.clients=='existing'}{$lang.existingcustommers}{else}{$lang.allcustommers}{/if}</td>{/if}
                            <td>{if $voucher.expires|dateformat:$date_format}{$voucher.expires|dateformat:$date_format}{else}-{/if}</td>
                            <td><a class="btn btn-mini" onclick="return confirm('{$lang.voucherdelconfirm}')" href="{$ca_url}{$cmd}/{$action}/&make=delete&id={$voucher.id}&security_token={$security_token}"><i class="icon-trash"></i></a></td>
                        </tr>
                    {/foreach}
                    {else}
                        <tr class="even">

                            <td colspan="12" style="text-align: center">{$lang.nothing}</td>

                        </tr>
                    {/if}
                </tbody>
            </table>

</div>