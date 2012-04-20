{if $action=='details' || $action=='password' || $action=='ccard' || $action=='affiliates' || $action=='profilepassword' || $action=='ipaccess'}
<div class="wbox">
    <div class="wbox_header">
        <strong>{$lang.details|capitalize}</strong>

        <ul class="wbox_menu">

            <li {if $action=='details'}class="bgon2"{else}class="bgoff2"{/if} ><a href="{$ca_url}clientarea/details/">{$lang.mydetails}</a></li>

            <li {if $action=='password'}class="bgon2"{else}class="bgoff2"{/if} ><a href="{$ca_url}clientarea/password/">{if $clientdata.contact_id}{$lang.changemainpass}{else}{$lang.changepass}{/if}</a></li>

            {if $clientdata.contact_id}<li {if $action=='profilepassword'}class="bgon2"{else}class="bgoff2"{/if} ><a href="{$ca_url}clientarea/profilepassword/">{$lang.changemypass}</a>{/if}

	{if $enableCCards}<li {if $action=='ccard'}class="bgon2"{else}class="bgoff2"{/if} ><a href="{$ca_url}clientarea/ccard/">{$lang.ccard}</a></li>{/if}
			<li {if $action=='ipaccess'}class="bgon2"{else}class="bgoff2"{/if} ><a href="{$ca_url}clientarea/ipaccess/">{$lang.ipaccess}</a></li>

        </ul>
    </div>
    <div class="wbox_content">

        {/if}
        {if $action=='details'}



        <form action='' method='post' >
            <input type="hidden" name="make" value="details" />

            <table width="100%" border=0 class="checker" cellspacing="0">

                <tbody>

                    {foreach from=$fields item=field name=floop key=k}
                    {if $field.field_type=='Password'}{continue}{/if}
                    <tr  {if $field.type=='Company' && $fields.type}class="{if $smarty.foreach.floop.iteration%2==0}even{/if} iscomp" style="{if !$client.company || $client.type=='Private'}display:none{/if}"
						{elseif $field.type=='Private' && $fields.type}class="ispr {if $smarty.foreach.floop.iteration%2==0}even{/if} " style="{if $client.company=='1'}display:none{/if}"
                        {elseif $smarty.foreach.floop.iteration%2==0}class="even" {/if}>
                        <td align="right" width="160">
                            {if $k=='type'}
                            {$lang.clacctype}
                            {elseif $field.options & 1}
                            {if $lang[$k]}{$lang[$k]}{else}{$field.name}{/if}
                            {else}
                            {$field.name}
                            {/if}
                            {if $field.options & 2}*{/if}
                        </td>
                        <td class="">
                            {if $k=='type'}
                            <select  name="type" style="width: 80%;" onchange="{literal}if ($(this).val()=='Private') {$('.iscomp').hide();$('.ispr').show();}else {$('.ispr').hide();$('.iscomp').show();}{/literal}">
                                <option value="Private" {if $client.company=='0'}selected="selected"{/if}>{$lang.Private}</option>
                                <option value="Company" {if $client.company=='1'}selected="selected"{/if}>{$lang.Company}</option>
                            </select>
                            {elseif $k=='country'}
                            {if !($field.options & 8)}
	{foreach from=$countries key=k item=v} {if $k==$client.country}{$v}{/if}{/foreach}
                            {else}
                            <select name="country" style="width: 80%;">
	{foreach from=$countries key=k item=v}
                                <option value="{$k}" {if $k==$client.country  || (!$client.country && $k==$defaultCountry)} selected="selected"{/if}>{$v}</option>

	{/foreach} {/if}
                            </select>
                            {else}
                            {if !($field.options & 8)}
                            {if $field.field_type=='Password'}
                            {elseif $field.field_type=='Check'}
                            {foreach from=$field.default_value item=fa}
                            {if in_array($fa,$client[$k])}{$fa}<br/>{/if}
							{/foreach}

                            {else}
                            {$client[$k]} <input type="hidden" value="{$client[$k]}" name="{$k}"/>

                            {/if}

                            {else}
                            {if $field.field_type=='Input'}
                            <input type="text" value="{$client[$k]}" style="width: 80%;" name="{$k}" class="styled"/>
                            {elseif $field.field_type=='Password'}
                            {elseif $field.field_type=='Select'}
                            <select name="{$k}" style="width: 80%;">
                                {foreach from=$field.default_value item=fa}
                                <option {if $client[$k]==$fa}selected="selected"{/if}>{$fa}</option>
                                {/foreach}
                            </select>
                            {elseif $field.field_type=='Check'}
                            {foreach from=$field.default_value item=fa}
                            <input type="checkbox" name="{$k}[{$fa}]" value="1" {if in_array($fa,$client[$k])}checked="checked"{/if} />{$fa}<br />
                            {/foreach}
                            {/if}
                            {/if}
                            {/if}
                        </td>
                    </tr>

                    {/foreach}






                    <tr class="even"><td colspan="2" align="center">

                            <input type="submit" value="{$lang.savechanges}" class="padded" style="font-weight:bold"/>



                        </td></tr>
            </table>{securitytoken}</form>
    </div></div>

{elseif $action=='profilepassword'}
<form action='' method='post' >
    <input type="hidden" name="make" value="changeprofilepassword" />
    <table width="100%" border=0 class="checker" cellspacing="0">
        <tbody>
            <tr><td align="right" width="160">{$lang.oldpass}</td>
                <td >
                    <input name="oldpassword" type="password"  class="styled"/>
                </td>
            </tr>
            <tr class="even"><td align="right" >{$lang.newpassword}</td>
                <td >
                    <input name="password" type="password"  class="styled"/>
                </td>
            </tr>
            <tr><td align="right">{$lang.confirmpassword}</td>
                <td >
                    <input name="password2" type="password"  class="styled"/><br>
                </td>
            </tr>
            <tr  class="even"><td colspan="2" align="center"><input type="submit" value="{$lang.savechanges}" class="padded" style="font-weight:bold"/></td></tr>

        </tbody></table>
	{securitytoken}</form>
</div></div>
{elseif $action=='password'}
<form action='' method='post' >
    <input type="hidden" name="make" value="changepassword" />
    <table width="100%" border=0 class="checker" cellspacing="0">
        <tbody>

            <tr><td align="right" width="160">{$lang.oldpass}</td><td >

                    <input name="oldpassword" type="password"  class="styled"/>

                </td></tr>
            <tr class="even"><td align="right" >{$lang.newpassword}</td><td >


                    <input name="password" type="password"  class="styled"/>
                </td></tr>
            <tr><td align="right">{$lang.confirmpassword}</td><td >
                    <input name="password2" type="password"  class="styled"/><br>


                </td></tr>
            <tr  class="even"><td colspan="2" align="center"><input type="submit" value="{$lang.savechanges}" class="padded" style="font-weight:bold"/></td></tr>

        </tbody></table>
	{securitytoken}</form>
</div></div>
{elseif $action=='affiliates'}
{if $affiliate}
<table width="100%" border=0 class="checker" cellspacing="0">

    <tbody>

        <tr><td align="right" width="160">{$lang.reflink}</td><td >
                <input value="{$system_url}?affid={$affiliate.id}" readonly="readonly" class="styled" style="width:88%"/>
            </td></tr>

        <tr class="even">
            <td align="right">{$lang.regdate}</td><td >
                {$affiliate.date_created|dateformat:$date_format}</td></tr>

        <tr >
            <td align="right">{$lang.referred}</td><td >
                {$affiliate.visits}</td></tr>

        <tr class="even">
            <td align="right">{$lang.curbalance}</td><td >
                {$affiliate.balance|price:$currency}</td></tr>

        <tr >
            <td align="right">{$lang.withdrawn}</td><td >
                {$affiliate.total_withdrawn|price:$currency}</td></tr>


    </tbody>
</table>
{if $payout}
<br />
<center><input type="button" class="padded"  value="{$lang.payout}" style="font-weight:bold;font-size:13px;" onclick="window.location.href='{$ca_url}tickets/new/';return false;"/></center>
{/if}	

<br />
{if $affiliate.orders}
<h3>{$lang.yreferrals}</h3>
<table cellspacing="0" cellpadding="0" border="0" width="100%" class="styled">
    <colgroup class="firstcol"></colgroup>
    <colgroup class="alternatecol"></colgroup>

    <colgroup class="firstcol"></colgroup>
    <colgroup class="alternatecol"></colgroup>

    <colgroup class="firstcol"></colgroup>
    <colgroup class="alternatecol"></colgroup>
    <tbody>
        <tr>
            <th>{$lang.signupdate}</th>
            <th>{$lang.services}</th>
            <th>{$lang.Amount}</th>
            <th>{$lang.commission}</th>
            <th>{$lang.status}</th>      
        </tr>
	{foreach from=$affiliate.orders item=order}
        <tr {if $smarty.foreach.foo.index%2 == 0}class="even"{/if}>

            <td>{$order.date_created|dateformat:$date_format}</td>

            <td>
			{if $order.acstatus}{$lang.Account}: {$order.pname}{/if}
			{if $order.domstatus}<br />{$lang.Domain}: {$order.domain}{/if}</td>
            <td align="center">{$order.total|price:$currency}</td>
            <td align="center">{$order.commission|price:$currency}</td>

            <td align="center"><strong>{if $order.paid=='1'}{$lang.approved}{else}{$lang.Pending}{/if}</strong></td>


        </tr>
        {/foreach}
    </tbody>


</table>
{/if}
<br />
{if $integration_code!=''}
<h3>{$lang.intcodes}</h3>
{$integration_code}
{/if}

{else}

{$lang.notaffiliateyet}<br />
<form action="" method="post">
    <input type="hidden" value="activateaffiliate" name="make" />
    <center><input type="submit" class="padded" style="font-weight:bold;font-size:14px" value="{$lang.becomeaffiliate}"/></center>{securitytoken}</form>
{/if}
</div></div>
{elseif $action=='ccard'}
<form action="" method="post">
    <table width="100%" border="0" class="checker" cellspacing="0">

        {if $ccard.cardnum}
        <tr><td align="right" width="160">{$lang.cctype}</td><td>{$ccard.cardtype}</td></tr>
        <tr class="even"><td align="right">{$lang.ccnum}</td><td>{$ccard.cardnum}</td></tr>
        <tr><td align="right">{$lang.ccexpiry}</td><td>{$ccard.expdate}</td></tr>
        <tr><td colspan="2" align="center"><input type="button" value="{$lang.changecc}" id="newccbut"  class="padded" onclick="$(this).attr('disabled','disabled'); $('#newccdetails').show(); return false;" />&nbsp;<input type="submit" name="removecard" value="{$lang.removecc}" onclick="return confirm('{$lang.removecc_confirm}')"  class="padded"/></td></tr>
        {else}
        <tr><td align="center" colspan="2" style="font-weight: bold">{$lang.nothing}</td></tr>
        <tr><td colspan="2" align="center"><input type="button" value="{$lang.newcc}" id="newccbut" onclick="$(this).attr('disabled','disabled'); $('#newccdetails').show(); return false;"   class="padded"/></td></tr>
        {/if}
    </table>
    <div id="newccdetails" style="display:none">
        <p><strong>{$lang.changeccdesc}</strong></p>
        <table width="50%" cellpadding="2">
            <tr><td width="150" >{$lang.cctype}</td><td>
                    <select name="cardtype">
                        <option>Visa</option>
                        <option>MasterCard</option>
                        <option>Discover</option>
                        <option>American Express</option>
                    </select>
                </td></tr>
            <tr><td >{$lang.ccnum}</td><td><input type="text" name="cardnum" size="25" class="styled"/></td></tr>
            <tr><td >{$lang.ccexpiry}</td>
                <td><input type="text" name="expirymonth" size="2" maxlength="2"  class="styled" /> /
                    <input type="text" name="expiryyear" size="2" maxlength="2"  class="styled" /> (MM/YY)</td></tr>
            <tr><td colspan="2"><input type="submit" name="addcard" value="{$lang.savechanges}"  class="padded"/> <input type="button" onclick="$('#newccdetails').hide(); $('#newccbut').removeAttr('disabled'); return false;" value="{$lang.cancelchanges}" class="padded"/></td></tr>
        </table>
    </div>
    {securitytoken}</form>
</div></div>

{elseif $action=='services' || $action=='accounts' || $action=='reseller' || $action=='vps' || $action=='servers'}

	{include file='services.tpl'}
{elseif $action=='invoices'}

	{include file='invoices.tpl'}

{elseif $action=='cancel'}

	{include file='cancel.tpl'}

{elseif $action=='ccprocessing'}
	{include file='ccprocessing.tpl'}

{elseif $action=='emails'}
	{include file='emails.tpl'}

{elseif $action=='domains'}
	{include file='domains.tpl'}
	
{elseif $action=='history'}
	{include file='history.tpl'}
{elseif $action=='ipaccess'}
	{include file='ipaccess.tpl'}
{else}

<br />
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td width="70%" style="padding-right:5px" valign="top" >	
		{if $action=='addfunds'}
            <div class="wbox">
                <div class="wbox_header">{$lang.addfunds}</div>

                <div class="wbox_content" id="cartSummary">
                    <p class="fs11">{$lang.addfunds_d}</p>
                    <center>
                        <form method="post">
                            <input type="hidden" name="make" value="addfunds" />
				{$lang.trans_amount}: <input name="funds" class="styled" size="4" value="{$mindeposit}"/> 
					{$lang.trans_gtw}: <select name="gateway">
						{foreach from=$gateways key=gatewayid item=paymethod}
                                <option value="{$gatewayid}">{$paymethod}</option>
                                {/foreach}
                            </select>
                            <input type="submit" class="padded" value="{$lang.addfunds}" style="font-weight:bold"/>
				{securitytoken}</form>
                    </center>	
                    <p class="fs11">{$lang.MinDeposit}: <strong>{$mindeposit|price:$currency}</strong> {$lang.MaxDeposit}: <strong>{$maxdeposit|price:$currency}</strong></p>


                </div>
            </div>

		{/if}



	{foreach from=$offer item=offe}
	{if $offe.total>0}
            <div class="wbox">
                <div class="wbox_header">{$offe.name} <a href="{$ca_url}clientarea/services/{$offe.slug}/&amp;from=ca" class="fs11 fsnormal">({$offe.total})</a></div>

                <div class="wbox_content">
                    <table border="0" cellpadding="0" cellspacing="3" width="100%">
                        <tr>
                            <td width="42" valign="top"><img src="{$template_dir}img/cf_boption.png" alt="{$offe.name}" /></td>
                            <td valign="top">
                                <a href="{$ca_url}clientarea/services/{$offe.slug}/" class="list_item">{$lang.listservices} ({$offe.total})</a><br />
                                <a href="{$ca_url}clientarea/services/{$offe.slug}/&amp;from=ca" class="list_item">{$lang.Upgrade}</a><br />
                                <a href="{$ca_url}clientarea/services/{$offe.slug}/&amp;from=ca&amp;do=cancel" class="list_item">{$lang.cancelrequest}</a><br />
				{if $offe.visible=='1'}<a href="{$ca_url}cart/{$offe.slug}/" class="list_item">{$lang.Add} {$offe.name}</a>{/if}


                            </td>
                        </tr>
                    </table>
                </div>

            </div>
	{/if}
	{/foreach}	


	{if $enableFeatures.domains!='off' || $mydomains>0}
            <div class="wbox">
                <div class="wbox_header">{$lang.mydomains} <a class="fs11 fsnormal" href="{$ca_url}clientarea/domains/&amp;from=ca" >({$mydomains})</a> {if $mydomains<1}<small class="right"><a href="{$ca_url}checkdomain"  class="fs11 fsnormal">{$lang.regdomain}</a></small>{/if}</div>
                {if $mydomains>0}<div class="wbox_content">
                    <table border="0" cellpadding="0" cellspacing="3" width="100%">
                        <tr>
                            <td width="42" valign="top"><img src="{$template_dir}icons/ico_domains2.jpg" alt="{$offe.mydomains}" /></td>
                            <td valign="top">
                                <a href="{$ca_url}clientarea/domains/" class="list_item">{$lang.listmydomains} ({$mydomains})</a><br />	
                                <a href="{$ca_url}clientarea/domains/&amp;from=ca" class="list_item">{$lang.renewdomain}</a><br />			

                            </td>
                            <td valign="top">
                                <a href="{$ca_url}checkdomain/" class="list_item">{$lang.regdomain}</a><br />
                                <a href="{$ca_url}checkdomain/transfer/" class="list_item">{$lang.transdomain}</a><br />
                            </td>
                        </tr>
                        {if $expdomains}
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td colspan="2"><div style="padding: 10px; background-color: #ffffab;"><span style="font-size: 11px; ">{$lang.ExpiringDomains}<span><br/>
                                {foreach from=$expdomains item=domain}
                                <a class="list_item" href="{$ca_url}clientarea/domains/{$domain.id}/{$domain.name}/">{$domain.name}</a> - 
                                <span style="font-size: x-small;">{if $domain.days <= 30 && $domain.days >= 0}<strong>{$domain.days} {if $domain.days==1}{$lang.day}{else}{$lang.days}{/if} {$lang.toexpire}!{else}{$lang.Expired}{/if}</strong></span><br />

                                {/foreach}</div>
                            </td>
                        </tr>
                        {/if}
                    </table>

                </div>{/if}</div>{/if}


	{foreach from=$offer item=offe}
	{if $offe.total<1 &&  $offe.visible=='1'}
            <div class="wbox">
                <div class="wbox_header">{$offe.name}
                    <small class="right"><a href="{$ca_url}cart/{$offe.slug}/" class="fs11 fsnormal">{$lang.ordernow}</a></small></div></div>

            {/if}
	{/foreach}


        </td>
        <td width="30%" style="padding-left:5px" valign="top" >
            <div class="wbox">
                <div class="wbox_header">{$lang.myaccount}</div>
                <div class="wbox_content">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="55"   valign="top"><img src="{$template_dir}img/clientarea_png.png" alt="{$lang.clientarea}" /></td>
                            <td  valign="top">
                                <a href="{$ca_url}clientarea/details/" class="list_item">{$lang.accdetails}</a><br />
                                <a href="{$ca_url}clientarea/invoices/" class="list_item">{$lang.invhistory}</a><br />
                                <a href="{$ca_url}clientarea/emails/" class="list_item">{$lang.emhistory}</a><br />
								<a href="{$ca_url}clientarea/history/" class="list_item">{$lang.userhistory}</a><br />
                                {if $enableFeatures.deposit!='off' }<a href="{$ca_url}clientarea&action=addfunds" class="list_item">{$lang.addfunds}</a><br />{/if}
                                {if $enableFeatures.profiles!='off' }<a href="{$ca_url}profiles/" class="list_item">{$lang.profiles}</a><br />{/if}
                            </td>
                        </tr>

                    </table>

                </div></div>


		{if $acc_balance && $acc_balance>0}
            <div class="yelbox">
                <form method="post" action="index.php">
                    <input type="hidden" name="action" value="payall"/>
                    <input type="hidden" name="cmd" value="clientarea"/>
                    {$lang.curbalance}: <strong>{$acc_balance|price:$currency}</strong>
                    <center><input type="submit" value="{$lang.paynow}" class="padded" style="font-weight:bold;margin:5px;"/></center>
                    {securitytoken}</form>
            </div>
            {/if}

            {if $acc_credit>0}
            <div class="greenbox">{$lang.credit}: <strong>{$acc_credit|price:$currency}</strong></div>
            {/if}


            {if $news}
            <div class="wbox">
                <div class="wbox_header">{$lang.recent_news}</div>
                <div class="wbox_content">
                    {$news.content}
                    <div style="text-align:right"><a href="{$ca_url}news/" class="fs11">{$lang.dotmore}</a></div>

                </div></div>
            {/if}
        </td>
    </tr>

    <tr>
        <td style="padding-right:5px">


            <div class="wbox">
                <div class="wbox_header">{$lang.support}</div>
                <div class="wbox_content">
                    <table border="0" cellpadding="0" cellspacing="3" width="100%">
                        <tr>
                            <td width="55"   valign="top"><img src="{$template_dir}icons/ico_support.png" alt="{$lang.support}" /></td>
					{if $enableFeatures.kb!='off' || $enableFeatures.downloads!='off'}
                            <td   valign="top">
                                <strong>{$lang.supresource}</strong>	<br />	
					{if $enableFeatures.kb!='off'}<a href="{$ca_url}knowledgebase/" class="list_item">{$lang.vsarticles}</a><br />{/if}
					{if $enableFeatures.downloads!='off'}<a href="{$ca_url}downloads/" class="list_item">{$lang.browsedownloads}</a>{/if}

                            </td>{/if}
                            <td   valign="top">
                                <strong>{$lang.contactus}</strong><br />
						{if $enableFeatures.chat!='off'}<a href="{$ca_url}chat/" class="list_item">{$lang.chat}</a><br />{/if}
                                <a href="{$ca_url}tickets/" class="list_item">{$lang.ticketarchive}</a><br />
                                <a href="{$ca_url}tickets/new/" class="list_item">{$lang.openticket}</a>

                            </td>

                        </tr>
				{if $openedtickets}<tr><td colspan="3" valign="top" style="padding:5px 0px;">

                                <strong>{$lang.openedtickets|capitalize}</strong>

                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
						 	{foreach from=$openedtickets item=ticket name=foo}	

                                    <tr><td><a href="{$ca_url}tickets/view/{$ticket.ticket_number}/" class="annoucement_date fs11 fsnormal">
							{$ticket.deptname} - {if $ticket.client_read=='0'}<strong>{/if}
								{$ticket.subject|wordwrap:40:"<br />\n":true}
							{if $ticket.client_read==0}</strong>{/if}
                                            </a></td>
                                        <td align="right">

                                        </td></tr>

							{/foreach}

                                    <tr><td colspan="2" align="right"><a href="{$ca_url}tickets/" class="fs11">{$lang.dotmore}</a></td></tr>
                                </table>	

                            </td></tr>{/if}
                    </table>
                </div>
            </div>
        </td>
        <td></td>
    </tr>	

</table>





{/if}<br />
<br />
