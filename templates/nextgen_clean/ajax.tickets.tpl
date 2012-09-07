{if $action=='default'}
{if $tickets}
{foreach from=$tickets item=ticket name=foo}
<tr {if $smarty.foreach.foo.index%2 == 0}class="even"{/if}>
    <td >
        <span class="label label-{$ticket.status}">{$lang[$ticket.status]}</span>
    </td>
    <td>
        {if $ticket.client_read=='0'}<strong>{/if}<a href="{$ca_url}tickets/view/{$ticket.ticket_number}/">{$ticket.subject|wordwrap:40:"<br />\n":true}</a>{if $ticket.client_read==0}</strong>{/if}</td>
    <td>{$ticket.deptname}</td>
    <td>{$ticket.date|dateformat:$date_format}</td>
</tr>
{/foreach}
{/if}
{elseif $action=='kbhint'}{if $replies}
<div style="margin-top:6px;margin-bottom:6px;"><strong>{$lang.kbhint}</strong><br />


		{foreach from=$replies item=reply}
    <div style="float:left;width:290px;padding:3px;"><a href='{$ca_url}knowledgebase/article/{$reply.id}/' target="_blank"><i class="icon-file"></i> {$reply.title}</a>
        <span  class="fits fs11">{$lang.match} {$reply.fits} %</span><br />
		{$reply.body}
    </div>
		{/foreach}
    <div class="clear"></div>
</div>
{/if}{/if}