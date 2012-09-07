<div class="clear"></div>
<div id="errors" {if $error}style="display:block"{/if}>
     <div class="alert alert-error">
        <a class="close" >&times;</a>
        {if $error}
        {foreach from=$error item=blad}{$blad}<br/>{/foreach}
        {/if}                </div>

</div>

<div id="infos"  {if $info}style="display:block"{/if}>

     <div class="alert alert-info">
        <a class="close" >&times;</a>
        {if $info}
        {foreach from=$info item=infos}{$infos}<br/>{/foreach}
        {/if}
    </div>
</div>