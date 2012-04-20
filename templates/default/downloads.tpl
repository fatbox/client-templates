<h1 class="downloads2">{$lang.downloads|capitalize}</h1>

{if $action=='default'}
{if $categories}
<div class="wbox">
<div class="wbox_header">{$lang.categories}</div>
		<div class="wbox_content">
        {foreach from=$categories item=i}
            <p class="dfile">
		    <a href="{$ca_url}downloads/category/{$i.id}/{$i.slug}/" class="folder3"><strong>{$i.name}</strong></a>
			 <span class="fsize">({$i.files})</span> {if $i.description!=''} - {$i.description}{/if}
		</p>
        {/foreach}
		</div>

			</div>

{else}

<strong>{$lang.nothing}</strong>
{/if}

{if $popular}

<div class="wbox">
<div class="wbox_header">{$lang.popular_down}</div>
<div class="wbox_content" >

{foreach from=$popular item=i}
           <p class="dfile"> <a href="{$ca_url}root&amp;action=download&amp;type=downloads&amp;id={$i.id}" class="dw3"><strong>{$i.name}</strong></a> {if $i.size>0}<span class="fsize">{$i.size} KB</span>{/if}{if $i.description!=''}<br />{$i.description}{/if}</p>

        {/foreach}


</div>   </div> 

{/if}
{elseif $action=='category'}


<div class="wbox">
<div class="wbox_header" style="font-weight:normal">{$lang.filesunder} <b>{$category.name}</b> <small style="float:right;font-size:11px;"><a href="{$ca_url}downloads/">{$lang.backtoall}</a></small></div>
<div class="wbox_content" >
{if $category.description!=''}<p class="dfile">{$category.description}</p>{/if}

{foreach from=$files item=i}
           <p class="dfile"> <a href="{$ca_url}root&amp;action=download&amp;type=downloads&amp;id={$i.id}" class="dw3"><strong>{$i.name}</strong></a> {if $i.size>0}<span class="fsize">{$i.size} KB</span>{/if}{if $i.description!=''}<br />{$i.description}{/if}</p>

        {/foreach}


</div>   </div> 

{/if}