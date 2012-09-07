<div id="submenu" >
    {if $logged=='1'}
        {include file='menus/menu.sub.logged.tpl'}
    {else}
        {include file='menus/menu.sub.notlogged.tpl'}
    {/if}
</div>