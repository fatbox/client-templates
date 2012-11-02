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
                    {foreach from=$privilages item=privs key=group}
                    {foreach from=$privs item=privopt}{if !$privopt.displaygroup || $privoptdisplaygroup==group}{assign value=1 var=displaythis}{/if}{/foreach}
                    {if $displaythis!=1}{break}{/if}
                    <h3><input type="checkbox" class="privilege " id="{$group}_main" onclick="cUnc(this,'{$group}')" />
                        <label for="{$group}_main" > {assign value="`$group`_main" var=groupmain}{$lang[$groupmain]}</label>
                    </h3>
                    <div class="pgroup mb20">
                        <table border="0" cellspacing="0" cellpadding="0" width="100%">
                            {counter name=trp print=false start=0 assign=trp}
                            {foreach from=$privs item=privopt key=priv name=loop}
                                {if $privopt.condition && !$privopt.condition|checkcondition}{continue}{/if}
                                {if $trp != 0 && $trp % 3 == 0}</tr>{/if}
                                {if $trp % 3 == 0}<tr>{/if}

                                <td width="33%">
                                    <input type="checkbox" class="privilege {$group}" id="{$group}_{$priv}"  value="1" name="privileges[{$group}][{$priv}]" {if $submit.privileges.$group.$priv}checked="checked"{/if}  /> 
                                    <label for="{$group}_{$priv}" {if $privopt.important}style="color:red"{/if}> 
                                        {assign value="`$group`_`$priv`" var=grouppriv}{$lang[$grouppriv]}
                                    </label>
                                </td>
                                {counter name=trp}
                            {/foreach}
                            {assign value=0 var=displaythis}
                            {foreach from=$privilages item=privs2 key=group2}
                                {foreach from=$privs2 item=privopt key=priv name=loop}
                                {if $privopt.displaygroup == $group && (!$privopt.condition || $privopt.condition|checkcondition)}
                                    {if $trp != 0 && $trp % 3 == 0}</tr>{/if}
                                    {if $trp % 3 == 0}<tr>{/if}
                                        <td width="33%">
                                            <input type="checkbox" class="privilege {$group2}" id="{$group2}_{$priv}"  value="1" name="privileges[{$group2}][{$priv}]" {if $submit.privileges.$group2.$priv}checked="checked"{/if}  /> 
                                            <label for="{$group2}_{$priv}" {if $privopt.important}style="color:red"{/if}> 
                                                {assign value="`$group2`_`$priv`" var=grouppriv}{$lang[$grouppriv]}
                                            </label>
                                        </td>
                                    {counter name=trp}
                                {/if}
                                {/foreach}
                            {/foreach}
                            <tr></tr>
                        </table>
                    </div>
                {/foreach}
                {literal}
                <script type="text/javascript" >
                    $('#services_full').change(function(){
                        if($(this).is(':checked'))$('#priv_serv').slideUp();else $('#priv_serv').slideDown();
                    }).change();
                    $('#domains_full').change(function(){
                        if($(this).is(':checked'))$('#priv_dom').slideUp();else $('#priv_dom').slideDown();
                    }).change();
                </script>
                {/literal}
                
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
                                    <input type="checkbox" class="privilege s{$o.id} services" id="services_{$o.id}_{$w.name}" value="1" name="privileges[services][{$o.id}][{$w.name}]" {if $submit.privileges.services[$o.id][$w.name]}checked="checked"{/if}/> <label for="services_{$o.id}_{$w.name}">{assign var=widg_name value="`$w.name`_widget"}{if $lang[$widg_name]}{$lang[$widg_name]}{elseif $lang[$w.name]}{$lang[$w.name]}{elseif $w.fullname}{$w.fullname}{else}{$w.name}{/if}</label>
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
                                    <input type="checkbox" class="privilege d{$o.id} domains" id="domains_{$o.id}_{$w.name}" value="1" name="privileges[domains][{$o.id}][{$w.name}]" {if $submit.privileges.domains[$o.id][$w.name]}checked="checked"{/if}/> <label for="domains_{$o.id}_{$w.name}">{assign var=widg_name value="`$w.name`_widget"}{if $lang[$widg_name]}{$lang[$widg_name]}{elseif $lang[$w.name]}{$lang[$w.name]}{elseif $w.fullname}{$w.fullname}{else}{$w.name}{/if}</label>
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