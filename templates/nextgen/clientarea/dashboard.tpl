{*

Clientarea dashboard - summary of owned services, due invoices, opened tickets

*}

<div class="row dashrow">

	{foreach from=$offer item=offe}
	{if $offe.total>0}
            <div class="span3 dashboardblock">
                <div class="internal">
                <h4><a href="{$ca_url}clientarea/services/{$offe.slug}/">{$offe.name}</a> <a href="{$ca_url}clientarea/services/{$offe.slug}/" class="counter">{$offe.total}</a></h4>

                <a class="btn right btn-mini btn-primary" href="{$ca_url}clientarea/services/{$offe.slug}/">{$lang.manage}</a>

                </div>
            </div>
	{/if}
	{/foreach}


	{if $mydomains>0}
    <div class="span3 dashboardblock">
        <div class="internal">
        <h4><a href="{$ca_url}clientarea/domains/" >{$lang.mydomains}</a> <a class="counter" href="{$ca_url}clientarea/domains/" >{$mydomains}</a></h4>
        


            {if $expdomains}
        <a class="btn right btn-mini btn-danger" href="{$ca_url}clientarea/domains/">{$expdomains_count} {$lang.ExpiringDomains}</a>
            {else}
            <a class="btn right btn-mini btn-primary" href="{$ca_url}clientarea/domains/">{$lang.manage}</a>
            {/if}
   

        </div>
    </div>
    {/if}

<div class="clear"></div>
<div class="divider"></div>
<div class="divider"></div>
</div>

<div class="row">
    {if $dueinvoices || $openedtickets}<div class="span9">

        {* BOF: Dashboard element: Due invoices *}
        {if $dueinvoices}
        <div class="wbox">
            <div class="wbox_header nbottom">
                {$lang.dueinvoices} {if $acc_balance && $acc_balance>0} <span style="color:red">{$acc_balance|price:$currency}</span>{/if}

                <div class="right wbox_right">  <form method="post" action="index.php" style="margin:0px">
                        <input type="hidden" name="action" value="payall"/>
                        <input type="hidden" name="cmd" value="clientarea"/>
                        <button type="submit" class="btn btn-success"><i class="icon-ok-sign icon-white"></i> {$lang.paynowdueinvoices}</button>{securitytoken}</form>
                </div>
            </div>
            <table border="0" cellpadding="0" cellspacing="0" width="100%" class="table table-striped fullscreen">

                <tbody>
                    <tr>
                        <th>{$lang.invoicenum}</th>
                        <th width="120">{$lang.total}</th>
                        <th width="120">{$lang.duedate}</th>
                        <th width="20"/>
                    </tr>
                </tbody>

                {foreach from=$dueinvoices item=invoice name=foo}
                <tr {if $smarty.foreach.foo.index%2 == 0}class="even"{/if}>
                    <td><a href="{$ca_url}clientarea/invoice/{$invoice.id}/" target="_blank">{if $proforma && ($invoice.status=='Paid' || $invoice.status=='Refunded') && $invoice.paid_id!=''}{$invoice.paid_id}{else}{$invoice.date|invprefix:$prefix}{$invoice.id}{/if}</a></td>
                    <td >{$invoice.total|price:$invoice.currency_id}</td>
                    <td align="center">{$invoice.duedate|dateformat:$date_format}</td>
                    <td align="center"><a href="{$ca_url}clientarea/invoice/{$invoice.id}/" target="_blank" class="view3">view</a></td>
                </tr>

                {/foreach}
            </table>
        </div>
        {/if}
        {* EOF: Dashboard element: Due invoices *}

        {* BOF: Dashboard element: Opened/Recent support tickets *}
        <div class="wbox">
            <div class="wbox_header nbottom">
                {$lang.openedtickets|capitalize}

                <div class="right wbox_right">
                    <a class="btn" href="{$ca_url}tickets/new/" ><i class="icon-plus"></i> {$lang.ca_createticket}</a>
                    <a class="btn" href="{$ca_url}tickets/" > {$lang.viewalltickets}</a>
                </div>
            </div>
            <table border="0" cellpadding="0" cellspacing="0" width="100%" class="table table-striped fullscreen">
                <tbody>
                    <tr>

                        <th width="70">{$lang.status}</th>
                        <th >{$lang.subject}</th>
                        <th width="230">{$lang.department}</th>

                    </tr>
                </tbody>
                {foreach from=$openedtickets item=ticket name=foo}

                <tr {if $smarty.foreach.foo.index%2 == 0}class="even"{/if}>
                    <td >
                        <span class="label label-{$ticket.status}">{$lang[$ticket.status]}</span>
                    </td>
                    <td>
                        {if $ticket.client_read=='0'}<strong>{/if}<a href="{$ca_url}tickets/view/{$ticket.ticket_number}/">{$ticket.subject|wordwrap:40:"<br />\n":true}</a>{if $ticket.client_read==0}</strong>{/if}</td>
                    <td>{$ticket.deptname}</td>
                </tr>

                {foreachelse}
                <tr>
                    <td colspan="4">
                        {$lang.nothing}
                    </td>
                </tr>
                {/foreach}

            </table>
        </div>
        {* EOF: Dashboard element: Opened/Recent support tickets *}

    </div>
    {/if}
    <div class="{if $dueinvoices || $openedtickets}span3 w240{else}span12{/if}">
        <div class="form-horizontal" style="text-align:right">
            <form action="{$ca_url}knowledgebase/search/" method="post"><div class="input-append" >
                    <input type="text" size="16" id="appendedPrependedInput" class="span2" placeholder="{$lang.ca_search}" style="width:195px"  name="query" /><button type="submit" class="btn"><i class="icon-search"></i></button>
                </div>{securitytoken}</form>
        </div>

        {if $acc_credit>0}
        <div class="greenbox">{$lang.credit}: <strong>{$acc_credit|price:$currency}</strong></div>
        {/if}
        <h3 class="darkheader">{$lang.quicklinks}</h3>

        <ul class="nice-sidemenu">
            <li>
                <i class="icon-tags"></i>
                <a href="{$ca_url}tickets/new/">{$lang.openticket}</a>
                <small>{$lang.dashboard_phrase_1}</small>
            </li>

            {if $enableFeatures.deposit!='off' } <li>
                <i class="icon-plus-sign"></i>
                <a href="{$ca_url}clientarea/addfunds/">{$lang.addfunds}</a>
                <small>{$lang.dashboard_phrase_2}</small>
            </li>{/if}
            <li>
                <i class="icon-user"></i>
                <a href="{$ca_url}profiles/">{$lang.managecontacts}</a>
                <small>{$lang.dashboard_phrase_3}</small>
            </li>

            <li>
                <i class="icon-lock"></i>
                <a href="{$ca_url}clientarea/ipaccess/">{$lang.ipaccess}</a>
                <small>{$lang.dashboard_phrase_4}</small>
            </li>

            {if $enableFeatures.kb!='off'}<li>
                <i class="icon-book"></i>
                <a href="{$ca_url}knowledgebase/">{$lang.knowledgebase}</a>
                <small>{$lang.dashboard_phrase_5}</small>
            </li>{/if}

            {if $enableFeatures.netstat!='off'}
            <li>
                <i class="icon-flag"></i>
                <a href="{$ca_url}netstat/">{$lang.netstat}</a>
                <small>{$lang.dashboard_phrase_6}</small>
            </li>
            {/if}

        </ul>
    </div>
</div>



