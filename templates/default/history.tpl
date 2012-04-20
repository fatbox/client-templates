<h1 class="invoices2">{$lang.userhistory}</h1>
 {if $logs}
<p align="right"> {$lang.page}
  <select name="page" id="currentpage">
{section name=foo loop=$totalpages} 
    <option value='{$smarty.section.foo.iteration-1}'>{$smarty.section.foo.iteration}</option> 
{/section}
</select> of:<strong> {$totalpages}</strong> </p>
  
<a href="{$ca_url}clientarea&action=history" id="currentlist" style="display:none" updater="#updater"></a>
<table cellspacing="0" cellpadding="0" border="0" width="100%" class="styled">
<colgroup class="firstcol"></colgroup>
<colgroup class="alternatecol"></colgroup>

<colgroup class="firstcol"></colgroup>
<colgroup class="alternatecol"></colgroup>

<colgroup class="firstcol"></colgroup>
<colgroup class="alternatecol"></colgroup>
  <tbody>
    <tr>
      <th><a href="{$ca_url}clientarea&action=history&orderby=date|ASC"  class="sortorder">{$lang.date}</a></th>
      <th><a href="{$ca_url}clientarea&action=history&orderby=description|ASC"  class="sortorder">{$lang.invoice_desc}</a></th>
      <th><a href="{$ca_url}clientarea&action=history&orderby=result|ASC"  class="sortorder">{$lang.status}</a></th>
      <th></th>
    </tr>
  </tbody>
  <tbody id="updater">
  {include file='ajax.history.tpl'}
  </tbody>
  
</table>
<br />
{else}
	<div>{$lang.nothing}</div>
{/if}