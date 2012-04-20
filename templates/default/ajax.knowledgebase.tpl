{if $action=='article'}
    {if $article}
          <center>
<h3>{$article.title}</h3>
        Tags: {$article.tags}<br>
       
        Body:{$article.body}<br>

{if !$wasvoted}
    <form method="post" action="">
        <input type="hidden" name="make" value="wasuseful" />       
        Was This article useful for You? <input type="submit" value="yes"/>
    {securitytoken}</form>
{/if}

Article was viewed: {$article.viewed} times, {$article.useful}% was useful.
    </center>

    {/if}

{elseif $action=='category'}

{if $category}

        Category:{$category.name}<br>
        Description{$category.description}<br>
<hr>
 {/if}

  {if $articles}
Articles:<br>
        {foreach from=$articles item=i}
            <a href="{$ca_url}knowledgebase/article/{$i.id}/">{$i.title}</a><br><br>
        {/foreach}
 {/if}

{else}
    {if $categories}
    Current categories:<br>
        {foreach from=$categories item=i}
            <a href="{$ca_url}knowledgebase/category/{$i.id}/">{$i.name}</a> - {$i.description}<br><br>
        {/foreach}

    {else}
       Nothing to display
     {/if}
{/if}