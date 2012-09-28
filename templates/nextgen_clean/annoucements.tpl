{if ($action=='annoucement' || $action=='view') && $annoucement}


<div class="bordered-section article">
    <h2>{$lang.annoucements|capitalize}: {$annoucement.title}</h2>
    <div class="brcrm">
        <span class="annoucement_date left"><i class="icon-time"></i> {$lang.published} {$annoucement.date|dateformat:$date_format}</span>

        <a href="{$ca_url}news/"  class="btn btn-mini right"><i class="icon-chevron-left"></i> {$lang.back}</a>

        <div class="clear"></div>
    </div>
    <div class="p19">
        <p >{$annoucement.content|nl2br}</p>
    </div>
</div>




{elseif $action=='default'}

{if $annoucements}
<h1 class="annoucements2">{$lang.annoucements|capitalize}</h1>

	{foreach from=$annoucements item=annoucement}
    <blockquote>
            <h3><a href="{$ca_url}news/view/{$annoucement.id}/{$annoucement.slug}/">{$annoucement.title}</a></h3>
            <span class="annoucement_date"><i class="icon-time"></i> {$lang.published} {$annoucement.date|dateformat:$date_format}</span>
            <p >{$annoucement.content}</p>

                <a class="btn btn-small right" href="{$ca_url}news/view/{$annoucement.id}/{$annoucement.slug}/"><i class="icon-chevron-right"></i> {$lang.readall}</a>
            <div class="clear"></div>
    </blockquote>

	{/foreach}



{else}

{$lang.nothing}

{/if}
{/if}

