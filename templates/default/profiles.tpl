{if $action=='add' || $action=='edit'}
<h1 class="details2">{$lang.profiles}{if $action=='add'}: {$lang.addnewprofile} {else}: {$submit.firstname} {$submit.lastname}{/if}</h1>
<div class="cbreadcrumb"><a href="{$ca_url}clientarea/"><strong>{$lang.clientarea}</strong></a> &raquo;
    <a href="{$ca_url}profiles/"><strong>{$lang.profiles}</strong></a> &raquo; <strong>{if $action=='add'} {$lang.addnewprofile} {else} {$lang.profiledetails}{/if}</strong></div>
<form method="post" action="" >
<input type="hidden" name="make" value="{if $action=='add'}addprofile{else}editprofile{/if}"/>
 <div class="wbox">
        <div class="wbox_header">{$lang.contactdetails} </div><div class="wbox_content">
       {include file="ajax.signup.tpl"}
 </div></div>


<div class="wbox">
        <div class="wbox_header">{$lang.privileges} </div>
        <div class="wbox_submenu">
            <span><b>{$lang.premadepriv}</b></span>
            <a href="0" onclick="return loadProfile($(this).attr('rel'))" rel="{$p.file}">{$lang.none}</a>
             {foreach from=$premade item=p}
                        <a href="#" rel="{$p.file}" onclick="return loadProfile($(this).attr('rel'))" >{$p.name}</a>
                    {/foreach}
                        
            <div class="clear"></div>
            </div>

        <div class="wbox_content">
            <div class="right" style="margin-bottom:20px">


        
</div>
<div class="clear"></div>
            <div style="padding:5px 20px 20px;">
                <h3><input type="checkbox" class="privilege " id="billing_main" onclick="cUnc(this,'billing')"/><label for="billing_main" >{$lang.billing_main}</label></h3>
                <div class="pgroup">
                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <td width="33%">
                                <input type="checkbox" class="privilege billing" id="billing_emails" value="1" name="privileges[billing][emails]" {if $submit.privileges.billing.emails}checked="checked"{/if} /> <label for="billing_emails">{$lang.billing_emails}</label>
                            </td>
                            <td width="33%">
                                <input type="checkbox" class="privilege billing" id="billing_payinvoice" value="1" name="privileges[billing][payinvoice]"  {if $submit.privileges.billing.payinvoice}checked="checked"{/if} /> <label for="billing_payinvoice">{$lang.billing_payinvoice}</label>
                            </td>
                            <td width="33%">
                                <input type="checkbox" class="privilege billing" id="billing_orders" value="1" name="privileges[billing][orders]" {if $submit.privileges.billing.orders}checked="checked"{/if}  /> <label for="billing_orders">{$lang.billing_orders}</label>
                            </td>
                        </tr> <tr>
                            <td width="33%">
                                <input type="checkbox" class="privilege billing" id="billing_balance"  value="1" name="privileges[billing][balance]" {if $submit.privileges.billing.balance}checked="checked"{/if}  /> <label for="billing_balance">{$lang.billing_balance}</label>
                            </td>
                            <td width="33%">
                                {if $enableFeatures.deposit!='off' }<input type="checkbox" class="privilege billing" id="billing_addfunds" value="1" name="privileges[billing][addfunds]" {if $submit.privileges.billing.addfunds}checked="checked"{/if}  /> <label for="billing_addfunds">{$lang.billing_addfunds}</label>{/if}
                            </td>
                            <td width="33%">
                            </td>
                        </tr>
                    </table>
                </div>

                <h3><input type="checkbox" class="privilege " id="support_main" onclick="cUnc(this,'support')" /><label for="support_main" >{$lang.support_main}</label></h3>
                <div class="pgroup">
                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <td width="33%">
                                <input type="checkbox" class="privilege support" id="support_newticket"  value="1" name="privileges[support][newticket]" {if $submit.privileges.support.newticket}checked="checked"{/if}  /> <label for="support_newticket">{$lang.support_newticket}</label>
                            </td>
                            <td width="33%">
                                <input type="checkbox" class="privilege support" id="support_tickets"  value="1"  name="privileges[support][tickets]" {if $submit.privileges.support.tickets}checked="checked"{/if}  /> <label for="support_tickets">{$lang.support_tickets}</label>
                            </td>
                            <td width="33%">
                                <input type="checkbox" class="privilege support" id="support_closeticket"  value="1"  name="privileges[support][closeticket]" {if $submit.privileges.support.closeticket}checked="checked"{/if} /> <label for="support_closeticket">{$lang.support_closeticket}</label>
                            </td>
                        </tr>  <tr>
                            <td width="33%">
                                <input type="checkbox" class="privilege support" id="support_emails"  value="1" name="privileges[support][emails]" {if $submit.privileges.support.emails}checked="checked"{/if}  /> <label for="support_emails">{$lang.support_emails}</label>
                            </td>
                            <td width="33%">
                            </td>
                            <td width="33%">
                            </td>
                        </tr>
                    </table>
                </div>


                <h3><input type="checkbox" class="privilege " id="misc_main" onclick="cUnc(this,'misc')" /><label for="misc_main" >{$lang.misc_main}</label></h3>
                <div class="pgroup">
                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <td width="33%">
                                <input type="checkbox" class="privilege misc" id="misc_editmain" name="privileges[misc][editmain]"  value="1" {if $submit.privileges.misc.editmain}checked="checked"{/if} /> <label for="misc_editmain" style="color:red">{$lang.misc_editmain}</label>
                            </td>
                            <td width="33%">
                                <input type="checkbox" class="privilege  misc" id="misc_emails" name="privileges[misc][emails]"  value="1" {if $submit.privileges.misc.emails}checked="checked"{/if} /> <label for="misc_emails">{$lang.misc_emails}</label>
                            </td>
                            <td width="33%">
                                <input type="checkbox" class="privilege misc" id="misc_editipaccess" name="privileges[misc][editipaccess]"  value="1" {if $submit.privileges.misc.editipaccess}checked="checked"{/if} /> <label for="misc_editmain" style="color:red">{$lang.misc_editipaccess}</label>
                            </td>
                        </tr><tr>
                            <td width="33%">
                                <input type="checkbox" class="privilege misc " id="misc_manageprofiles" name="privileges[misc][manageprofiles]" value="1"  {if $submit.privileges.misc.manageprofiles}checked="checked"{/if} /> <label for="misc_manageprofiles">{$lang.misc_manageprofiles}</label>
                            </td>
                            <td width="33%">
                               {if $services} 
                                <input type="checkbox" class="privilege  " id="services_full" name="privileges[services][full]" value="1"  {if $submit.privileges.services.full}checked="checked"{/if} onclick="if($(this).is(':checked'))$('#priv_serv').slideUp();else $('#priv_serv').slideDown()"/> <label for="services_full" style="color:red">{$lang.services_full}</label>
                               {/if}
                            </td>
                            <td width="33%">
                               {if $domains}
                                <input type="checkbox" class="privilege  " id="domains_full" name="privileges[domains][full]" value="1"  {if $submit.privileges.domains.full}checked="checked"{/if} onclick="if($(this).is(':checked'))$('#priv_dom').slideUp();else $('#priv_dom').slideDown()" /> <label for="domains_full" style="color:red">{$lang.domains_full}</label>
                               {/if}
                            </td>
                        </tr>
						<tr>
							<td width="33%">
                                {if $enableFeatures.affiliates!='off'}<input type="checkbox" class="privilege misc " name="privileges[misc][affiliates]"  id="misc_affiliates" value="1"  {if $submit.privileges.misc.affiliates}checked="checked"{/if} /> <label for="misc_affiliates" >{$lang.misc_affiliates}</label>{/if}
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="priv_serv" {if $submit.privileges.services.full}style="display:none"{/if}>
                {foreach from=$services item=o}
                 <h3><input type="checkbox" class="privilege " id="smain_{$o.id}" onclick="cUnc(this,'s{$o.id}')" /> <label for="smain_{$o.id}">{$o.catname} - {$o.name} {if $o.domain}<em>( {$o.domain} )</em>{/if}</label></h3>
                  <div class="pgroup">
                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <td width="33%">
                                <input type="checkbox" class="privilege s{$o.id} services" id="services_{$o.id}_basic" value="1" name="privileges[services][{$o.id}][basic]" {if $submit.privileges.services[$o.id].basic}checked="checked"{/if}/> <label for="services_{$o.id}_basic">{$lang.services_basic}</label>
                            </td>
                            <td width="33%">
                                <input type="checkbox" class="privilege  s{$o.id} services" id="services_{$o.id}_billing" value="1"  name="privileges[services][{$o.id}][billing]" {if $submit.privileges.services[$o.id].billing}checked="checked"{/if}/> <label for="services_{$o.id}_billing">{$lang.services_billing}</label>
                            </td>
                            <td width="33%">
                                 <input type="checkbox" class="privilege  s{$o.id} services" id="services_{$o.id}_cancelation" value="1"  name="privileges[services][{$o.id}][cancelation]" {if $submit.privileges.services[$o.id].cancelation}checked="checked"{/if} /> <label for="services_{$o.id}_cancelation">{$lang.services_cancelation}</label>
                            </td>
                        </tr> <tr>
                            <td width="33%">
                                <input type="checkbox" class="privilege s{$o.id} services" id="services_{$o.id}_upgrade" value="1" name="privileges[services][{$o.id}][upgrade]" {if $submit.privileges.services[$o.id].upgrade}checked="checked"{/if}/> <label for="services_{$o.id}_upgrade">{$lang.services_upgrade}</label>
                            </td>
                            <td width="33%">
                                <input type="checkbox" class="privilege s{$o.id} services" id="services_{$o.id}_notify" value="1" name="privileges[services][{$o.id}][notify]" {if $submit.privileges.services[$o.id].notify}checked="checked"{/if}/> <label for="services_{$o.id}_notify">{$lang.services_notify}</label>
                            </td>
                            <td width="33%">
                            </td>
                        </tr>
                        {if $o.widgets}
                            {foreach from=$o.widgets item=w name=wl}
                                {if $smarty.foreach.wl.index%3=='0'}<tr>{/if}
                                <td width="33%">
                                    <input type="checkbox" class="privilege s{$o.id} services" id="services_{$o.id}_{$w.name}" value="1" name="privileges[services][{$o.id}][{$w.name}]" {if $submit.privileges.services[$o.id][$w.name]}checked="checked"{/if}/> <label for="services_{$o.id}_{$w.name}">{if $lang[$w.name]}{$lang[$w.name]}{elseif $w.fullname}{$w.fullname}{else}{$w.name}{/if}</label>
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
                 <h3><input type="checkbox" class="privilege " id="dmain_{$o.id}" onclick="cUnc(this,'d{$o.id}')" /> <label for="dmain_{$o.id}">{$lang.domain} - {$o.name}</label></h3>
                  <div class="pgroup">
                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <td width="33%">
                                <input type="checkbox" class="privilege d{$o.id} domains" id="domains_{$o.id}_basic" value="1" name="privileges[domains][{$o.id}][basic]" {if $submit.privileges.domains[$o.id].basic}checked="checked"{/if}/> <label for="domains_{$o.id}_basic">{$lang.domains_basic}</label>
                            </td>
                            <td width="33%">
                                <input type="checkbox" class="privilege  d{$o.id} domains" id="domains_{$o.id}_renew" value="1"  name="privileges[domains][{$o.id}][renew]" {if $submit.privileges.domains[$o.id].renew}checked="checked"{/if}/> <label for="domains_{$o.id}_renew">{$lang.domains_renew}</label>
                            </td>
                            <td width="33%">
                                <input type="checkbox" class="privilege  d{$o.id} domains" id="domains_{$o.id}_notify" value="1"  name="privileges[domains][{$o.id}][notify]" {if $submit.privileges.domains[$o.id].notify}checked="checked"{/if}/> <label for="domains_{$o.id}_notify">{$lang.services_notify}</label>

                            </td>
                        </tr>
                       
                        {if $o.widgets}
                            {foreach from=$o.widgets item=w name=wl}
                                {if $smarty.foreach.wl.index%3=='0'}<tr>{/if}
                                <td width="33%">
                                    <input type="checkbox" class="privilege d{$o.id} domains" id="domains_{$o.id}_{$w.name}" value="1" name="privileges[domains][{$o.id}][{$w.name}]" {if $submit.privileges.domains[$o.id][$w.name]}checked="checked"{/if}/> <label for="domains_{$o.id}_{$w.name}">{if $lang[$w.name]}{$lang[$w.name]}{elseif $w.fullname}{$w.fullname}{else}{$w.name}{/if}</label>
                                </td>
                                {if $smarty.foreach.wl.index%3=='5'}</tr>{/if}
                            {/foreach}
                        {/if}
                    </table>
                </div>
                {/foreach}
                </div>
            </div>
 </div></div>

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
<center>
    <input type="submit" value="{$lang.submit}" style="font-weight:bold;margin:5px;" class="padded" />
</center>

        {securitytoken}</form>

{else}
        <h1 class="details2">{$lang.profiles}</h1>
        {$lang.profileinfo}
        <br /> <br />
        <div class="wbox">
        <div class="wbox_header">{$lang.currentprofiles} </div>
        <div class="wbox_submenu">
            <a href="{$ca_url}profiles/add/">{$lang.addnewprofile}</a>
            <div class="clear"></div>
            </div>
        <div class="wbox_content"><div style="padding:10px 20px">
            {if $profiles}

                <table width="100%" cellspacing="0" cellpadding="0" border="0" class="styled">
                    <colgroup class="firstcol"></colgroup>
                    <colgroup class="alternatecol"></colgroup>
                    <colgroup class="firstcol"></colgroup>
                    <colgroup class="alternatecol"></colgroup>
                    <colgroup class="firstcol"></colgroup>
                    <tbody>
                        <tr>
                            <th align="left">{$lang.firstname}</th>
                            <th>{$lang.lastname}</th>
                            <th>{$lang.email}</th>
                            <th>{$lang.lastlogin}</th>
                            <th width="40"></th>
                        </tr>
                    </tbody>
                    <tbody id="updater">
                        {foreach from=$profiles item=p name=ff}
                        <tr class="{if $smarty.foreach.ff.index%2==0}even{/if}">
                            <td><a href="{$ca_url}profiles/edit/{$p.id}/">{$p.firstname}</a></td>
                            <td align="center"><a href="{$ca_url}profiles/edit/{$p.id}/">{$p.lastname}</a></td>
                            <td align="center"><a href="{$ca_url}profiles/edit/{$p.id}/">{$p.email}</a></td>
                            <td align="center">{if !$p.lastlogin|dateformat:$date_format}-{else}{$p.lastlogin|dateformat:$date_format}{/if}</td>
                            <td>
                                <a href="{$ca_url}profiles/&do=delete&id={$p.id}&security_token={$security_token}" onclick="return confirm('{$lang.areyousuredelete}');" class="deleteico">{$lang.delete}</a>
                            </td>
                        </tr>
                        {/foreach}
                    </tbody>
                </table>


            {else}
               {$lang.nothing}
            {/if}

        </div></div></div>

{/if}<br/><br/>