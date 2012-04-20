
	{if $logs}
	{foreach from=$logs item=log name=foo}
	 <tr {if $smarty.foreach.foo.index%2 == 0}class="even"{/if}>

		  <td align="center">{$log.date|dateformat:$date_format}</td>
		  <td >{$log.description}</td>
		  <td align="center" style="color:{if $log.result}green{else}red{/if}">{if $log.result}{$lang.success}{else}{$lang.fail}{/if}</td>
		  <td align="center">
			{if $log.type == 'account'}
				<a href="?cmd=clientarea&action=services&service={$log.id}" target="_blank" class="view3">ID {$log.id}</a>
			{elseif $log.type=='domain'}
				<a href="?cmd=clientarea&action=domains&id={$log.id}" target="_blank" class="view3">ID {$log.id}</a>
			{else}
				<a href="#" target="_blank" class="view3" onclick="return false;"></a>
			{/if}
			</td>  
		</tr>
	{/foreach}
	{/if}