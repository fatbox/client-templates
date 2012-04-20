{*

    Browse logs related to client

*}
<div class="bordered-section article">
<h2>{$lang.userhistory}</h2>
 {if $logs}

  
<a href="{$ca_url}clientarea&action=history" id="currentlist" style="display:none" updater="#updater"></a>
<table cellspacing="0" cellpadding="0" border="0" width="100%" class="table table-striped  fullscreen">
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
    {include file='ajax/ajax.history.tpl'}
  </tbody>
  
</table>
<div class="clear"></div>
    <div class="right p19 pt0">
        <div class="pagelabel left ">{$lang.page}</div>
        <div class="btn-group right" data-toggle="buttons-radio" id="pageswitch">
            {section name=foo loop=$totalpages}
                <button class="btn {if $smarty.section.foo.iteration==1}active{/if}">{$smarty.section.foo.iteration}</button>
             {/section}
        </div>
        <input type="hidden" id="currentpage" value="0" />


    </div>
    <div class="clear"></div>
{else}
	<h3>{$lang.nothing}</h3>
{/if}
</div>