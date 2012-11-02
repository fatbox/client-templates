{*

Add and/or edit contact

*}<h2 >{$lang.profiles}{if $action=='add'}: {$lang.addnewprofile} {else}: {$submit.firstname} {$submit.lastname}{/if}</h2>
<div class="brcrm">
    <ul class="breadcrumb left">
        <li><a href="{$ca_url}profiles/"><strong>{$lang.profiles}</strong></a> <span class="divider">/</span></li>
        <li class="active">{if $action=='add'} {$lang.addnewprofile} {else} {$lang.profiledetails}{/if}</li>
    </ul>

    <a class="btn right btn-mini" href="{$ca_url}profiles/"><i class="icon-chevron-left"></i> {$lang.back}</a>

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
            {foreach from=$privilages item=privs key=group}
                {foreach from=$privs item=privopt}{if !$privopt.displaygroup || $privoptdisplaygroup==group}{assign value=1 var=displaythis}{/if}{/foreach}
                {if $displaythis!=1}{break}{/if}
                <h4><input type="checkbox" class="privilege " id="{$group}_main" onclick="cUnc(this,'{$group}')" /><span for="{$group}_main" > {assign value="`$group`_main" var=groupmain}{$lang[$groupmain]}</span></h4>
                <div class="pgroup mb20">
                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                        {counter name=trp print=false start=0 assign=trp}
                        {foreach from=$privs item=privopt key=priv name=loop}
                            {if $privopt.condition && !$privopt.condition|checkcondition}{continue}{/if}
                            {if $trp != 0 && $trp % 3 == 0}</tr>{/if}
                            {if $trp % 3 == 0}<tr>{/if}
                            
                            <td width="33%">
                                <input type="checkbox" class="privilege {$group}" id="{$group}_{$priv}"  value="1" name="privileges[{$group}][{$priv}]" {if $submit.privileges.$group.$priv}checked="checked"{/if}  /> 
                                <span for="{$group}_{$priv}" {if $privopt.important}style="color:red"{/if}> 
                                    {assign value="`$group`_`$priv`" var=grouppriv}{$lang[$grouppriv]}
                                </span>
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
                                        <span for="{$group2}_{$priv}" {if $privopt.important}style="color:red"{/if}> 
                                            {assign value="`$group2`_`$priv`" var=grouppriv}{$lang[$grouppriv]}
                                        </span>
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
