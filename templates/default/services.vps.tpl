{if $service}


{if $service.status=='Active'}
<div class="tabb">
 <div class="wbox">
  	<div class="wbox_header">
	{$lang.summary}
</div>
	<div class="wbox_content" style=" {if $commands.FastStat}background:#F3F3F3{/if}" id="statustab" >

<table width="100%" cellspacing="0" cellpadding="0" border="0" class="checker">
     
	 {if $commands.GetStatus}
	   <tr >
          <td width="160" align="right">{$lang.status}</td>
          <td><a href="#" onclick="return process('GetStatus',{$service.id})">{$lang.get_status}</a></td>
        </tr>
		{/if}
		{if $service.domain!=''}
		 <tr class="even">
          <td align="right" width="160">{$lang.hostname}</td>
          <td><a target="_blank" href="http://{$service.domain}">{$service.domain}</a></td>
        </tr>
		{/if}
        {if $service.extra.showlocation && isset($service.extra.showlocation.value) && $service.extra.showlocation.value == '1'}
            <tr >
              <td width="160" align="right">{$lang.Location}</td>
              <td>{$service.node}</td>
            </tr>
        {/if}
	  {if $commands.Reboot || $commands.Start || $commands.Stop}
	    <tr >
          <td align="right">{$lang.actions}</td>
          <td>{if $commands.Start}<a href="#" onclick="return process('Start',{$service.id})">{$lang.start}</a>{/if} {if $commands.Stop}<a href="#" onclick="return process('Stop',{$service.id})">{$lang.stop}</a>{/if} {if $commands.Reboot}<a href="#" onclick="return process('Reboot',{$service.id})">{$lang.reboot}</a>{/if}</td>
        </tr>
		
            {/if}
       {if $service.bw_limit!='0'}
      <tr class="even">
          <td align="right">{$lang.bandwidth}</td>
          <td>{$service.bw_limit} {$lang.gb}</td>
        </tr>
		{/if} {if $service.disk_limit!='0'}
        <tr>
          <td align="right">{$lang.disk_limit}</td>
          <td>{$service.disk_limit} {$lang.gb}</td>
        </tr>
		{/if}
   		{if $service.guaranteed_ram!='0'  && $service.guaranteed_ram!=''}
        <tr class="even">
          <td align="right">{$lang.memory}</td>
          <td>{$service.guaranteed_ram} {$lang.mb}</td>
        </tr>   {/if}
		{if $service.burstable_ram!='0' && $service.burstable_ram!=''}
        <tr>
          <td align="right">{$lang.burstable_ram}</td>
          <td>{$service.burstable_ram}  {$lang.mb}</td>
        </tr>   {/if}
   {if $service.vps_ip && $service.isvps}
	    <tr class="even">
          <td align="right">{$lang.ipadd}</td>
          <td>{$service.vps_ip}</td>
        </tr>
		{/if}
		{if $service.additional_ip && $service.isvps}
        <tr>
          <td align="right" valign="top">{$lang.additionalip}</td>
          <td>{foreach from=$service.additional_ip item=ip}{$ip}<br />{/foreach}</td>
        </tr>
		{/if}
		</table>
		 {if $commands.FastStat}
		 	
			<div id="fstat"></div>
			<script type="text/javascript">
			var iid={$service.id};	{literal}
			ajax_update('?cmd=clientarea&action=customfn&val=FastStat&id='+iid,{},'#fstat');
			{/literal}
			</script>
			
			
		 {/if}

</div></div></div>
{/if}


{if $service.status=='Active'}
{if $commands.RebuildOS}<div class="tabb" style="display:none;margin-bottom:10px;padding-bottom:5px;" id="_rebuild"></div>{/if}
{if ($commands.Statistics)} <div class="tabb" style="display:none;margin-bottom:10px;padding-bottom:5px;" id="_stats"></div>{/if}
{if ($commands.Console)} <div class="tabb" style="display:none;margin-bottom:10px;padding-bottom:5px;" id="_console"></div>{/if}
{if $commands.Backup}<div class="tabb" style="display:none;margin-bottom:10px;padding-bottom:5px;">{$lang.backup}</div>{/if}
{if $commands.ResetRootPassword}<div class="tabb" style="display:none;margin-bottom:10px;padding-bottom:5px;" id="_rootp"></div>{/if}
{/if}




{/if}