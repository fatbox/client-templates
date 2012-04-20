{if $bulkdetails}
<ul class="breadcrumb">
    <li><a href="{$ca_url}clientarea/"><strong>{$lang.clientarea}</strong></a> <span class="divider">/</span></li>
    <li><a href="{$ca_url}clientarea/domains/"><strong>{$lang.domains}</strong></a> <span class="divider">/</span></li>

    {if $widget} <li><a href="{$ca_url}clientarea/services/domains/{$service.id}/"><strong>{$details.name}</strong></a>  <span class="divider">/</span></li>
    <li class="active">{if $lang[$widget.name]}{$lang[$widget.name]}{elseif $widget.fullname}{$widget.fullname}{else}{$widget.name}{/if}</li>{else}
    <li class="active">{$details.name}</li>{/if}
</ul>

<div class="wbox">
    <div class="wbox_header">{$lang.bulkdomains}</div>
    <div  class="wbox_content" id="cartSummary">
        {foreach from=$bulkdetails item=b}
        <a href="{$ca_url}clientarea/domains/{$b.id}/{$b.name}/">{$b.name}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        {/foreach}
    </div>
</div>

{if $widget.replacetpl}
{include file=$widget.replacetpl}
{elseif $widget.appendtpl}
{include file=$widget.appendtpl}
{elseif $widget.appendaftertpl}
<a name="{$widget.name}"></a>
{include file=$widget.appendaftertpl}
{/if}



{elseif $details}
<div class="row flex-container bordered-section">

    <div class="span3 left-content flex-box-1">
        <div class="sidebar-block">
            <div class="header-title">
                <h3 >{$lang.domdetails}</h3>
            </div>
        </div>


            {if $details.status=='Active'}


            <ul class="leftmenu">
                <li {if !$widget}class="current"{/if}><a  href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/"  ><span class="home">{$lang.domdetails}</span></a></li>
                {foreach from=$widgets item=widg name=cst}{if $widg.name!='reglock' && $widg.name!='nameservers'  && $widg.name!='autorenew' } {if $widg.name=='idprotection' && $details.offerprotection && !$details.offerprotection.purchased}{continue}{/if}
                <li {if $widget.name==$widg.name}class="current"{/if}><a  href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/&widget={$widg.name}{if $widg.id}&wid={$widg.id}{/if}#{$widg.name}">
                   <span class="{$widg.name}">
                    <img src="{$system_url}{$widg.location}/small.png" alt="" />{if $widg.fullname}{$widg.fullname}{elseif $lang[$widg.name]}{$lang[$widg.name]}{else}{$widg.name}{/if}</span></a></li>
                {/if}{/foreach}
                {if $custom} {foreach from=$custom item=btn name=cst}
                <li {if $smarty.foreach.cst.last}class="last"{/if}><a href="#" onclick="$('#cbtn_{$btn}').click();return false;">{$lang.$btn}</a> </li>
                {/foreach} {/if}


            </ul>

            {else}
                 <div class="sidebar-block">

                    {if $details.status=='Pending' ||  $details.status=='Pending Registration'}

                        {$lang.domainpendinginfo}

                    {elseif $details.status=='Pending Transfer'}

                       {$lang.domainpendingtransferinfo}

                    {elseif $details.status=='Expired'}

                        {$lang.domainexpiredinfo}
                    {elseif $details.status=='Cancelled' ||  $details.status=='Fraud'}

                    {$lang.domaincanceledinfo}
                       

                    {/if}
                </div>
            {/if}
    </div>
    <div class="span9 right-content flex-box-1">

        <div class="header-title">
            <h2>{if $details} {$details.name}{elseif $widget}
                {if $lang[$widget.name]}{$lang[$widget.name]}{elseif $widget.fullname}{$widget.fullname}{else}{$widget.name}{/if}
                {/if}</h2>
        </div>

        <div class="brcrm">
            <ul class="breadcrumb left">
                <li><a href="{$ca_url}clientarea/"><strong>{$lang.clientarea}</strong></a> <span class="divider">/</span></li>
                <li><a href="{$ca_url}clientarea/domains/"><strong>{$lang.domains}</strong></a> <span class="divider">/</span></li>

                {if $widget} <li><a href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/"><strong>{$details.name}</strong></a>  <span class="divider">/</span></li>
                <li class="active">{if $lang[$widget.name]}{$lang[$widget.name]}{elseif $widget.fullname}{$widget.fullname}{else}{$widget.name}{/if}</li>{else}
                <li class="active">{$details.name}</li>{/if}
            </ul>
            <a href="{$ca_url}clientarea/domains/" class="right btn btn-mini"><i class="icon-chevron-left"></i> {$lang.back}</a>
            <div class="clear"></div>
        </div>


        {if $widget.appendtpl}
        {include file=$widget.appendtpl}
        {/if}


        {if $widget.replacetpl}
            {include file=$widget.replacetpl}
        {else}
            <div class="p19 serviceinfo">

                <div class="row">
                    <div class="span8 mb15">
                        <h3>{$lang.domain}</h3>
                        <h4><a href="http://{$details.name}" target="_blank">{$details.name}</a></h4>
                    </div>
                    <div class="span4 mb15">
                        <h3>{$lang.registrationdate}</h3>
                        <h4>{if !$details.date_created || $details.date_created == '0000-00-00'}{$lang.none}{else}{$details.date_created|dateformat:$date_format}{/if}</h4>
                    </div>

                    {if $details.status == 'Active' || $details.status == 'Expired'}
                     <div class="span4 mb15">
                         <h3>{$lang.expirydate}</h3>
                         {if !$details.expires || $details.expires == '0000-00-00'}{$lang.none}{else}<h4 class="left">{$details.expires|dateformat:$date_format}</h4> {if $details.daytoexpire >= 0}
                            <small class="fs11">({$details.daytoexpire} {if $domain.daytoexpire==1}{$lang.day}{else}{$lang.days}{/if} {$lang.toexpire})</small>
                        {/if}{/if}
 <span class="right"> {if $allowrenew}<img src="{$template_dir}icons/shopping-basket.png" alt="{$lang.renewdomain}" /> <a href="{$ca_url}clientarea/domains/renew/&ids[]={$details.id}">{$lang.renewdomain}</a>{/if}</span>
                    <span class="clear"></span>

                    </div>{/if}

                    <div class="span4 mb15">
  <h3>{$lang.status}</h3>
                        <span class="label label-{$details.status}">{$lang[$details.status]}</span>
                    </div>

                     



                {if $details.status == 'Active'}
                <div class="span4 mb15">
                    <h3>{$lang.reglock}:  <span class="vtip_description" title="{$lang.reglock_desc}"></span></h3>
                    {if $details.reglock=='1'}<span class="label label-Active">{$lang.On}</span>{else}<span class="label label-Expired">{$lang.Off}</span>{/if}
                    <span class="right"> {foreach from=$widgets item=widg name=cst}{if $widg.name=='reglock'}<img src="{$install_url}{$widg.config.smallimg}" alt="{$widg.name}" />
                        <a  href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/&widget={$widg.name}#reglock">{assign var=widg_name value="`$widg.name`_widget"}{if $lang[$widg_name]}{$lang[$widg_name]}{elseif $lang[$widg.name]}{$lang[$widg.name]}{elseif $widg.fullname}{$widg.fullname}{else}{$widg.name}{/if}</a>{break}{/if}{/foreach}&nbsp;</span>
                    <span class="clear"></span>
                 </div>
                {if !$details.not_renew}
                <div class="span4 mb15">
                     <h3>{$lang.autorenew}:  <span class="vtip_description" title="{$lang.autorenew_desc}"></span></h3>
                    {if $details.autorenew=='1'}<span class="label label-Active">{$lang.On}</span>{else}<span class="label label-Expired">{$lang.Off}</span>{/if}
                   <span class="right">  {foreach from=$widgets item=widg name=cst}{if $widg.name=='autorenew'}<img src="{$install_url}{$widg.config.smallimg}" alt="{$widg.name}" /> <a  href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/&widget={$widg.name}#autorenew">{assign var=widg_name value="`$widg.name`_widget"}{if $lang[$widg_name]}{$lang[$widg_name]}{elseif $lang[$widg.name]}{$lang[$widg.name]}{elseif $widg.fullname}{$widg.fullname}{else}{$widg.name}{/if}</a>{break}{/if}{/foreach}&nbsp; </span>
                   <span class="clear"></span>
                </div>
                {/if}

                {if $details.offerprotection}
               <div class="span4 mb15">
                    <h3>{$lang.privacyprotection}:  <span class="vtip_description" title="{$lang.privacyprotection_desc}"></span></h3>
                    {if $details.offerprotection.enabled}<span class="label label-Active">{$lang.On}</span>{else}<span class="label label-Expired">{$lang.Off}</span>{/if}
                    
                        {if $details.offerprotection.purchased}
                        <span class="right"> {foreach from=$widgets item=widg name=cst}{if $widg.name=='idprotection'}<img src="{$install_url}{$widg.config.smallimg}" alt="{$widg.name}" /> <a  href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/&widget={$widg.name}#idprotection">{assign var=widg_name value="`$widg.name`_widget"}{if $lang[$widg_name]}{$lang[$widg_name]}{elseif $lang[$widg.name]}{$lang[$widg.name]}{elseif $widg.fullname}{$widg.fullname}{else}{$widg.name}{/if}</a>{break}{/if}{/foreach}</span>
                        {else}
                       <span class="right">  <img src="{$template_dir}icons/shopping-basket.png" alt="{$lang.idprotection}" /> <a href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/&make=domainaddons">{$lang.addprivacy}</a></span>
                        {/if}&nbsp;
                   <span class="clear"></span>
                 </div>
                {/if}



                                {/if}

                </div>
                <div class="clear"></div>
            <table width="100%" cellspacing="0" cellpadding="0" class="table table-striped ">
                {if $details.custom}
                {assign var="service" value=$details}
			{foreach from=$details.custom item=cst name=cstloop}{if $cst.variable!='idprotection'}
                <tr {if $smarty.foreach.cstloop.index%2==0}class="even"{/if}>
                    <td align="right">{$cst.name}</td>
                    <td colspan="2">{include file=$cst.configtemplates.clientarea}</td>

                </tr>
                {/if}
			{/foreach}

                {/if}
            </table>

                <h3>{$lang.nameservers}</h3>
                <table cellspacing="0" cellpadding="0" class="table table-striped table-bordered" width="100%">
                    <tr><th>Host name</th><th>IP Address </th></tr>
			{foreach from=$details.nameservers item=ns name=namserver}{if $ns!=''}
                    <tr {if $smarty.foreach.namserver.index%2==0}class="even"{/if}><td>{$ns}</td><td>{if $details.nsips[$smarty.foreach.namserver.index]}{$details.nsips[$smarty.foreach.namserver.index]}{/if}</td></tr>
			{/if}{/foreach}
                        <tr><td colspan="2">
                                 {foreach from=$widgets item=widg name=cst}{if $widg.name=='nameservers'}<img  src="{$install_url}{$widg.config.smallimg}" alt="{$widg.name}" /> <a  href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/&widget={$widg.name}#nameservers">{assign var=widg_name value="`$widg.name`_widget"}{if $lang[$widg_name]}{$lang[$widg_name]}{elseif $lang[$widg.name]}{$lang[$widg.name]}{elseif $widg.fullname}{$widg.fullname}{else}{$widg.name}{/if}</a>{break}{/if}{/foreach}&nbsp;
                            </td></tr>
                </table>






        <div class="clear"></div>




        {if $widget.appendaftertpl}
        <a name="{$widget.name}"></a>
        {include file=$widget.appendaftertpl}
        {/if}

        {* eof: if widget replace *}
        </div>
        {/if}

    </div>
</div>

{* eof: if details *}
{/if}