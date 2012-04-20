{$lang.welcome}<br />
<br />
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr><td width="50%" valign="top">
<div class="mpel">
<div class="mpel_inside">
<a href="{$ca_url}cart/"><img src="{$template_dir}img/cart_png.png" alt="{$lang.placeorder}" /></a>
<div class="mpel_mp">
<a href="{$ca_url}cart/">
{$lang.placeorder|capitalize}<br />
<span>{$lang.placeorder_desc}</span>
</a>
</div>
</div>
</div>

</td>
<td  valign="top">
<div class="mpel">
<div class="mpel_inside">
<a href="{$ca_url}clientarea/">
<img src="{$template_dir}img/clientarea_png.png" alt="{$lang.clientarea}" /></a>
<div class="mpel_mp">
<a href="{$ca_url}clientarea/">
{$lang.clientarea|capitalize}<br />
<span>{$lang.clientarea_desc}</span></a>

</div>
</div>
</div>

</td>

</tr>
<tr>
<td  valign="top">
{if $enableFeatures.domains!='off'}
<div class="mpel">
<div class="mpel_inside">
<a href="{$ca_url}checkdomain/"><img src="{$template_dir}img/domain_png.png" alt="{$lang.domainchecker}" /></a>
<div class="mpel_mp">
<a href="{$ca_url}checkdomain/">
{$lang.domainchecker|capitalize}<br />
<span>{$lang.domainchecker_desc}</span></a>
</div>
</div></div>
{/if}
</td>
<td  valign="top">

{if $enableFeatures.support!='off' || $enableFeatures.kb!='off'}
<div class="mpel">
<div class="mpel_inside">
<a href="{if $logged=='1'}{$ca_url}support{elseif $enableFeatures.kb!='off'}{$ca_url}knowledgebase{else}{$ca_url}tickets/new{/if}/"><img src="{$template_dir}icons/ico_support.png" alt="{$lang.support}" /></a>
<div class="mpel_mp">
<a href="{if $logged=='1'}{$ca_url}support{elseif $enableFeatures.kb!='off'}{$ca_url}knowledgebase{else}{$ca_url}tickets/new{/if}/">
{$lang.support|capitalize}<br />
<span>{$lang.support_desc}</span></a>
</div>
</div></div>
{/if}

</td>

</tr>



</table>
<br />
<br />

<div class="clear"></div>


<br />

{if $enableFeatures.news!='off'}
{if $annoucements}

	{foreach from=$annoucements item=annoucement}
		
		<h3 ><a href="{$ca_url}news/view/{$annoucement.id}/{$annoucement.slug}/">{$annoucement.title}</a></h3>
		<span class="annoucement_date">{$lang.published} {$annoucement.date|dateformat:$date_format}</span>
		<p >{$annoucement.content}
		
		
</p><div style="text-align:right"><a href="{$ca_url}news/">{$lang.newsarchive}</a> | <a href="{$ca_url}news/view/{$annoucement.id}/{$annoucement.slug}/">{$lang.readall}</a></div>
	{/foreach}

{/if}{/if}
<br />
