{if $newticket}
<script type="text/javascript">
{literal}
function switchdeptdesc(items) {

	$('.deptsdesc').find('div').hide();
	$('#d'+items).show();
    $('.dptpriority').hide().find('select').attr('disabled','disabled');
    $('#p'+items).show().find('select').removeAttr('disabled');
}
{/literal}
</script>

<h1 class="tickets2">{$lang.openticket}</h1>
{$lang.newticket_desc}<br /><br />


<form  enctype="multipart/form-data" method="post" >
  <input name="make" type="hidden" value="addticket" />
<table width="100%" cellspacing="0"  border="0" class="checker">
            <tbody>
           {if !$clientdata.firstname}
               <tr>
                <td width="160"  align="right">{$lang.name}</td>
                <td>
                  <input name="client_name" value="{$submit.client_name}" class="styled"/>
                  </td>
              </tr>
              <tr class="even">
                <td  align="right">{$lang.email}</td>
                <td>
                  <input name="client_email" value="{$submit.client_email}" class="styled"/>
                  </td>
              </tr>
           {/if}
              <tr>
                <td width="160"  align="right" valign="middle">{$lang.department}</td>
                <td valign="middle"><select name="dept_id" onchange="switchdeptdesc(this.value)" style="float:left; margin-right:10px;">
                    
				{foreach from=$depts item=dept}
					
                    <option value="{$dept.id}" {if $submit.dept_id==$dept.id}selected="selected"{/if}>{$dept.name}</option>
                    
				{/foreach}
			
                  </select>
				  <div class="deptsdesc" >
				  	{foreach from=$depts item=dept name=fff}
					<div id="d{$dept.id}" {if $submit.dept_id && $submit.dept_id==$dept.id} style="display:block" {elseif $smarty.foreach.fff.first}  style="display:block"  {/if}>{$dept.description}</div>
				  {/foreach}
				  </div>
				  
                </td>
              </tr>
              <tr  class="even">
                <td align="right">{$lang.subject}</td>
                <td><input type="text" value="{$submit.subject}" size="60" name="subject"  class="styled"/></td>
              </tr>
              {if $clientdata}
              {foreach from=$depts item=dept name=loop}
                   {if $dept.options & 64}
                       <tr id="p{$dept.id}" class="dptpriority" {if ($submit && $submit.dept_id!=$dept.id) || ( !$submit && !$smarty.foreach.loop.first)}style="display: none"{/if}>
                           <td  align="right">{$lang.priority}</td>  
                           <td >
                               <select {if ($submit && $submit.dept_id!=$dept.id) || ( !$submit && !$smarty.foreach.loop.first)}disabled="disabled"{/if} name="priority" style="float:left; margin-right:10px;">
                                   <option {if $submit.priority==0}selected="selected"{/if} value="0" >{$lang.low}</option>
                                   <option {if $submit.priority==1}selected="selected"{/if} value="1" >{$lang.medium}</option>
                                   <option {if $submit.priority==2}selected="selected"{/if} value="2" >{$lang.high}</option>
                               </select>
                           </td>  
                       </tr>
                   {/if}
               {/foreach}
               {/if}
              <tr>
                <td colspan="2">
				{$lang.message}<br />

				<textarea style="width: 99%;" cols="60" rows="12"  name="body" id="ticketmessage">{$submit.body}</textarea>
				<div id="hintarea" style="display:none"></div>
				</td>
              </tr>
              <tr  class="even">
                <script type="text/javascript">
					{literal}
					function addAnother(el) {
						$(el).after('<br/><input type="file" size="50" name="attachments[]"/>');
						return false;
					}
					{/literal}
					</script>
                <td  align="right">{$lang.attachments}</td>
                <td><input type="file" size="50" name="attachments[]" />
                  <a onclick="return addAnother(this)" href="#" >{$lang.addanother}</a><br/>
                  <div id="fileuploads"/>
                  <small>{$extensions|string_format:$lang.allowedext}</small></td>
              </tr>

              {if $captcha}
              <tr>
                <td align="right">{$lang.imageverification}</td>
                <td>{$lang.typethecharacters} <br />
                    <img src="?cmd=root&amp;action=captcha" /><br />
                    <input type="text" value="" size="15" name="image_verification"  class="styled"/>
                </td>
              </tr>
              {/if}
			  <tr><td colspan="2" align="center"><input type="submit" value="{$lang.submit}" style="font-weight:bold" class="padded"/></td></tr>
            </tbody>
          </table> 
    

{securitytoken}</form>
{/if}
{if $ticketcreated}
<h1 class="tickets2">{$lang.ticketcreated}&nbsp;<a href="{$ca_url}tickets/view/{$tnum}/&amp;hash={$thash}">#{$tnum}</a></h1>
{$lang.ticketcreated_desc}<br /><br />

{/if}

{if $ticket}
<div >
  <h1 class="tickets2">{$lang.viewticket} #{$ticket.ticket_number}</h1>
  
  <table width="100%" cellspacing="0"  border="0" class="checker">
    <tbody>
      <tr>
        <th>{$lang.department}</th>
        <th>{$lang.date}</th>
        <th>{$lang.subject|wordwrap:40:"\n":true}</th>
        <th>{$lang.status}</th>

      </tr>
      <tr class="even">
        <td align="center">{$ticket.deptname}</td>
        <td align="center">{$ticket.date|dateformat:$date_format}</td>
        <td align="center">{$ticket.subject|wordwrap:40:"\n":true}</td>
        <td align="center"><span class="{$ticket.status}"><strong>{$lang[$ticket.status]}</strong></span></td>

      </tr>
    </tbody>
  </table>
  <br/>
  
  <div >
    <table width="100%" cellspacing="0" cellpadding="10" border="0" {if $ticket.type=='Client'}class="cticket"{else}class="aticket"{/if}>
      <tbody>
        <tr class="heade">
          <td><strong>{$ticket.name}</strong></td>
          <td align="right">{$ticket.date|dateformat:$date_format}</td>
        </tr>
		<tr><td colspan="2">
		 <div class="ticketreply">{$ticket.body|httptohref|nl2br}<br/>
  {if !empty($attachments[0])}
<strong>		{$lang.attachments}</strong><br />
{foreach from=$attachments[0] item=attachment}
		<a href="?action=download&amp;id={$attachment.id}" class="attach3">{$attachment.org_filename}</a><br />
		{/foreach}
	
  {/if}
   </div>
		</td></tr>
		
      </tbody>
    </table>
  </div>
 
   
   {if $replies && !empty($replies) }
   <h3>{$lang.replies}</h3>
   {foreach from=$replies item=reply}
  <div >
    <table width="100%" cellspacing="0" cellpadding="10" border="0" {if $reply.type=='Client'}class="cticket"{else}class="aticket"{/if}>
      <tbody>
        <tr class="heade">
          <td><strong>{$reply.name}</strong> {if $reply.type=='Admin'}{$lang.staff}{/if}</td>
          <td align="right">{$reply.date|dateformat:$date_format}</td>
        </tr>
		<tr>
		<td colspan="2">
		 <div class="ticketreply">
  {$reply.body|httptohref|nl2br}<br />
{if !empty($attachments[$reply.id])}
<br /><strong>		{$lang.attachments}</strong><br />
{foreach from=$attachments[$reply.id] item=attachment}
		<a href="?action=download&amp;id={$attachment.id} "  class="attach3">{$attachment.org_filename}</a><br />
		{/foreach}
	
  {/if}
  
    </div>
		</td>
		</tr>
		
      </tbody>
    </table>
  </div>
  
 
  <br/>
  {/foreach}
  {/if}
  
  {if $ticket.status!='Closed'}
  
  <div style="text-align:center;margin-top:10px;">
   <form  action="" method="post">
  <input type="hidden" value="closeticket" name="make" />
    <input type="submit"  value="{$lang.resolved}" style="font-weight:bold;padding:5px;"/>
	{securitytoken}</form>
  </div><br />

  
  
<div class="wbox">
<div class="wbox_header">{$lang.reply}</div><div class="wbox_content">
  <form enctype="multipart/form-data" action="" method="post">
  <input type="hidden" value="addreply" name="make" />
   <input name="client_name" type="hidden" value="{$ticket.name}"/>
                
                  <input name="client_email" value="{$ticket.email}" type="hidden"/>
    <table width="100%" cellspacing="0" cellpadding="0" class="frame">
      <tbody>
        <tr>
          <td><table width="100%" cellspacing="10" cellpadding="0" border="0">
              <tbody>
         
		   
                 
                 
                <tr>
                  <td colspan="2"><textarea style="width: 98%;" cols="60" rows="12"  name="body" id="ticketmessage">{$submit.body}</textarea>
				  <div id="hintarea" style="display:none"></div></td>
                </tr>
                <tr>
                <script type="text/javascript">
					{literal}
					function addAnother(el) {
						$(el).after('<br/><input type="file" size="50" name="attachments[]"/>');
						return false;
					}
					{/literal}
					</script>
                <td>{$lang.attachments}</td>
                <td><input type="file" size="50" name="attachments[]" />
                  <a onclick="addAnother(this)" href="javascript:void(0)" >{$lang.addanother}</a><br/>
                  <div id="fileuploads"/>
                   <small>{$extensions|string_format:$lang.allowedext}</small></td>
              </tr>
              </tbody>
            </table></td>
        </tr>
      </tbody>
    </table>
    <p align="center">
      <input type="submit" class="padded" value="{$lang.submit}" style="font-weight:bold"/>
    </p>
  {securitytoken}</form>
  </div></div>
  
  {else}
   <div style="text-align:center;margin-top:10px;">
   <form  action="" method="post">
  <input type="hidden" value="reopen" name="make" />
    <input type="submit"  value="{$lang.reopen}" style="font-weight:bold;padding:5px;"/>
	{securitytoken}</form>
  </div><br />
  
  {/if}
</div>
  

{/if}


{if $action=='default'}
<h1 class="tickets2">{$lang.tickets|capitalize}</h1>
{$lang.mytickets_desc}<br />
<br />
<a href="{$ca_url}tickets/new/"><strong>{$lang.openticket|capitalize}</strong></a>
<br /><br />
	{if $tickets}


<form action="" method="post" id="testform" >
 
  <a href="{$ca_url}tickets" id="currentlist" style="display:none" updater="#updater"></a>
  <table cellspacing="0" cellpadding="0" border="0" width="100%" class="styled">
  <colgroup class="firstcol"></colgroup>
<colgroup class="alternatecol"></colgroup>

<colgroup class="firstcol"></colgroup>
<colgroup class="alternatecol"></colgroup>
    <tbody>
      <tr>
  		<th><a href="{$ca_url}tickets&amp;orderby=date|ASC"  class="sortorder">{$lang.date}</a></th>
        <th><a href="{$ca_url}tickets&amp;orderby=name|ASC" class="sortorder">{$lang.department}</a></th>
        <th width="40%"><a href="{$ca_url}tickets&amp;orderby=subject|ASC"  class="sortorder">{$lang.subject}</a></th>
        <th><a href="{$ca_url}tickets&amp;orderby=status|ASC"  class="sortorder">{$lang.status}</a></th>
 <th width="20"></th>

      </tr>
    </tbody>
    <tbody id="updater">
    
    {include file='ajax.tickets.tpl'}
    </tbody>
    
  </table>
  {if $totalpages>1}<p align="right"> {$lang.page}
    <select name="page" id="currentpage">      
{section name=foo loop=$totalpages}          
      <option value='{$smarty.section.foo.iteration-1}'>{$smarty.section.foo.iteration}</option>         
{/section}    
    </select>
 {$lang.pageof}<strong> {$totalpages}</strong> </p>{/if}
 
{securitytoken}</form>

	{else}
	<br />

		{$lang.notickets}
	
	{/if}

{/if}<br />
<br />
