{if $edit}
<h1 class="domains2">{if $details}{$lang.domdetails} {$details.name}{elseif $widget}
{if $lang[$widget.name]}{$lang[$widget.name]}{elseif $widget.fullname}{$widget.fullname}{else}{$widget.name}{/if}
{/if}</h1>
<div class="cbreadcrumb"><a href="{$ca_url}clientarea/"><strong>{$lang.clientarea}</strong></a> &raquo; <a href="{$ca_url}clientarea/domains/"><strong>{$lang.domains}</strong></a>
{if $widget}{if $details}&raquo; <a href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/"><strong>{$details.name}</strong></a>{/if} &raquo; {if $lang[$widget.name]}{$lang[$widget.name]}{elseif $widget.fullname}{$widget.fullname}{else}{$widget.name}{/if}
{elseif $details}
 &raquo; <strong>{$details.name}</strong>{/if}
   </div>
<br />

{if $bulkdetails}
<div class="wbox">
    <div class="wbox_header">{$lang.bulkdomains}</div>
    <div  class="wbox_content" id="cartSummary">
        {foreach from=$bulkdetails item=b}
            <a href="{$ca_url}clientarea/domains/{$b.id}/{$b.name}/">{$b.name}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        {/foreach}
    </div>
</div>
{/if}
{if $widget.appendtpl}
    {include file=$widget.appendtpl}
{/if}
{if $widget.replacetpl}
    {include file=$widget.replacetpl}



{elseif $details}
<div {if $details.status=='Active'}class="left"  style="width:630px;"{/if}>
 <div class="wbox">
  	<div class="wbox_header">
	{if !$regcommand}{$lang.domdetails|capitalize}{/if}


</div>

	<div class="wbox_content">
	<div class="tabb">

<table width="100%" cellspacing="0" cellpadding="0" class="checker">
           

        <tr >
          <td align="right">{$lang.domain}:</td>
          <td><strong><a href="http://{$details.name}" target="_blank">{$details.name}</a></strong></td>
          <td>&nbsp; </td>
        </tr>
        <tr class="even" >
          <td width="160" align="right">{$lang.registrationdate}:</td>
          <td>{if !$details.date_created || $details.date_created == '0000-00-00'}{$lang.none}{else}{$details.date_created|dateformat:$date_format}{/if}</td>
          <td>&nbsp; </td>
        </tr>
        <tr >
          <td align="right">{$lang.status}:</td>
          <td><span class="{$details.status}">{$lang[$details.status]}</span></td>
          <td>&nbsp; </td>
        </tr>
		
	
		
        {if $details.status == 'Active' || $details.status == 'Expired'}
        <tr class="even">
          <td align="right" >{$lang.expirydate}:</td>
          <td>
              {if !$details.expires || $details.expires == '0000-00-00'}{$lang.none}{else}{$details.expires|dateformat:$date_format} {if $details.daytoexpire >= 0}<small class="fs11">({$details.daytoexpire} {if $domain.daytoexpire==1}{$lang.day}{else}{$lang.days}{/if} {$lang.toexpire})</small>{/if}{/if}



              
          </td>
          <td>
            {if $allowrenew}<img src="{$template_dir}icons/shopping-basket.png" alt="{$lang.renewdomain}" /> <a href="{$ca_url}clientarea/domains/renew/&ids[]={$details.id}">{$lang.renewdomain}</a>{/if}
          </td>
        </tr>
        {/if}
         {if $details.status == 'Active'}
        <tr >
          <td align="right">{$lang.reglock}:  <span class="vtip_description" title="{$lang.reglock_desc}"></span></td>
          <td>{if $details.reglock=='1'}{$lang.On}{else}<span class="Pending">{$lang.Off}</span>{/if}</td>
          <td>{foreach from=$widgets item=widg name=cst}{if $widg.name=='reglock'}<img src="{$install_url}{$widg.config.smallimg}" alt="{$widg.name}" /> <a  href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/&widget={$widg.name}#reglock">{assign var=widg_name value="`$widg.name`_widget"}{if $lang[$widg_name]}{$lang[$widg_name]}{elseif $lang[$widg.name]}{$lang[$widg.name]}{elseif $widg.fullname}{$widg.fullname}{else}{$widg.name}{/if}</a>{break}{/if}{/foreach}&nbsp; </td>
        </tr>
     {if !$details.not_renew}   <tr  class="even">
          <td align="right">{$lang.autorenew}:  <span class="vtip_description" title="{$lang.autorenew_desc}"></span></td>
          <td>{if $details.autorenew=='1'}{$lang.On}{else}<span class="Pending">{$lang.Off}</span>{/if}</td>
          <td>{foreach from=$widgets item=widg name=cst}{if $widg.name=='autorenew'}<img src="{$install_url}{$widg.config.smallimg}" alt="{$widg.name}" /> <a  href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/&widget={$widg.name}#autorenew">{assign var=widg_name value="`$widg.name`_widget"}{if $lang[$widg_name]}{$lang[$widg_name]}{elseif $lang[$widg.name]}{$lang[$widg.name]}{elseif $widg.fullname}{$widg.fullname}{else}{$widg.name}{/if}</a>{break}{/if}{/foreach}&nbsp; </td>
        </tr>
        {/if}
       {* <tr >
          <td align="right">{$lang.nameservers}</td>
          <td>{foreach from=$details.nameservers item=ns}{if $ns!=''}{$ns}<br/>{/if}{/foreach}</td>
          <td>{foreach from=$widgets item=widg name=cst}{if $widg.name=='nameservers'}<img src="{$install_url}{$widg.config.smallimg}" alt="{$widg.name}" /> <a  href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/&widget={$widg.name}#nameservers">{assign var=widg_name value="`$widg.name`_widget"}{if $lang[$widg_name]}{$lang[$widg_name]}{elseif $lang[$widg.name]}{$lang[$widg.name]}{elseif $widg.fullname}{$widg.fullname}{else}{$widg.name}{/if}</a>{break}{/if}{/foreach}&nbsp; </td>
        </tr>
		*}
		
		
            {if $details.offerprotection}<tr  class="even">
              <td align="right">{$lang.privacyprotection}:  <span class="vtip_description" title="{$lang.privacyprotection_desc}"></span></td>
              <td>{if $details.offerprotection.enabled}{$lang.On}{else}<span class="Pending">{$lang.Off}</span>{/if}</td>
              <td>
                {if $details.offerprotection.purchased}
{foreach from=$widgets item=widg name=cst}{if $widg.name=='idprotection'}<img src="{$install_url}{$widg.config.smallimg}" alt="{$widg.name}" /> <a  href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/&widget={$widg.name}#idprotection">{assign var=widg_name value="`$widg.name`_widget"}{if $lang[$widg_name]}{$lang[$widg_name]}{elseif $lang[$widg.name]}{$lang[$widg.name]}{elseif $widg.fullname}{$widg.fullname}{else}{$widg.name}{/if}</a>{break}{/if}{/foreach}
                {else}
<img src="{$template_dir}icons/shopping-basket.png" alt="{$lang.idprotection}" /> <a href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/&make=domainaddons">{$lang.addprivacy}</a>
                {/if}&nbsp; 
              </td>
            </tr>
            {/if}
        {/if}
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
    <fieldset style="border: 1px solid rgb(221, 221, 221); margin: 20px; border-bottom:none">
	<legend style="margin-left: 20px; padding: 0pt 5px;">{$lang.nameservers} {foreach from=$widgets item=widg name=cst}{if $widg.name=='nameservers'}<img style="position:relative; top:3px" src="{$install_url}{$widg.config.smallimg}" alt="{$widg.name}" /> <a  href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/&widget={$widg.name}#nameservers">{assign var=widg_name value="`$widg.name`_widget"}{if $lang[$widg_name]}{$lang[$widg_name]}{elseif $lang[$widg.name]}{$lang[$widg.name]}{elseif $widg.fullname}{$widg.fullname}{else}{$widg.name}{/if}</a>{break}{/if}{/foreach}&nbsp;</legend>
		<table cellspacing="0" cellpadding="0" class="checker" width="100%"><tr><th>Host name</th><th>IP Address </th></tr>
			{foreach from=$details.nameservers item=ns name=namserver}{if $ns!=''}
				 <tr {if $smarty.foreach.namserver.index%2==0}class="even"{/if}><td>{$ns}</td><td>{if $details.nsips[$smarty.foreach.namserver.index]}{$details.nsips[$smarty.foreach.namserver.index]}{/if}</td></tr>
			{/if}{/foreach}
		</table>
	</fieldset>

	
    
</div>
</div>

</div>



</div>{if $details.status=='Active'}
<div id="sidemenu">

  <div class="wbox">
  <div class="wbox_header">
	{$lang.managementtool}
	</div>
	<div class="wbox_content">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td valign="top" width="42">
			<img src="{$template_dir}img/cf_boption.png" alt="" />
			</td>
			<td>
			<ul class="subside">
				<li><a  href="#"  class="tchoice"><strong>{$lang.billing_info|capitalize}</strong></a></li>
                                {foreach from=$widgets item=widg name=cst}{if $widg.name!='reglock' && $widg.name!='nameservers'  && $widg.name!='autorenew' } {if $widg.name=='idprotection' && $details.offerprotection && !$details.offerprotection.purchased}{continue}{/if}
                                <li {if $smarty.foreach.cst.last}class="last"{/if}><a  href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/&widget={$widg.name}{if $widg.id}&wid={$widg.id}{/if}#{$widg.name}">{if $widg.fullname}{$widg.fullname}{elseif $lang[$widg.name]}{$lang[$widg.name]}{else}{$widg.name}{/if}</a></li>
                            {/if}{/foreach}
{if $custom} {foreach from=$custom item=btn name=cst}
          <li {if $smarty.foreach.cst.last}class="last"{/if}><a href="#" onclick="$('#cbtn_{$btn}').click();return false;">{$lang.$btn}</a> </li>
        {/foreach} {/if}
	 
				
			</ul>
			
			</td>
		</tr>
	</table>
	</div>
  </div>
  
</div>{/if}


	  <div class="clear"></div>
	  
	  
         

{/if}
          {if $widget.appendaftertpl}
          <a name="{$widget.name}"></a>
            {include file=$widget.appendaftertpl}
        {/if}
{else}

<link media="all" type="text/css" rel="stylesheet" href="{$template_dir}domains.css" />
<h1 class="domains2">{$lang.domains|capitalize}</h1>

    {if $domains}

   
    <div class="icons">
        <div class="left dwarrow">{$lang.withdomains} </div>

        <ul class="right">
            <li class="disabled widget_domainrenewal">
                <a href="{$ca_url}clientarea/domains/renew/" onclick="return bulk_widget(this)">
                    <img src="{$template_dir}icons/ico-renew.png" alt="">
                    <span>{$lang.renew_widget}</span>
                </a>
            </li> {if $domwidgets}
						{foreach from=$domwidgets item=widg}<li class="disabled widget_{$widg.widget}">
                <a href="{$ca_url}clientarea/domains/bulkdomains/&widget={$widg.widget}" onclick="return bulk_widget(this)">
                    <img src="{$system_url}{$widg.config.bigimg}" alt="">
                    <span>{assign var=widg_name value="`$widg.name`_widget"}
						{if $lang[$widg_name]}{$lang[$widg_name]}{elseif $lang[$widg.widget]}{$lang[$widg.widget]}{else}{$widg.name}{/if}</span>
                </a>
            </li>
                                                {/foreach} {/if}

        </ul>
        <div class="clear"></div>
    </div>
   


    <a href="{$ca_url}clientarea&amp;action=domains" id="currentlist" style="display:none" updater="#updater"></a>
    <table cellspacing="0" cellpadding="0" border="0" width="100%" class="styled">
	  <colgroup class="firstcol"></colgroup>
<colgroup class="alternatecol"></colgroup>

<colgroup class="firstcol"></colgroup>
<colgroup class="alternatecol"></colgroup>

<colgroup class="firstcol"></colgroup>
<colgroup class="alternatecol"></colgroup>
      <tbody>
        <tr>
        <th width="20"><input type="checkbox" onclick="c_all(this)" /></th>
        <th align="left"><a href="{$ca_url}clientarea/domains/&amp;orderby=name|ASC"  class="sortorder">{$lang.domain}</a></th>
        <th width="120"><a href="{$ca_url}clientarea/domains/&amp;orderby=date_created|ASC"  class="sortorder">{$lang.registrationdate}</a></th>
        <th width="100"><a href="{$ca_url}clientarea/domains/&amp;orderby=expires|ASC"  class="sortorder">{$lang.expirydate}</a></th>
        <th width="80"><a href="{$ca_url}clientarea/domains/&amp;orderby=status|ASC"  class="sortorder">{$lang.status}</a></th>

        <th width="80">{$lang.autorenew}</th>
          <th width="20"/>
    
        </tr>  </tbody><tbody id="updater">
     
       {include file='ajax.domains.tpl'}
    
        </tbody>
       
       
    
    </table><br />
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr><td width="50%" align="left">{if $lang.add_domain}<form method="post" action="{$ca_url}checkdomain"><input type="submit" value="{$lang.add_domain}" />{securitytoken}</form>{/if}</td><td align="right">{if $totalpages>1}{$lang.page}
    <select name="page" id="currentpage">      
{section name=foo loop=$totalpages}          
      <option value='{$smarty.section.foo.iteration-1}'>{$smarty.section.foo.iteration}</option>         
{/section}    
    </select>
 {$lang.pageof}<strong> {$totalpages}</strong>{/if}</td></tr>
	</table> 

    <script type="text/javascript">
        {literal}
            function bulk_widget(el) {
                 var ids = $('.idchecker:checked').serialize();
                   if(ids=='') {
                        return false;
                }

                window.location = $(el).attr('href')+'&'+ids;
                    return false;
            }
                function c_all(el) {
                    if($(el).is(':checked')) {
                        $('.idchecker').not(':disabled').attr('checked','checked').parents('tr').addClass('shownice');
                            $.getJSON('?cmd=clientarea&action=domains&make=widgetsget&'+$('.idchecker').serialize(),{},function(data){
                                 $('.icons li').addClass('disabled');
                                     $('.icons li.widget_domainrenewal').removeClass('disabled');
                                     $.each(data.resp, function(index, i) {
                                          $('.icons li.widget_'+i.widget).removeClass('disabled');
                                        });

                            });
                    } else {
                        $('.idchecker').not(':disabled').removeAttr('checked').parents('tr').removeClass('shownice');
                            $('.icons li').addClass('disabled');
                    }
                
                }
            function c_unc(el) {
                var v=$(el);
                    if(v.is(':checked')) {
                        v.parents('tr').eq(0).addClass('shownice');
                    } else {
                        v.parents('tr').eq(0).removeClass('shownice');
                    }

                var ids = $('.idchecker:checked').serialize();
                     $('.icons li').addClass('disabled');
                if(ids=='') {
                        return;
                }
                $.getJSON('?cmd=clientarea&action=domains&make=widgetsget&'+ids,{},function(data){
                     $('.icons li').addClass('disabled');
                         $('.icons li.widget_domainrenewal').removeClass('disabled');
                         $.each(data.resp, function(index, i) {
                              $('.icons li.widget_'+i.widget).removeClass('disabled');
                            });
                   
                });
             }
            {/literal}
    </script>

    {else}
	{'?cmd=checkdomain'|string_format:$lang.nodomains}
  
    {/if}
{/if}<br />
<br />
