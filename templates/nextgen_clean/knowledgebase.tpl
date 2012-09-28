<div class="bordered-section article">

    {if $action=='article'}

    {if $article}

    <h2>{$article.title|capitalize}</h2>
    <div class="brcrm">
        <ul class="breadcrumb left">
            <li><a href="{$ca_url}knowledgebase/">{$lang.knowledgebase|capitalize}</a> <span class="divider">/</span></li>
            {foreach from=$path item=p}<li><a href="{$ca_url}knowledgebase/category/{$p.id}/{$p.slug}/">{$p.name}</a> <span class="divider">/</span></li>{/foreach}
            <li class="active">{$article.title}</li>
        </ul>

        <a class="btn right btn-mini" href="{$ca_url}knowledgebase/"><i class="icon-chevron-left"></i> {$lang.back}</a>

        <div class="clear"></div>
    </div>
    <div class="p19">
        <p>{$article.body}</p>
    </div>





    {/if}

    {elseif $action=='category'}

    <h2>{$lang.knowledgebase|capitalize}: {$category.category.name|capitalize}</h2>
     {if $category.category.description!=''}<p class="p19 pt0">{$category.category.description}</p>{/if}
    <div class="brcrm">
    <ul class="breadcrumb left">
        <li><a href="{$ca_url}knowledgebase/">{$lang.knowledgebase|capitalize}</a> <span class="divider">/</span></li>
        {foreach from=$path item=p}<li><a href="{$ca_url}knowledgebase/category/{$p.id}/{$p.slug}/">{$p.name}</a> <span class="divider">/</span></li>{/foreach}
    </ul>
        <a class="btn right btn-mini" href="{$ca_url}knowledgebase/"><i class="icon-chevron-left"></i> {$lang.back}</a>
        <div class="clear"></div>
        </div>
     <div class="p19">
   

    {if !$category.categories && !$category.articles}
    <h3>{$lang.nothing}</h3>
    {/if}

    {if $category.categories}
        <h3>{$lang.categoriesun} {$category.category.name}:</h3>
            {foreach from=$category.categories item=i}
            <h4><a href="{$ca_url}knowledgebase/category/{$i.id}/{$i.slug}/" class="folder3">{$i.name}  <span class="fsize">({$i.elements})</span></a></h4>

            {/foreach}
    {/if}


    {if $category.articles}
    <h3>{$lang.articlesun} {$category.category.name}</h3>
            {foreach from=$category.articles item=i}
            <h4><a href="{$ca_url}knowledgebase/article/{$i.id}/{$i.slug}/" class="annoucement_date">{$i.title}</a></h4>

            {/foreach}
            
    {/if}

    </div>

    {else}



    <h2>{$lang.knowledgebase|capitalize}</h2>
    <p class="p19 pt0">{$lang.kbwelcome}</p>



    <div class="ribbon form-horizontal">
        <form action="{$ca_url}knowledgebase/search/" method="post">

            <div class="control-group">
                <label for="appendedPrependedInput" class="control-label">{$lang.search_article}</label>
                <div class="controls">
                    <input name="query"  value="{$query}" class="magnify" />

                    <input type="submit" value="{$lang.search}" class="btn btn-primary btn-large"/>
                </div>
            </div>

            {securitytoken}</form>
    </div>
    <div class="ribbon-shadow-l"></div>
    <div class="ribbon-shadow-r"></div>


    <div class="p19">

    {if $action=='search'}





        <h3>{$lang.search_results}</h3>
            {if $results}
            {foreach from=$results item=i}
            <a href="{$ca_url}knowledgebase/article/{$i.id}/{$i.slug}/" class="annoucement_date" style="font-size:12px;">{$i.title}</a><br />

				{$i.body|nl2br}<br />
            <br/>
            {/foreach}

		{else}
		{$lang.search_nothing}
		{/if}




    {else}
    {if $categories && $categories.categories}
        <h3>{$lang.currentcats}</h3>
            {foreach from=$categories.categories item=i}
            <h4><a href="{$ca_url}knowledgebase/category/{$i.id}/{$i.slug}/" class="folder3"><strong>{$i.name}</strong></a> <span class="fsize">({$i.elements})</span></h4>

            {/foreach}



    {else}
    {$lang.nothing}
    {/if}

    {/if}


</div>

    {/if}
</div>
