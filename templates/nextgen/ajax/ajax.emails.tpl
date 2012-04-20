{if $emails}
{foreach from=$emails item=email name=foo}
<tr {if $smarty.foreach.foo.index%2 == 0}class="even"{/if}>
    <td><a href="{$ca_url}clientarea/emails/{$email.id}/" >{$email.subject}</a></td>
    <td align="center">{$email.date|dateformat:$date_format}</td>
</tr>
	{/foreach}
{else}
<tr><td colspan="2">{$lang.nothing}</td></tr>
{/if}