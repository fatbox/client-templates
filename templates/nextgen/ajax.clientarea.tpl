{if $action=='invoices' && $invoices}
	{include file='ajax/ajax.invoices.tpl'}
{elseif $action=='history'}
	{include file='ajax/ajax.history.tpl'}
{elseif $action=='customfn'  || $action=='addonmodule' || $action=='services' || $action=='checkstatus'}
    {include file='ajax/ajax.services.tpl'}
{elseif $action=='domains' && $domains}
	{include file='ajax/ajax.domains.tpl'}
{elseif $action=='emails'}
	{include file='ajax/ajax.emails.tpl'}
{/if}