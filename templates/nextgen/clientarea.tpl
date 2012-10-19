
{if $action=='details' || $action=='password' || $action=='ccard' || $action=='profilepassword' || $action=='ipaccess' || $action=='addfunds'}
  <div class="row flex-container ">
      <div class="span2  flex-box-1 box-feature-small">
            {include file='clientarea/leftnavigation.tpl'}
        </div>
        <div class="span10  flex-box-1 bordered-section article iep">
  {/if}

{if $action=='details'}

    {include file='clientarea/editdetails.tpl'}

{elseif $action=='addfunds'}

   {include file='clientarea/addfunds.tpl'}

{elseif $action=='profilepassword'}

   {include file='contacts/changepassword.tpl'}

{elseif $action=='password'}

    {include file='clientarea/changepassword.tpl'}

{elseif $action=='ccard'}

    {include file='clientarea/creditcard.tpl'}


{elseif $action=='services' || $action=='accounts' || $action=='reseller' || $action=='vps' || $action=='servers'}

	{include file='services/services.tpl'}
        
{elseif $action=='invoices'}

	{include file='clientarea/invoices.tpl'}

{elseif $action=='cancel'}<for>
	{include file='services/cancelationrequest.tpl'}
</for>
{elseif $action=='ccprocessing'}

	{include file='clientarea/ccprocessing.tpl'}

{elseif $action=='emails'}

	{include file='clientarea/emails.tpl'}

{elseif $action=='domains'}

	{include file='services/domains.tpl'}
	
{elseif $action=='history'}

	{include file='clientarea/history.tpl'}
        
{elseif $action=='ipaccess'}

	{include file='clientarea/ipaccess.tpl'}
{else}

    {* Clientarea dashboard *}

    {include file='clientarea/dashboard.tpl'}

{/if}

{if $action=='details' || $action=='ccard' || $action=='password' || $action=='ipaccess'  || $action=='addfunds'}

    </div>
</div>
  {/if}