<h1 class="invoices2">{$lang.invoices|capitalize}</h1>
 {if $invoices}
<p align="right"> Page:
  <select name="page" id="currentpage">
    
      
{section name=foo loop=$totalpages} 
   
      
    <option value='{$smarty.section.foo.iteration-1}'>{$smarty.section.foo.iteration}</option>
    
      
{/section}



    
  </select>
  of:<strong> {$totalpages}</strong> </p>
<a href="{$ca_url}clientarea&amp;action=invoices" id="currentlist" style="display:none" updater="#updater"></a>
<table cellspacing="0" cellpadding="0" border="0" width="100%" class="styled">
<colgroup class="firstcol"></colgroup>
<colgroup class="alternatecol"></colgroup>

<colgroup class="firstcol"></colgroup>
<colgroup class="alternatecol"></colgroup>

<colgroup class="firstcol"></colgroup>
<colgroup class="alternatecol"></colgroup>
  <tbody>
    <tr>
      <th><a href="{$ca_url}clientarea&amp;action=invoices&amp;orderby=id|ASC" class="sortorder">{$lang.invoicenum}</a></th>
      <th><a href="{$ca_url}clientarea&amp;action=invoices&amp;orderby=date|ASC"  class="sortorder">{$lang.invoicedate}</a></th>
      <th><a href="{$ca_url}clientarea&amp;action=invoices&amp;orderby=duedate|ASC"  class="sortorder">{$lang.duedate}</a></th>
      <th><a href="{$ca_url}clientarea&amp;action=invoices&amp;orderby=total|ASC"  class="sortorder">{$lang.total}</a></th>
      <th><a href="{$ca_url}clientarea&amp;action=invoices&amp;orderby=status|ASC"  class="sortorder">{$lang.status}</a></th>
      <th width="20"/>
    </tr>
  </tbody>
  <tbody id="updater">
  
  {include file='ajax.invoices.tpl'}
  </tbody>
  
</table>
<br />
{else}
{$lang.nothing}
{/if}