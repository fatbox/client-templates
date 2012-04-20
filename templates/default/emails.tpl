{if $email}
<h1 class="emails2">{$email.subject}</h1>
<div class="cbreadcrumb"><a href="{$ca_url}clientarea&amp;action=emails">&laquo; {$lang.backtoema}</a></div>
<p align="justify">{$email.message}<br />
<small>{$lang.sent} {$email.date|dateformat:$date_format}</small>
</p>

{else}
<h1 class="emails2">{$lang.emails|capitalize}</h1>
<p>{$lang.email_info}</p>
 {if $emails}
<p align="right"> {$lang.page}
  <select name="page" id="currentpage">{section name=foo loop=$totalpages} 
   <option value='{$smarty.section.foo.iteration-1}'>{$smarty.section.foo.iteration}</option>
   {/section}</select>
   
  {$lang.pageof}<strong> {$totalpages}</strong> </p>
<a href="{$ca_url}clientarea&amp;action=emails" id="currentlist" style="display:none" updater="#updater"></a>
<table cellspacing="0" cellpadding="0" border="0" width="100%" class="styled">
<colgroup class="firstcol"></colgroup>
<colgroup class="alternatecol"></colgroup>
<colgroup class="firstcol"></colgroup>

  <tbody>
    <tr>
      <th><a href="{$ca_url}clientarea&amp;action=emails&amp;orderby=subject|ASC"  class="sortorder">{$lang.subject}</a></th>
      <th><a href="{$ca_url}clientarea&amp;action=emails&amp;orderby=date|ASC"  class="sortorder">{$lang.date_sent}</a></th>
  
      <th width="20"></th>
    </tr>
  </tbody>
  <tbody id="updater">
  
  {include file='ajax.emails.tpl'}
  </tbody>
  
</table>
<br />
{else}
{$lang.nothing}
{/if}
{/if}