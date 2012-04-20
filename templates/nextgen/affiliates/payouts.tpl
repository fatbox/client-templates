<div class="bordered-section article">
    <h2 class="bbottom">{$lang.withdrawallogs}</h2>
    <table cellspacing="0" cellpadding="0" border="0" width="100%" class="table table-striped fullscreen">
        <colgroup class="firstcol"></colgroup>
        <colgroup class="alternatecol"></colgroup>

        <colgroup class="firstcol"></colgroup>
        <colgroup class="alternatecol"></colgroup>

        <colgroup class="firstcol"></colgroup>
        <tbody>
            <tr>
                <th>{$lang.date}</th>
                <th>{$lang.withdrawn}</th>
                <th>{$lang.note}</th>
            </tr>
        </tbody>
        <tbody>
            {if $logs}
            {foreach from=$logs item=log name=logs}
            <tr {if $smarty.foreach.logs.index%2 == 0}class="even"{/if}>

                <td style="text-align:center">{$log.date|dateformat:$date_format}</td>
                <td style="text-align:center">{$log.amount|price:$affiliate.currency_id}</td>
                <td style="width:50%">{$log.note}</td>
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