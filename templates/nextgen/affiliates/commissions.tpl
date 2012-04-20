<div class="bordered-section article">
<h2 class="bbottom">{$lang.yreferrals}</h2>
<p class="p19">
    {$lang.referals_t}
</p>
<table cellspacing="0" cellpadding="0" border="0" width="100%" class="table table-striped fullscreen">
    <colgroup class="firstcol"></colgroup>
    <colgroup class="alternatecol"></colgroup>

    <colgroup class="firstcol"></colgroup>
    <colgroup class="alternatecol"></colgroup>

    <colgroup class="firstcol"></colgroup>
    <tbody>
        <tr>
            <th>{$lang.signupdate}</th>
            <th>{$lang.services}</th>
            <th>{$lang.total}</th>
            <th>{$lang.commission}</th>
            <th>{$lang.status}</th>
        </tr>
    </tbody>
    <tbody>
        {if $orders}
        {foreach from=$orders item=order name=orders}
        <tr {if $smarty.foreach.orders.index%2 == 0}class="even"{/if}>

            <td>{$order.date_created|dateformat:$date_format}</td>
            <td>
                {if $order.acstatus}
                {$lang.Account}: {$order.pname}
                {/if}
                {if $order.domstatus}
                <br />{$lang.Domain}: {$order.domain}
                {/if}
            </td>
            <td align="center">{$order.total|price:$order.currency_id}</td>
            <td align="center">{$order.commission|price:$affiliate.currency_id}</td>
            <td align="center"><strong>{if $order.paid=='1'}{$lang.approved}{else}{$lang.Pending}{/if}</strong></td>
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