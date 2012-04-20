<div id="mainmenu">
	<a href="{$ca_url}" {if $cmd=='root'}class="active"{/if}>{$lang.homepage}</a>
	<span class="separator"></span>
	<a href="{$ca_url}cart/" {if $cmd=='cart' || $cmd=='checkdomain'}class="active"{/if}>{$lang.order}</a>	
	<span class="separator"></span>
	<a href="{$ca_url}clientarea/"  {if $cmd=='clientarea' || $cmd=='dns'}class="active"{/if}>{$lang.clientarea}</a>
	<span class="separator"></span>
	<a href="{if $logged=='1'}{$ca_url}support/{elseif $enableFeatures.kb!='off'}{$ca_url}knowledgebase/{else}{$ca_url}tickets/new/{/if}"  {if $cmd=='tickets' || $cmd=='chat' || $cmd=='knowledgebase' || $cmd=='downloads' || $cmd=='netstat'|| $cmd=='support'}class="active"{/if}>{$lang.support}</a>
	
	
	
	
	{if $enableFeatures.affiliates!='off'}
		<span class="separator"></span>
		<a href="{$ca_url}affiliates/"  {if $cmd=='affiliates'}class="active"{/if}>{$lang.affiliates}</a>
	{/if}
	
		<div class="chatstatus"><a href="{$ca_url}chat/" onclick="if(typeof(hb_footprint)!='undefined') hb_footprint.startChat();return false;"><img src="{$system_url}{$ca_url}hbchat&action=status" /></a></div>
	<div class="clear"></div>
</div>