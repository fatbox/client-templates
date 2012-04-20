<div class="p19 serviceinfo">
    <div class="row">

        <div class="span8 mb15">
            <h3>{$lang.service}</h3>
            <h4>{$service.catname} - {$service.name} {if $upgrades && $upgrades!='-1'}<small><a href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/&make=upgrades&upgradetarget=service" class="lmore">{$lang.UpgradeDowngrade}</a></small>{/if}</h4>
        </div>

        {if $service.domain!=''}
        <div class="span4 mb15">
            <h3>{$lang.domain}</h3>
            <h4><a target="_blank" href="http://{$service.domain}">{$service.domain}</a></h4>
        </div>
        {/if}

        <div class="span4 mb15">
            <h3>{$lang.status}</h3>
            <h4><span class="label label-{$service.status}">{$lang[$service.status]}</span></h4>
        </div>


        	{if $service.showbilling}
        <div class="span4 mb15">
            <h3>{$lang.registrationdate}</h3>
            <h4>{$service.date_created|dateformat:$date_format}</h4>
        </div>
        {if $service.firstpayment!=0 }
        <div class="span4 mb15">
            <h3>{$lang.firstpayment_amount}</h3>
            <h4>{$service.firstpayment|price:$currency}</h4>
        </div>
        {/if}
   		{if $service.billingcycle!='Free' && $service.billingcycle!='Once' && $service.billingcycle!='One Time' && $service.total>0}

        <div class="span4 mb15">
            <h3>{if $service.billingcycle=='Hourly'}{$lang.curbalance}{else}{$lang.reccuring_amount}{/if}</h3>
            <h4>{$service.total|price:$currency} {if $service.billingcycle=='Hourly'}({$lang.updatedhourly}){/if}</h4>
        </div>
        {/if}
        {if $service.billingcycle!='Free' && $service.billingcycle!='Once' && $service.billingcycle!='One Time' && $service.next_due!='' && $service.next_due!='0000-00-00'}
        <div class="span4 mb15">
            <h3>{$lang.nextdue}</h3>
            <h4>{$service.next_due|dateformat:$date_format}</h4>
        </div>
        {/if}


        <div class="span4 mb15">
            <h3>{$lang.bcycle}</h3>
            <h4>{$lang[$service.billingcycle]}</h4>
        </div>
        {/if}
    </div>

    
</div>