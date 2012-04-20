
{if $invoices}
{foreach from=$invoices item=invoice name=foo}
 <tr {if $smarty.foreach.foo.index%2 == 0}class="even"{/if}>
     
      <td><a href="{$ca_url}clientarea/invoice/{$invoice.id}/" target="_blank">{if $proforma && $invoice.status=='Paid' && $invoice.paid_id!=''}{$invoice.paid_id}{else}{$invoice.date|invprefix:$prefix}{$invoice.id}{/if}</a></td>

      <td align="center">{$invoice.date|dateformat:$date_format}</td>
      <td align="center">{$invoice.duedate|dateformat:$date_format}</td>
      <td >{$invoice.total|price:$invoice.currency_id}</td>

      <td align="center"><span class="{$invoice.status}">{$lang[$invoice.status]}</span></td>
      <td align="center"><a href="{$ca_url}clientarea/invoice/{$invoice.id}/" target="_blank" class="view3">view</a></td>

    </tr>
{/foreach}
  {/if}