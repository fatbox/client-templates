{if $action=='invoices' && $invoices}

	{include file='ajax.invoices.tpl'}
{elseif $action=='history'}
	{include file='ajax.history.tpl'}
{elseif $action=='customfn'  || $action=='addonmodule' || $action=='services' || $action=='checkstatus'}
{include file='ajax.services.tpl'}

{elseif $action=='domains' && $domains}
	{include file='ajax.domains.tpl'}	
	{elseif $action=='emails'}
	{include file='ajax.emails.tpl'}	
{/if}