{if $action=='default'}
{if $tickets}
{foreach from=$tickets item=ticket name=foo}
 <tr {if $smarty.foreach.foo.index%2 == 0}class="even"{/if}>
     <td>{$ticket.date|dateformat:$date_format}</td>
     
      <td>{$ticket.deptname}</td>
	   <td>{if $ticket.client_read=='0'}<strong>{/if}<a href="{$ca_url}tickets/view/{$ticket.ticket_number}/">{$ticket.subject|wordwrap:40:"<br />\n":true}</a>{if $ticket.client_read==0}</strong>{/if}</td>
      <td align="center"><span class="{$ticket.status}">{$lang[$ticket.status]}</span></td>
       <td  align="center"><a href="{$ca_url}tickets/view/{$ticket.ticket_number}/" class="view3">view</a></td>
    </tr>
{/foreach}
  {/if}
  {elseif $action=='kbhint'}{if $replies}
<div style="margin-top:6px;margin-bottom:6px;"><strong>{$lang.kbhint}</strong><br />


		{foreach from=$replies item=reply}
		<div style="float:left;width:290px;padding:3px;"><a href='{$ca_url}knowledgebase/article/{$reply.id}/' class="annoucement_date" target="_blank">{$reply.title}</a>
		<span  class="fits">{$lang.match} {$reply.fits} %</span><br />
		{$reply.body}
</div>
		{/foreach}
	<div class="clear"></div>
 </div>
  {/if}{/if}