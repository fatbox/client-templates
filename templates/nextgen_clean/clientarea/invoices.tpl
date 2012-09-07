{*

    Browse invoices history

*}<div class="bordered-section article"><h2>{$lang.invoices|capitalize}</h2>

{if ($acc_balance && $acc_balance>0) ||  $enableFeatures.deposit!='off' }
    <div class="ribbon form-horizontal">
            <div class="control-group">
                <label for="appendedPrependedInput" class="control-label left" style="width:auto">{$lang.curbalance}:  <b>{$acc_balance|price:$currency}</b></label>
                  {if $enableFeatures.deposit!='off' }
                  <div class="right" style="margin-left:10px">
                     <a href="{$ca_url}clientarea&action=addfunds" class="btn btn-info btn-large">{$lang.addfunds}</a>
                </div>
                 {/if}
                 {if $acc_balance && $acc_balance>0}
                 <div class="right" style="margin-left:10px">
                     <form method="post" action="index.php">
                    <input type="hidden" name="action" value="payall"/>
                    <input type="hidden" name="cmd" value="clientarea"/>
                    <button class="btn btn-success btn-large"><i class="icon-ok-sign icon-white"></i> <b>{$lang.paynowdueinvoices}</b></button>
                    {securitytoken}</form>
                </div>
                 {/if}


            </div>
    </div>
    <div class="ribbon-shadow-l"></div>
    <div class="ribbon-shadow-r"></div>
    <div class="divider"></div>
 {/if}

 {if $invoices}



<a href="{$ca_url}clientarea&amp;action=invoices" id="currentlist" style="display:none" updater="#updater"></a>
<table cellspacing="0" cellpadding="0" border="0" width="100%" class="table table-striped  fullscreen">
<colgroup class="firstcol"></colgroup>
<colgroup class="alternatecol"></colgroup>

<colgroup class="firstcol"></colgroup>
<colgroup class="alternatecol"></colgroup>

<colgroup class="firstcol"></colgroup>
<colgroup class="alternatecol"></colgroup>
  <tbody>
    <tr>
      <th width="70"><a href="{$ca_url}clientarea&amp;action=invoices&amp;orderby=status|ASC"  class="sortorder">{$lang.status}</a></th>
      <th><a href="{$ca_url}clientarea&amp;action=invoices&amp;orderby=id|ASC" class="sortorder">{$lang.invoicenum}</a></th>
      <th width="120"><a href="{$ca_url}clientarea&amp;action=invoices&amp;orderby=total|ASC"  class="sortorder">{$lang.total}</a></th>
      <th width="120"><a href="{$ca_url}clientarea&amp;action=invoices&amp;orderby=date|ASC"  class="sortorder">{$lang.invoicedate}</a></th>
      <th width="120"><a href="{$ca_url}clientarea&amp;action=invoices&amp;orderby=duedate|ASC"  class="sortorder">{$lang.duedate}</a></th>
      <th width="20"/>
    </tr>
  </tbody>
  <tbody id="updater">
      {include file='ajax/ajax.invoices.tpl'}
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
<h3 class="p19">{$lang.nothing}</h3>
{/if}
</div>