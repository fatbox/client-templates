{if $service.custom}

<table width="100%" cellspacing="0" cellpadding="0" border="0" class="table table-striped fullscreen" >
    {foreach from=$service.custom item=cst}
    <tr >
        <td align="right" width="160"><strong>{$cst.name}</strong>  </td>
        <td>{include file=$cst.configtemplates.clientarea} </td>
    </tr>
    {/foreach}
</table>
{/if}