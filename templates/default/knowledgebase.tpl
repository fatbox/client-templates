{if $action=='search'}
<h1 class="knowledgebase2">{$lang.knowledgebase|capitalize}</h1>


{$lang.kbwelcome}<br />

<div class="wbox">
<div class="wbox_header">{$lang.search_article}</div>
<div class="wbox_content" style="text-align:center">
<form action="" method="post">
	<input type="hidden" name="make" value="search" />
    <input name="query" style="width:300px;font-size:14px;font-weight:bold;" value="{$query}" class="styled"/>
    
    <input type="submit" value="{$lang.search}" class="padded"/>
    {securitytoken}</form>

</div>   </div> 
<br />

{if $query}

<div class="wbox">
<div class="wbox_header">{$lang.search_results}</div>
 <div class="wbox_content" style="font-size:11px;line-height:16px;">
{if $results}
        {foreach from=$results item=i}
            <a href="{$ca_url}knowledgebase/article/{$i.id}/{$i.slug}/" class="annoucement_date" style="font-size:12px;">{$i.title}</a><br />

				{$i.body|nl2br}<br />
			<br/>
        {/foreach}
		
		{else}
		{$lang.search_nothing}
		{/if}

</div></div>
{/if}
{elseif $action=='article'}
    {if $article}
     <h1 class="knowledgebase2">{$article.title|capitalize}</h1>
<div class="cbreadcrumb">
<a href="{$ca_url}knowledgebase/">{$lang.knowledgebase|capitalize}</a> {foreach from=$path item=p}&raquo; <a href="{$ca_url}knowledgebase/category/{$p.id}/{$p.slug}/">{$p.name}</a>{/foreach}&raquo; {$article.title}
</div>

  
       
      {$article.body}<br/><br/><br/>



    

    {/if}

{elseif $action=='category'}

<h1 class="knowledgebase2">{$lang.knowledgebase|capitalize}: {$category.category.name|capitalize}</h1>
<div class="cbreadcrumb">
<a href="{$ca_url}knowledgebase/">{$lang.knowledgebase|capitalize}</a> {foreach from=$path item=p}&raquo; <a href="{$ca_url}knowledgebase/category/{$p.id}/{$p.slug}/">{$p.name}</a>{/foreach}
</div>
{if $category.category.description!=''}
{$category.category.description}<br /><br />
{/if}

{if !$category.categories && !$category.articles}
<h3>{$lang.nothing}</h3>
{/if}

{if $category.categories}
<div class="wbox">
<div class="wbox_header">{$lang.categoriesun} {$category.category.name}:</div>
 <div class="wbox_content">
        {foreach from=$category.categories item=i}
            <a href="{$ca_url}knowledgebase/category/{$i.id}/{$i.slug}/" class="folder3"><strong>{$i.name}</strong></a> <span class="fsize">({$i.elements})</span>{if $i.description!=''} - {$i.description}{/if}<br/><br />

        {/foreach}
		</div></div>
{/if}


  {if $category.articles}
<div class="wbox">
<div class="wbox_header">{$lang.articlesun} {$category.category.name}</div>
        <div class="wbox_content" style="font-size:11px;line-height:16px;"> {foreach from=$category.articles item=i}
            <a href="{$ca_url}knowledgebase/article/{$i.id}/{$i.slug}/" class="annoucement_date" style="font-size:12px;">{$i.title}</a><br />

				{$i.body}<br />
			<br/>
        {/foreach}</div></div>
 {/if}

{else}

<h1 class="knowledgebase2">{$lang.knowledgebase|capitalize}</h1>


{$lang.kbwelcome}<br /><br />

<div class="wbox">
<div class="wbox_header">{$lang.search_article}</div>
<div class="wbox_content" style="text-align:center;padding:15px;">
<form action="{$ca_url}knowledgebase/search/" method="post">
	<input type="hidden" name="make" value="search" />
    <input name="query" style="width:300px;font-size:14px;font-weight:bold;" value="{$query}" class="styled"/>
    
    <input type="submit" value="{$lang.search}" class="padded" style="font-weight:bold"/>
    {securitytoken}</form>

</div>  </div>


    {if $categories && $categories.categories}
		<div class="wbox">
<div class="wbox_header">{$lang.currentcats}</div>
		<div class="wbox_content">
        {foreach from=$categories.categories item=i}
            <a href="{$ca_url}knowledgebase/category/{$i.id}/{$i.slug}/" class="folder3"><strong>{$i.name}</strong></a> <span class="fsize">({$i.elements})</span>{if $i.description!=''} - {$i.description}{/if}<br/><br />

        {/foreach}
		</div>

			</div>
   		
   
    {else}
       {$lang.nothing}
     {/if}
{/if}