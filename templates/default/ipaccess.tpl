
<form action='' method='post' >
    <input type="hidden" name="make" value="addrule" />
    <table width="100%" border=0 class="checker" cellspacing="0">
		<tr>
			<td align="right" width="160">{$lang.ipsubnet}</td>
			<td >
				<input name="rule" type="text" class="styled"/> <input name="add" type="submit" value="{$lang.addipsubnet}"  class="padded" />
			</td>
		</tr>
		<tr class="even">
			<td align="right" >{$lang.currentipadd}</td>
			<td >
				{$yourip}
			</td>
		</tr>
		<tr class="lastone">
			<td align="right" >{$lang.Legend}</td>
			<td >
				<a href="#" class="toggle" onclick="$('.toggle').toggle(); return false;" > {$lang.show|capitalize}</a>
				<a href="#" style="display:none" class="toggle" onclick="$('.toggle').toggle(); return false;" >{$lang.hide|capitalize}</a>                 
				<ul style="list-style:inside;padding:0;display:none" class="toggle" >
				Rule formats:
					<li> <strong>all</strong> - keyword matching all IPs</li>
					<li> <strong>xxx.xxx.xxx.xxx</strong> - Single IP</li>
					<li> <strong>xxx.xxx.xxx.xxx/M</strong> - IP with Mask in CIDR format</li>
					<li> <strong>xxx.xxx.xxx.xxx/mmm.mmm.mmm.mmm</strong> - IP with Mask in dotted quad format</li>
				</ul>
				<ul style="list-style:inside;padding:0;display:none" class="toggle">
				Example rules:
					<li><strong>120.123.123.57/28</strong> matches IP from 120.123.123.48 to 120.123.123.63 </li>
					<li><strong>120.123.123.57/24</strong> matches IP from 120.123.123.0 to 120.123.123.255 </li>
					<li><strong>120.123.123.57/16</strong> matches IP from 120.123.0.0 to 120.123.255.255</li>
					<li><strong>120.123.123.57/8</strong> matches IP from 120.0.0.0 to 120.255.255.255</li>
				</ul>
			</td>
		</tr>
	</table>
</form>
<br/>
<table width="100%" border=0 class="checker" cellspacing="0">
	<tr>
		
		<th align="left">{$lang.ipsubnet}</th>
		<th style="width:100px"></th>
	</tr>
	{if $rules }
	{foreach from=$rules item=rule name=rules}
	<tr class="{if $smarty.foreach.rules.index % 2 == 0}even{/if}{if $smarty.foreach.rules.last} lastone{/if}">
		
		<td>{if $rule.rule == 'all'}{$lang.allaccess}{else}{$rule.rule}{/if}</td>
		<td><a class="deleteico" href="{$ca_url}{$cmd}/{$action}/&make=delrule&id={$rule.id}">{$lang.delete}</a></td>
	</tr>
	{/foreach}
	{else}
	<tr class="even lastone">
		
		<td colspan="2">{$lang.norules} - {$lang.allaccess}</td>
	</tr>
	{/if}
	
</table>
{securitytoken}

{* CLOSE .wbox_content, .wbox divs from parent*}
</div></div>