{*

Add and/or edit contact

*}<h2 >{$lang.profiles}{if $action=='add'}: {$lang.addnewprofile} {else}: {$submit.firstname} {$submit.lastname}{/if}</h2>
<div class="brcrm">
    <ul class="breadcrumb left">
        <li><a href="{$ca_url}profiles/"><strong>{$lang.profiles}</strong></a> <span class="divider">/</span></li>
        <li class="active">{if $action=='add'} {$lang.addnewprofile} {else} {$lang.profiledetails}{/if}</li>
    </ul>

    <a class="btn right btn-mini" href="{$ca_url}profiles/"><i class="icon-chevron-left"></i> Back</a>

    <div class="clear"></div>
</div>

<form method="post" action="" >
    <input type="hidden" name="make" value="{if $action=='add'}addprofile{else}editprofile{/if}"/>
    <div class="p19">
        <h3>{$lang.contactdetails} </h3>
        {include file="ajax.signup.tpl"}
    </div>


    <div class="brcrm">
        <h3>{$lang.privileges}</h3>
        <span><b>{$lang.premadepriv}</b></span>
        <a href="0" onclick="return loadProfile($(this).attr('rel'))" rel="{$p.file}" class="label label-info">{$lang.none}</a>
        {foreach from=$premade item=p}
        <a href="#" rel="{$p.file}" onclick="return loadProfile($(this).attr('rel'))" class="label label-info">{if $lang[$p.lang]}{$lang[$p.lang]}{else}{$p.name}{/if}</a>
        {/foreach}

        <div class="clear"></div>

        <div class="right" style="margin-bottom:20px">



        </div>
        <div class="clear"></div>
        <div >
            <h4><input type="checkbox" class="privilege " id="billing_main" onclick="cUnc(this,'billing')"/><span for="billing_main" >{$lang.billing_main}</span></h4>
            <div class="pgroup mb20">
                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td width="33%">
                            <input type="checkbox" class="privilege billing" id="billing_emails" value="1" name="privileges[billing][emails]" {if $submit.privileges.billing.emails}checked="checked"{/if} /> <span for="billing_emails">{$lang.billing_emails}</span>
                        </td>
                        <td width="33%">
                            <input type="checkbox" class="privilege billing" id="billing_payinvoice" value="1" name="privileges[billing][payinvoice]"  {if $submit.privileges.billing.payinvoice}checked="checked"{/if} /> <span for="billing_payinvoice">{$lang.billing_payinvoice}</span>
                        </td>
                        <td width="33%">
                            <input type="checkbox" class="privilege billing" id="billing_orders" value="1" name="privileges[billing][orders]" {if $submit.privileges.billing.orders}checked="checked"{/if}  /> <span for="billing_orders">{$lang.billing_orders}</span>
                        </td>
                    </tr> <tr>
                        <td width="33%">
                            <input type="checkbox" class="privilege billing" id="billing_balance"  value="1" name="privileges[billing][balance]" {if $submit.privileges.billing.balance}checked="checked"{/if}  /> <span for="billing_balance">{$lang.billing_balance}</span>
                        </td>
                        <td width="33%">
                            {if $enableFeatures.deposit!='off' }<input type="checkbox" class="privilege billing" id="billing_addfunds" value="1" name="privileges[billing][addfunds]" {if $submit.privileges.billing.addfunds}checked="checked"{/if}  /> <span for="billing_addfunds">{$lang.billing_addfunds}</span>{/if}
                        </td>
                        <td width="33%">
                        </td>
                    </tr>
                </table>
            </div>

            <h4><input type="checkbox" class="privilege " id="support_main" onclick="cUnc(this,'support')" /><span for="support_main" >{$lang.support_main}</span></h4>
            <div class="pgroup mb20">
                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td width="33%">
                            <input type="checkbox" class="privilege support" id="support_newticket"  value="1" name="privileges[support][newticket]" {if $submit.privileges.support.newticket}checked="checked"{/if}  /> <span for="support_newticket">{$lang.support_newticket}</span>
                        </td>
                        <td width="33%">
                            <input type="checkbox" class="privilege support" id="support_tickets"  value="1"  name="privileges[support][tickets]" {if $submit.privileges.support.tickets}checked="checked"{/if}  /> <span for="support_tickets">{$lang.support_tickets}</span>
                        </td>
                        <td width="33%">
                            <input type="checkbox" class="privilege support" id="support_closeticket"  value="1"  name="privileges[support][closeticket]" {if $submit.privileges.support.closeticket}checked="checked"{/if} /> <span for="support_closeticket">{$lang.support_closeticket}</span>
                        </td>
                    </tr>  <tr>
                        <td width="33%">
                            <input type="checkbox" class="privilege support" id="support_emails"  value="1" name="privileges[support][emails]" {if $submit.privileges.support.emails}checked="checked"{/if}  /> <span for="support_emails">{$lang.support_emails}</span>
                        </td>
                        <td width="33%">
                        </td>
                        <td width="33%">
                        </td>
                    </tr>
                </table>
            </div>


            <h4><input type="checkbox" class="privilege " id="misc_main" onclick="cUnc(this,'misc')" /><span for="misc_main" >{$lang.misc_main}</span></h4>
            <div class="pgroup mb20">
                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td width="33%">
                            <input type="checkbox" class="privilege misc" id="misc_editmain" name="privileges[misc][editmain]"  value="1" {if $submit.privileges.misc.editmain}checked="checked"{/if} /> <span for="misc_editmain" style="color:red">{$lang.misc_editmain}</span>
                        </td>
                        <td width="33%">
                            <input type="checkbox" class="privilege  misc" id="misc_emails" name="privileges[misc][emails]"  value="1" {if $submit.privileges.misc.emails}checked="checked"{/if} /> <span for="misc_emails">{$lang.misc_emails}</span>
                        </td>
                        <td width="33%">
                            <input type="checkbox" class="privilege misc" id="misc_editipaccess" name="privileges[misc][editipaccess]"  value="1" {if $submit.privileges.misc.editipaccess}checked="checked"{/if} /> <span for="misc_editmain" style="color:red">{$lang.misc_editipaccess}</span>
                        </td>
                    </tr><tr>
                        <td width="33%">
                            <input type="checkbox" class="privilege misc " id="misc_manageprofiles" name="privileges[misc][manageprofiles]" value="1"  {if $submit.privileges.misc.manageprofiles}checked="checked"{/if} /> <span for="misc_manageprofiles">{$lang.misc_manageprofiles}</span>
                        </td>
                        <td width="33%">
                            {if $services}
                            <input type="checkbox" class="privilege  " id="services_full" name="privileges[services][full]" value="1"  {if $submit.privileges.services.full}checked="checked"{/if} onclick="if($(this).is(':checked'))$('#priv_serv').slideUp();else $('#priv_serv').slideDown()"/> <span for="services_full" style="color:red">{$lang.services_full}</span>
                            {/if}
                        </td>
                        <td width="33%">
                            {if $domains}
                            <input type="checkbox" class="privilege  " id="domains_full" name="privileges[domains][full]" value="1"  {if $submit.privileges.domains.full}checked="checked"{/if} onclick="if($(this).is(':checked'))$('#priv_dom').slideUp();else $('#priv_dom').slideDown()" /> <span for="domains_full" style="color:red">{$lang.domains_full}</span>
                            {/if}
                        </td>
                    </tr>
                    <tr>
                        <td width="33%">
                            {if $enableFeatures.affiliates!='off'}<input type="checkbox" class="privilege misc " name="privileges[misc][affiliates]"  id="misc_affiliates" value="1"  {if $submit.privileges.misc.affiliates}checked="checked"{/if} /> <span for="misc_affiliates" >{$lang.misc_affiliates}</span>{/if}
                        </td>
                    </tr>
                </table>
            </div>
            <div id="priv_serv" {if $submit.privileges.services.full}style="display:none"{/if}>
                 {foreach from=$services item=o}
                 <h4><input type="checkbox" class="privilege " id="smain_{$o.id}" onclick="cUnc(this,'s{$o.id}')" /> <span for="smain_{$o.id}">{$o.catname} - {$o.name} {if $o.domain}<em>( {$o.domain} )</em>{/if}</span></h4>
                <div class="pgroup mb20">
                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <td width="33%">
                                <input type="checkbox" class="privilege s{$o.id} services" id="services_{$o.id}_basic" value="1" name="privileges[services][{$o.id}][basic]" {if $submit.privileges.services[$o.id].basic}checked="checked"{/if}/> <span for="services_{$o.id}_basic">{$lang.services_basic}</span>
                            </td>
                            <td width="33%">
                                <input type="checkbox" class="privilege  s{$o.id} services" id="services_{$o.id}_billing" value="1"  name="privileges[services][{$o.id}][billing]" {if $submit.privileges.services[$o.id].billing}checked="checked"{/if}/> <span for="services_{$o.id}_billing">{$lang.services_billing}</span>
                            </td>
                            <td width="33%">
                                <input type="checkbox" class="privilege  s{$o.id} services" id="services_{$o.id}_cancelation" value="1"  name="privileges[services][{$o.id}][cancelation]" {if $submit.privileges.services[$o.id].cancelation}checked="checked"{/if} /> <span for="services_{$o.id}_cancelation">{$lang.services_cancelation}</span>
                            </td>
                        </tr> <tr>
                            <td width="33%">
                                <input type="checkbox" class="privilege s{$o.id} services" id="services_{$o.id}_upgrade" value="1" name="privileges[services][{$o.id}][upgrade]" {if $submit.privileges.services[$o.id].upgrade}checked="checked"{/if}/> <span for="services_{$o.id}_upgrade">{$lang.services_upgrade}</span>
                            </td>
                            <td width="33%">
                                <input type="checkbox" class="privilege s{$o.id} services" id="services_{$o.id}_notify" value="1" name="privileges[services][{$o.id}][notify]" {if $submit.privileges.services[$o.id].notify}checked="checked"{/if}/> <span for="services_{$o.id}_notify">{$lang.services_notify}</span>
                            </td>
                            <td width="33%">
                            </td>
                        </tr>
                        {if $o.widgets}
                        {foreach from=$o.widgets item=w name=wl}
                        {if $smarty.foreach.wl.index%3=='0'}<tr>{/if}
                            <td width="33%">
                                <input type="checkbox" class="privilege s{$o.id} services" id="services_{$o.id}_{$w.name}" value="1" name="privileges[services][{$o.id}][{$w.name}]" {if $submit.privileges.services[$o.id][$w.name]}checked="checked"{/if}/> <span for="services_{$o.id}_{$w.name}">{assign var=widg_name value="`$w.name`_widget"}{if $lang[$widg_name]}{$lang[$widg_name]}{elseif $lang[$w.name]}{$lang[$w.name]}{elseif $w.fullname}{$w.fullname}{else}{$w.name}{/if}</span>
                            </td>
                            {if $smarty.foreach.wl.index%3=='5'}</tr>{/if}
                        {/foreach}
                        {/if}
                    </table>
                </div>
                {/foreach}
            </div>

            <div id="priv_dom" {if $submit.privileges.domains.full}style="display:none"{/if}>
                 {foreach from=$domains item=o}
                 <h4><input type="checkbox" class="privilege " id="dmain_{$o.id}" onclick="cUnc(this,'d{$o.id}')" /> <span for="dmain_{$o.id}">{$lang.domain} - {$o.name}</span></h4>
                <div class="pgroup mb20">
                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <td width="33%">
                                <input type="checkbox" class="privilege d{$o.id} domains" id="domains_{$o.id}_basic" value="1" name="privileges[domains][{$o.id}][basic]" {if $submit.privileges.domains[$o.id].basic}checked="checked"{/if}/> <span for="domains_{$o.id}_basic">{$lang.domains_basic}</span>
                            </td>
                            <td width="33%">
                                <input type="checkbox" class="privilege  d{$o.id} domains" id="domains_{$o.id}_renew" value="1"  name="privileges[domains][{$o.id}][renew]" {if $submit.privileges.domains[$o.id].renew}checked="checked"{/if}/> <span for="domains_{$o.id}_renew">{$lang.domains_renew}</span>
                            </td>
                            <td width="33%">
                                <input type="checkbox" class="privilege  d{$o.id} domains" id="domains_{$o.id}_notify" value="1"  name="privileges[domains][{$o.id}][notify]" {if $submit.privileges.domains[$o.id].notify}checked="checked"{/if}/> <span for="domains_{$o.id}_notify">{$lang.services_notify}</span>

                            </td>
                        </tr>

                        {if $o.widgets}
                        {foreach from=$o.widgets item=w name=wl}
                        {if $smarty.foreach.wl.index%3=='0'}<tr>{/if}
                            <td width="33%">
                                <input type="checkbox" class="privilege d{$o.id} domains" id="domains_{$o.id}_{$w.name}" value="1" name="privileges[domains][{$o.id}][{$w.name}]" {if $submit.privileges.domains[$o.id][$w.name]}checked="checked"{/if}/> <span for="domains_{$o.id}_{$w.name}">{assign var=widg_name value="`$w.name`_widget"}{if $lang[$widg_name]}{$lang[$widg_name]}{elseif $lang[$w.name]}{$lang[$w.name]}{elseif $w.fullname}{$w.fullname}{else}{$w.name}{/if}</span>
                            </td>
                            {if $smarty.foreach.wl.index%3=='5'}</tr>{/if}
                        {/foreach}
                        {/if}
                    </table>
                </div>
                {/foreach}
            </div>
        </div>
    </div>


    <script type="text/javascript">
        {literal}

        function cUnc(el,target) {
            if($(el).is(':checked')) {
                $('.'+target).attr('checked','checked');
            } else {
                $('.'+target).removeAttr('checked');

            }
        }
        function loadProfile(val) {
            $('.privilege').removeAttr('checked');
            $('#priv_dom').show();
            $('#priv_serv').show();
            if(val==0) {
                return false;
            }
            $.post('?cmd=profiles&action=loadpremade',{premade:val},function(response){
                if(response.all) {
                    $('.privilege').attr('checked','checked'); return;
                }
                if(response.billing) {
                    if(response.billing.all) {
                        $('.billing').attr('checked','checked');
                    }
                }if(response.domains) {
                    if(response.domains.all) {
                        $('.domains').attr('checked','checked');
                    }
                }if(response.services) {
                    if(response.services.all) {
                        $('.services').attr('checked','checked');
                    }
                }if(response.support) {
                    if(response.support.all) {
                        $('.support').attr('checked','checked');
                    }
                }
            });

            return false;
        }
        {/literal}
    </script>
    <div class="form-actions">
           <center>

        <input type="submit" value="{$lang.submit}"  class="btn btn-success btn-large" />
    </center>
          </div>
    

    {securitytoken}</form>
