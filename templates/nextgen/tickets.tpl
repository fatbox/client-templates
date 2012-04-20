{if $newticket}
    {include file='support/addticket.tpl'}
{/if}
{if $ticketcreated}
<div id="loginbox_container">
    <div class="wbox">
        <div class="wbox_header">{$lang.ticketcreated} <a href="{$ca_url}tickets/view/{$tnum}/&amp;hash={$thash}">#{$tnum}</a></div>
        <div class="wbox_content">
            <div class="alert alert-info">
               {$lang.tcreatednfo}
            </div>
            <center>
                <a href="{$ca_url}tickets/view/{$tnum}/&amp;hash={$thash}" class="btn btn-large btn-info">{$lang.viewticket}</a>
                <a href="{$ca_url}" class="btn btn-large">{$lang.back}</a>
                
            </center>
            
        </div>
    </div>
</div>

{/if}

{if $ticket}
    {include file='support/viewticket.tpl'}
{/if}


{if $action=='default' || $action=='_default'}
    {include file='support/listtickets.tpl'}
{/if}