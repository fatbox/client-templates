<div class="bordered-section article">



{if $action=='default'}

<h2 class="bbottom">{$lang.downloads|capitalize}</h2>

{if $categories}
<div class="p19">
<h3>{$lang.categories}</h3>
        {foreach from=$categories item=i}
            <h4>
		    <a href="{$ca_url}downloads/category/{$i.id}/{$i.slug}/" class="folder3"><strong>{$i.name}</strong></a>
			 <span class="fsize">({$i.files})</span> 
		</h4>
        {/foreach}


{else}

<h3>{$lang.nothing}</h3>
{/if}

{if $popular}
<div class="divider"></div>
<h3>{$lang.popular_down}</h3>
<div class="well">
       {foreach from=$popular item=i}
           <div class="span3 mb15">
               <h4><a href="{$ca_url}root&amp;action=download&amp;type=downloads&amp;id={$i.id}" class="dw3">{$i.name}</a></h4>
               {if $i.description!=''}<p>{$i.description}</p>{/if}
               <center>
                   <a href="{$ca_url}root&amp;action=download&amp;type=downloads&amp;id={$i.id}" class="btn btn-info"><i class="icon-download-alt icon-white"></i> Download
               {if $i.size>0}({$i.size} KB){/if}</a>
               </center>
           </div>
        {/foreach}
        <div class="clear"></div>
</div>




{/if}
</div>
{elseif $action=='category'}

<h2 class="downloads2">{$category.name}</h2>

{if $category.description!=''}<p class="p19 pt0">{$category.description}</p>{/if}


<div class="brcrm">
        <ul class="breadcrumb left">
            <li><a href="{$ca_url}downloads/">{$lang.downloads|capitalize}</a> <span class="divider">/</span></li>

            <li class="active">{$category.name}</li>
        </ul>

        <a class="btn right btn-mini" href="{$ca_url}downloads/"><i class="icon-chevron-left"></i> {$lang.back}</a>

        <div class="clear"></div>
    </div>


<div class="p19">
    <h3 class="mb15">{$lang.filesunder} {$category.name}</h3>

{foreach from=$files item=i}
          <div class="span3 mb15">
               <h4><a href="{$ca_url}root&amp;action=download&amp;type=downloads&amp;id={$i.id}" class="dw3">{$i.name}</a></h4>
               {if $i.description!=''}<p>{$i.description}</p>{/if}
               <center>
                   <a href="{$ca_url}root&amp;action=download&amp;type=downloads&amp;id={$i.id}" class="btn btn-info"><i class="icon-download-alt icon-white"></i> Download
               {if $i.size>0}({$i.size} KB){/if}</a>
               </center>
           </div>
        {/foreach}
        <div class="clear"></div>

  </div> 

{/if}
</div>