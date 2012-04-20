
{if ($action=='annoucement' || $action=='view') && $annoucement}
<h1 class="annoucements2">{$lang.annoucements|capitalize}</h1>
 
  <h3 >{$annoucement.title}</h3>
		<span class="annoucement_date">{$lang.published} {$annoucement.date|dateformat:$date_format}</span>
		<p >{$annoucement.content|nl2br}
		
		
</p>
<a href="{$ca_url}news/">{$lang.backtoannoucements}</a>

{elseif $action=='default'}

{if $annoucements}
<h1 class="annoucements2">{$lang.annoucements|capitalize}</h1>

	{foreach from=$annoucements item=annoucement}
		<h3><a href="{$ca_url}news/view/{$annoucement.id}/{$annoucement.slug}/">{$annoucement.title}</a></h3>
		<span class="annoucement_date">{$lang.published} {$annoucement.date|dateformat:$date_format}</span>
		<p >{$annoucement.content}
		
		
</p><div style="text-align:right"><a href="{$ca_url}news/view/{$annoucement.id}/{$annoucement.slug}/">{$lang.readall}</a></div>
	{/foreach}



{else}

{$lang.nothing}

{/if}
{/if}

