{if $service.status=='Active'}

<div id="extrafields" style="display:none;margin-bottom:19px;"><a class="close">&times;</a>
    <div class="ribbon form-horizontal">
        <div id="content_field"></div>
    </div>
    <div class="ribbon-shadow-l"></div>
    <div class="ribbon-shadow-r"></div>
</div>

<div id="vpsdetails">
    <table width="100%" cellspacing="0" cellpadding="0" border="0" class="table table-striped fullscreen" style="margin-bottom:0px;">

	 {if $commands.GetStatus}
    <tr >
        <td width="160" align="right"><strong>{$lang.status}</strong></td>
        <td valign="middle"><a href="#" onclick="return process('GetStatus',{$service.id})">{$lang.get_status}</a></td>
    </tr>
		{/if}
		{if $service.domain!=''}
    <tr class="even">
        <td align="right" width="160"><strong>{$lang.hostname}</strong></td>
        <td valign="middle"><a target="_blank" href="http://{$service.domain}">{$service.domain}</a></td>
    </tr>
		{/if}
    {if $service.extra.showlocation && isset($service.extra.showlocation.value) && $service.extra.showlocation.value == '1'}
    <tr >
        <td width="160" align="right"><strong>{$lang.Location}</strong></td>
        <td valign="middle">{$service.node}</td>
    </tr>
    {/if}
	  {if $commands.Reboot || $commands.Start || $commands.Stop}
    <tr >
        <td align="right"><strong>{$lang.actions}</strong></td>
        <td valign="middle">{if $commands.Start}<a href="#" onclick="return process('Start',{$service.id})">{$lang.start}</a>{/if} {if $commands.Stop}<a href="#" onclick="return process('Stop',{$service.id})">{$lang.stop}</a>{/if} {if $commands.Reboot}<a href="#" onclick="return process('Reboot',{$service.id})">{$lang.reboot}</a>{/if}</td>
    </tr>

    {/if}
    {if $service.bw_limit!='0'}
    <tr class="even">
        <td align="right"><strong>{$lang.bandwidth}</strong></td>
        <td valign="middle">{$service.bw_limit} {$lang.gb}</td>
    </tr>
		{/if} {if $service.disk_limit!='0'}
    <tr>
        <td align="right"><strong>{$lang.disk_limit}</strong></td>
        <td valign="middle">{$service.disk_limit} {$lang.gb}</td>
    </tr>
		{/if}
   		{if $service.guaranteed_ram!='0'  && $service.guaranteed_ram!=''}
    <tr class="even">
        <td align="right"><strong>{$lang.memory}</strong></td>
        <td valign="middle">{$service.guaranteed_ram} {$lang.mb}</td>
    </tr>   {/if}
		{if $service.burstable_ram!='0' && $service.burstable_ram!=''}
    <tr>
        <td align="right"><strong>{$lang.burstable_ram}</strong></td>
        <td valign="middle">{$service.burstable_ram}  {$lang.mb}</td>
    </tr>   {/if}
    {if $service.vps_ip && $service.isvps}
    <tr class="even">
        <td align="right"><strong>{$lang.ipadd}</strong></td>
        <td valign="middle">{$service.vps_ip}</td>
    </tr>
		{/if}
		{if $service.additional_ip && $service.isvps}
    <tr>
        <td align="right" valign="top"><strong>{$lang.additionalip}</strong></td>
        <td valign="middle">{foreach from=$service.additional_ip item=ip}{$ip}<br />{/foreach}</td>
    </tr>
		{/if}
</table>
</div>		 {if $commands.FastStat}

<div id="fstat"></div>
<script type="text/javascript">
    var iid={$service.id};	{literal}
    ajax_update('?cmd=clientarea&action=customfn&val=FastStat&id='+iid,{},'#fstat');
    {/literal}
</script>


		 {/if}






{/if}