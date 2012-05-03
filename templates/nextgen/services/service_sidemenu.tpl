
<ul class="leftmenu">

    <li {if !$widget}class="current"{/if}><a href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/"><span class="home">{$lang.servicedetails}</span></a></li>

    {if $service.status=='Active'}
        {foreach from=$widgets item=widg}
        <li {if $widget.name==$widg.name}class="current"{/if}><a  href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/&widget={$widg.name}{if $widg.id}&wid={$widg.id}{/if}"><span class="{$widg.name}">
                    <img src="{$system_url}{$widg.config.smallimg}" alt="" />{if $lang[$widg.name]}{$lang[$widg.name]}{elseif $widg.fullname}{$widg.fullname}{else}{$widg.name}{/if}</span></a></li>
        {/foreach}
    {/if}


    {*  Note - stuff below is left only for backwards compatibility with older HostBill releases / modules
        like Singlehop or Linode modules.

        If you do not use those, its safe to remove it. from line below to EOF line  *}


	{if $service.status=='Active' && $service.isvpstpl}
	{if $commands.RebuildOS} 	<li><a href="#" onclick="return callcustomfn('RebuildOS',{$service.id},'#_rebuild',true)"><span class="cog">{$lang.reload_os}</span></a></li>{/if}
	{if $commands.Backup}	<li> <a class="tchoice" href="#"><span class="cog">{$lang.backup}</span></a> </li>{/if}
	{if $commands.ResetRootPassword} 	<li><a onclick="return process('ResetRootPassword',{$service.id},'#_rootp')" href="#"><span class="cog">{$lang.reset_root}</span></a></li>{/if}
	{if ($commands.Statistics)}	<li> <a  href="#" onclick="return callcustomfn('Statistics',{$service.id},'#_stats')"><span class="cog">{$lang.Statistics}</span></a></li>{/if}
	{if ($commands.Console)}	<li> <a  href="#" onclick="return callcustomfn('Console',{$service.id},'#_console')"><span class="cog">{$lang.Console}</span></a></li>{/if}


	{/if}
	{if $service.status=='Active'}{foreach from=$commands item=command}
	{if $service.isvpstpl && ($command=='RebuildOS' || $command=='Backup' || $command=='ResetRootPassword' || $command=='Statistics' || $command=='Console' || $command=='GetStatus'  || $command=='Stop'  || $command=='Start'  || $command=='Reboot' || $command=='Shutdown'  || $command=='FastStat' || $command=='PowerON' || $command=='PowerOFF' || $command=='Destroy' || $command=='VMDetails')}
	{else}
    <li><a href="{$ca_url}clientarea&action=services&service={$service.id}&cid={$service.category_id}&customfn={$command}" onclick="return callcustomfn('{$command}',{$service.id},'#_ocustom',true)"><span class="cog">{if $lang.$command}{$lang.$command}{else}{$command}{/if}</span></a></li>
	{/if}


    {/foreach}{/if}


    {*   EOF: Its safe to remove to line avove *}


    

    {if $enableFeatures.dnsmanagement!='off' && $dnsmodule_id}<li><a href="{$ca_url}module&amp;module={$dnsmodule_id}"><span>{$lang.mydns}</span></a></li>{/if}
 
    {foreach from=$haveaddons item=newaddon}
        <li><a class="no-restriction" href="{$ca_url}cart&amp;action=add&amp;cat_id=addons&amp;id={$newaddon.id}&amp;account_id={$service.id}&amp;addon_cycles[{$newaddon.id}]={$newaddon.paytype}"><span class="plus">{$lang.Add} {$newaddon.name}</span></a></li>
    {/foreach}

    {if $service.status!='Terminated' && $service.status!='Cancelled'}<li class="last"><a href="{$ca_url}clientarea&action=services&service={$service.id}&cid={$service.category_id}&cancel" style="color:red"><span class="cancel">{$lang.cancelrequest}</span></a></li>{/if}


</ul>

{literal} 
<script type="text/javascript">
	
    function process(f,id,pole) {
        if(f=='Start' || f=='Stop' || f=='Reboot' ||  f=='GetStatus')
           ajax_update('?cmd=clientarea&action=checkstatus&do='+f+'&id='+id,{},'#vpsdetails');
             else
       callcustomfn(f,id,pole);
   return false;
    }
	
    function callcustomfn(f,id,pole) {
        $('#extrafields').hide();
        $('#extrafields #content_field').html('');
        $('#extrafields').show();
        ajax_update('?cmd=clientarea&action=customfn&val='+f+'&id='+id,{},'#extrafields #content_field');
		
	
        return false;
    }
</script>
{/literal}