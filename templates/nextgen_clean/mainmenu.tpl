<div id="mainmenu-container">
    <div id="mainmenu" >
    {if $logged=='1'}
        {include file='menus/menu.main.logged.tpl'}
    {else}
        {include file='menus/menu.main.notlogged.tpl'}
    {/if}
</div></div>