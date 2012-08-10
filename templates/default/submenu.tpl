<div id="submenu">	<div class="pa1" {if $languages || $cmd=='root' && $infopages || $cmd=='tickets' || $cmd=='cart' || $cmd=='checkdomain'}style="height:25px;"{/if}>
{if $cmd=='root' && $infopages} 

	{foreach from=$infopages item=paged}
		<a href="{$ca_url}page/{$paged.url}/" {if $page && $page.title==$paged.title}class='active'{/if}>{$paged.title}</a>
	{/foreach}

  {foreach from=$HBaddons.client_submenu item=ad}
      <a href="{$ca_url}{$ad.link}/" >{$ad.name}</a>
    {/foreach}

{elseif $cmd=='affiliates' && $affiliate}
    <a {if $action=='default'}class='active'{/if} href="{$ca_url}{$cmd}/">{$lang.Home}</a>
    <a {if $action=='commissions'}class='active'{/if} href="{$ca_url}{$cmd}/commissions/">{$lang.mycommisions}</a>
    <a {if $action=='vouchers' || $action=='addvoucher'}class='active'{/if} href="{$ca_url}{$cmd}/vouchers/">{$lang.myvouchers}</a>
    <a {if $action=='payouts'}class='active'{/if} href="{$ca_url}{$cmd}/payouts/">{$lang.payouts}</a>
{elseif $cmd=='clientarea' || $cmd == 'dns'}

	<a href="{$ca_url}clientarea/" {if $cmd=='clientarea' && $action=='default'}class='active'{/if}>{$lang.summary}</a>
	
	{if $offer}
		{foreach from=$offer item=o}
		<a href="{$ca_url}clientarea/services/{$o.slug}/" {if $action=='services' && $cid==$o.id || $service.category_id==$o.id}class='active'{/if} >{$o.name}</a>
		{/foreach}
	{/if}
	
	
	{if $enableFeatures.domains!='off'}<a href="{$ca_url}clientarea/domains/" {if $cmd=='clientarea' && $action=='domains'}class='active'{/if}>{$lang.mydomains}</a>{/if}
	
	


{elseif $cmd=='tickets' || $cmd=='knowledgebase' || $cmd=='support'  || $cmd=='downloads'  || $cmd=='netstat'}
<a href="{$ca_url}support/"  {if $cmd=='support'}class='active'{/if}>{$lang.supporthome}</a>
	<a href="{if $logged=='1'}{$ca_url}tickets{else}{$ca_url}tickets/new/{/if}"  {if $cmd=='tickets'}class='active'{/if}>{$lang.mytickets}</a>
	{if $enableFeatures.kb!='off'}	
		<a href="{$ca_url}knowledgebase/"  {if $cmd=='knowledgebase'}class="active"{/if}>{$lang.knowledgebase}</a>
	{/if}
	{if $enableFeatures.downloads!='off'}
	<a href="{$ca_url}downloads/"  {if $cmd=='downloads'}class="active"{/if}>{$lang.downloads}</a>
	{/if}
	{if $enableFeatures.netstat!='off'}
	<a href="{$ca_url}netstat/"  {if $cmd=='netstat'}class="active"{/if}>{$lang.netstat}</a>	
	{/if}
        {elseif $cmd=='profiles'}
<a href="{$ca_url}profiles/"   {if  $action!='add'}class='active'{/if}>{$lang.currentprofiles}</a>
<a href="{$ca_url}profiles/add/"   {if  $action=='add' }class='active'{/if}>{$lang.addnewprofile}</a>
        

{elseif $cmd=='cart' || $cmd=='checkdomain'}

<a href="{$ca_url}cart/"  {if $cmd=='cart'}class='active'{/if}>{$lang.placeorder}</a>
{if $enableFeatures.domains!='off' && $domaincategories}
{foreach from=$domaincategories item=cat}
    <a href="{$ca_url}checkdomain/{$cat.slug}/"  {if $cmd=='checkdomain' && $domain_cat==$cat.id}class='active'{/if}>{$cat.name}</a>
{/foreach}
{/if}
	
{/if}
		</div>

{if $languages}
<div id="langchange"><ul>
{foreach from=$languages item=ling}
		{if  $language==$ling}<li id="lang_{$ling|capitalize}" class="active"><a href="{$ca_url}{$cmd}&action={$action}&languagechange={$ling|capitalize}"><img src="{$template_dir}images/lang_{$ling|capitalize}.gif"  alt="{$ling|capitalize}"/><span>{$lang[$ling]|capitalize}</span></a></li>{/if}
	{/foreach}
	{foreach from=$languages item=ling}
		{if  $language!=$ling}<li id="lang_{$ling|capitalize}" ><a href="{$ca_url}{$cmd}&action={$action}&languagechange={$ling|capitalize}"><img src="{$template_dir}images/lang_{$ling|capitalize}.gif" alt="{$ling|capitalize}"/><span>{$lang[$ling]|capitalize}</span></a></li>{/if}
	{/foreach}
</ul>	
</div>

{/if}
	
	<div class="clear"></div>
</div>