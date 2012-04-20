<div id="sidemenu">
  <div class="wbox" {if $service.status=='Terminated' || $service.status=='Cancelled' || $service.status=='Fraud'}style="display:none"{/if}>
  	<div class="wbox_header">
{$lang.servicemanagement}
	</div>
	<div class="wbox_content">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td valign="top" width="42">
			<img src="{$template_dir}img/cf_boption.png"  alt=""/>
			</td>
			<td>
			<ul class="subside">
			
					
				
			
			
			{if $service.status=='Active' }	<li><a  href="#" onclick="$('#billing_info').toggle();return false;"><strong>{$lang.billing_info|capitalize}</strong></a></li>

                            {foreach from=$widgets item=widg}
                                <li><a  href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/&widget={$widg.name}{if $widg.id}&wid={$widg.id}{/if}">{if $lang[$widg.name]}{$lang[$widg.name]}{elseif $widg.fullname}{$widg.fullname}{else}{$widg.name}{/if}</a></li>
                            {/foreach}
                {/if}
			
			{if $service.isvpstpl && $service.status=='Active'}<li><a class="tchoice" href="#">{$lang.summary}</a></li>{/if}
		
		
	{if $service.status=='Active' && $service.isvpstpl}
	{if $commands.RebuildOS} 	<li><a href="#" onclick="return callcustomfn('RebuildOS',{$service.id},'#_rebuild',true)">{$lang.reload_os}</a></li>{/if}
	{if $commands.Backup}	<li> <a class="tchoice" href="#">{$lang.backup}</a> <br />{/if}
	{if $commands.ResetRootPassword} 	<li><a onclick="return process('ResetRootPassword',{$service.id},'#_rootp')" href="#">{$lang.reset_root}</a></li>{/if}
	{if ($commands.Statistics)}	<li> <a  href="#" onclick="return callcustomfn('Statistics',{$service.id},'#_stats')">{$lang.Statistics}</a></li>{/if}
	{if ($commands.Console)}	<li> <a  href="#" onclick="return callcustomfn('Console',{$service.id},'#_console')">{$lang.Console}</a></li>{/if}
	
	
	{/if}
	{if $service.status=='Active'}{foreach from=$commands item=command}
	{if $service.isvpstpl && ($command=='RebuildOS' || $command=='Backup' || $command=='ResetRootPassword' || $command=='Statistics' || $command=='Console' || $command=='GetStatus'  || $command=='Stop'  || $command=='Start'  || $command=='Reboot' || $command=='Shutdown'  || $command=='FastStat' || $command=='PowerON' || $command=='PowerOFF' || $command=='Destroy' || $command=='VMDetails')}
	{else}
		<li><a href="{$ca_url}clientarea&action=services&service={$service.id}&cid={$service.category_id}&customfn={$command}" onclick="return callcustomfn('{$command}',{$service.id},'#_ocustom',true)">{if $lang.$command}{$lang.$command}{else}{$command}{/if}</a></li>
	{/if}
    
              {/foreach}{/if}
			  {if $enableFeatures.dnsmanagement!='off' && $dnsmodule_id}	<li><a href="{$ca_url}module&amp;module={$dnsmodule_id}">{$lang.mydns}</a></li>{/if}
		
		

		{if $addons}{foreach from=$addons item=addon}
			{if $addon.templated}
			{foreach from=$addon.templated item=it}<li><a href="{$ca_url}clientarea&amp;action=addonmodule&amp;id={$service.id}&amp;addon_id={$addon.id}&amp;call={$it}" onclick="return process('{$it}',{$service.id},'#_ocustom',{$addon.id})">{if $lang.$it}{$lang.$it}{else}{$it}{/if}</a></li>{/foreach}{/if}
		
{if $addon.methods}{foreach from=$addon.methods item=it}<li><a href="{$ca_url}clientarea&amp;action=addonmodule&amp;id={$service.id}&amp;addon_id={$addon.id}&amp;call={$it}">{if $lang.$it}{$lang.$it}{else}{$it}{/if}</a></li>{/foreach}{/if}
		{/foreach}
		{/if}
		{foreach from=$haveaddons item=newaddon}
			<li><a href="{$ca_url}cart&amp;action=add&amp;cat_id=addons&amp;id={$newaddon.id}&amp;account_id={$service.id}&amp;addon_cycles[{$newaddon.id}]={$newaddon.paytype}">{$lang.Add} {$newaddon.name}</a></li>
		{/foreach}
		
		{if $service.status!='Terminated' && $service.status!='Cancelled'}	<li class="last"><a href="{$ca_url}clientarea&action=services&service={$service.id}&cid={$service.category_id}&cancel" style="color:red">{$lang.cancelrequest}</a></li>{/if}
		
		
		</ul>
			</td>
		</tr>
	</table>
		
		
		
		  
		
		
</div></div>

</div>
		
{literal} 
	<script type="text/javascript">
	$('#sidemenu').TabbedMenu();
	
	function process(f,id,pole,addon) {
	var field='#statustab';
	if(pole)
		field=pole;
	$(field).addLoader();
	
	if(addon) {
		ajax_update('?cmd=clientarea&action=addonmodule',{call:f,id:id,addon_id:addon,templated:true},field);
	}
	else{
		ajax_update('?cmd=clientarea&action=checkstatus&do='+f+'&id='+id,{},field);
	}
	
		
	
	return false;
	}
	
	function callcustomfn(f,id,pole,force) {
	
	var field='#statustab';
	if(pole)
		field=pole;
	
	$('.tabb').hide();
	$(field).show();	
		
	if($(field).html().length>2 && !force)
		return false;	
	$(field).addLoader();
	
		ajax_update('?cmd=clientarea&action=customfn&val='+f+'&id='+id,{},field);
		
	
	return false;
	}
	</script>
{/literal}
<div class="clear"></div>