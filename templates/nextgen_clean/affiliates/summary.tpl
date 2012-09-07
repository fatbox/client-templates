{if $affiliate}
<div class="alert alert-info">
        {$lang.reflink}: <a style="font-weight:bold" href="{$system_url}?affid={$affiliate.id}">{$system_url}?affid={$affiliate.id}</a>
        <div class="right">{$lang.unpaidcomisions}: <strong style="color:blue">{$affiliate.balance|price:$affiliate.currency_id}</strong> / <strong style="color:blue">{$affiliate.pending|price:$affiliate.currency_id}</strong></div>

      </div>
{/if}