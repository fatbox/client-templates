<br />
<table border="0" cellpadding="0" cellspacing="0" width="100%">
	<tr>
	{if $enableFeatures.kb!='off' || $enableFeatures.downloads!='off'}	<td width="50%"  valign="top"  style="padding-right:5px">
		
		<div class="wbox">
  	<div class="wbox_header">{$lang.supresource}</div>
	<div class="wbox_content">
		
		<table border="0" cellpadding="0" cellspacing="3" width="100%">
				<tr>
					<td width="55"   valign="top"><img src="{$template_dir}icons/ico_resources.png" alt="{$lang.support}" /></td>
					<td   valign="top" width="40%">
						{if $enableFeatures.kb!='off'}	
						<strong>{$lang.knowledgebase}</strong><br />
						<a href="{$ca_url}knowledgebase/" class="list_item">{$lang.vsarticles}</a><br />
						{foreach from=$topkb item=kb}
						<a href="{$ca_url}knowledgebase/category/{$kb.id}/" class="list_item">{$kb.name}</a><br />
						{/foreach}
						<p align="right">
							<a href="{$ca_url}knowledgebase/" class="fs11">{$lang.dotmore}</a>
						</p>
						{/if}
					</td>
					<td   valign="top" width="40%">
						{if $enableFeatures.downloads!='off'}
						<strong>{$lang.downloads}</strong><br />
						<a href="{$ca_url}downloads/" class="list_item">{$lang.browsedownloads}</a><br />
						{foreach from=$topdw item=kb}
						<a href="{$ca_url}downloads/category/{$kb.id}/" class="list_item">{$kb.name}</a><br />
						{/foreach}
						<p align="right">
							<a href="{$ca_url}downloads/" class="fs11">{$lang.dotmore}</a>
						</p>
						{/if}
					</td>
					
				</tr>
				
		</table>
		
	</div>
	</div>
		
		</td>{/if}
		<td width="50%" valign="top" style="padding-left:5px">
		
		<div class="wbox">
  	<div class="wbox_header">{$lang.contactsupport}</div>
		<div class="wbox_content">
			<table border="0" cellpadding="0" cellspacing="3" width="100%">
				<tr>
					<td width="55"   valign="top"><img src="{$template_dir}icons/ico_support.png" alt="{$lang.support}" /></td>
					<td   valign="top">
						<strong>{$lang.contactus}</strong><br />
						{if $enableFeatures.chat!='off'}<a href="{$ca_url}chat/" class="list_item">{$lang.chat}</a><br />{/if}
						<a href="{$ca_url}tickets/" class="list_item">{$lang.ticketarchive}</a><br />
						<a href="{$ca_url}tickets/new/" class="list_item">{$lang.openticket}</a>
										 
					</td>
				</tr>	{if $openedtickets}
				<tr><td colspan="2" valign="top" style="padding:5px 0px;">
			
						 <strong>{$lang.openedtickets|capitalize}</strong>
						 
						 <table border="0" cellpadding="0" cellspacing="0" width="100%">
						 	{foreach from=$openedtickets item=ticket name=foo}	
						 	
							<tr><td><a href="{$ca_url}tickets/view/{$ticket.ticket_number}/" class="annoucement_date fs11 fsnormal">
							{$ticket.deptname} - 
							{if $ticket.client_read=='0'}<strong>{/if}
								{$ticket.subject|wordwrap:40:"<br />\n":true}
							{if $ticket.client_read==0}</strong>{/if}
							</a></td>
							<td align="right">
						
							</td></tr>
							
							{/foreach}
							
							<tr><td colspan="2" align="right"><a href="{$ca_url}tickets/" class="fs11">{$lang.dotmore}</a></td></tr>
						 </table>	
                        	
				</td></tr>{/if}	
			</table>
		</div>
	</div>
		</td>
		
	</tr>

</table>