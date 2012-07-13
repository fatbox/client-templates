{if $edit}
{include file='services/domain_details.tpl'}
{else}
<div class="bordered-section article">
    <h2 class="{if !$domains}bbottom{/if} left">{$lang.domains|capitalize}</h2>
    {if $domains}
        <div class="right searchform form-horizontal">
            <div class="input-append">
                <form style="margin:0px" id="testform"><input type="text" size="16" name="filter[name]" class="span3" value="" placeholder="{$lang.filterdomains}" id="d_filter"  /><button type="button" class="btn submiter" style="display:none" name="resetfilter=1" id="r_filter"  onclick="$('#d_filter').val('');$('#r_filter').hide()">{$lang.Reset}</button><button onclick="$('#r_filter').show()" type="submit" class="submiter btn btn-success"><i class="icon-search icon-white"></i></button></form>
              </div>
        </div>
    {/if}
    <div class="clear"></div>
    {if $domains}

    <div class="ribbon form-horizontal">

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

    </div>
    <div class="ribbon-shadow-l"></div>
    <div class="ribbon-shadow-r"></div>
    <div class="divider"></div>



    <a href="{$ca_url}clientarea&amp;action=domains" id="currentlist" style="display:none" updater="#updater"></a>
    <table cellspacing="0" cellpadding="0" border="0" width="100%" class="table table-striped fullscreen">
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
                <th width="50"/>

            </tr>  </tbody><tbody id="updater">

            {include file='ajax/ajax.domains.tpl'}

        </tbody>

    </table>
    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="fullscreen">
        <tr><td width="50%" align="left">
                {if $lang.add_domain}
                <form method="post" action="{$ca_url}checkdomain">
                    <button class="btn btn-info"><i class="icon-shopping-cart icon-white"></i> {$lang.add_domain}</button>{securitytoken}</form>{/if}</td>
            <td align="right">
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
            </td></tr>
    </table>

</div>
<script type="text/javascript" src="{$template_dir}js/domains.js"></script>
<link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/domains.css" />
{else}
    <div class="p19">
        <h3>{$lang.nothing}</h3>
          {if $lang.add_domain}
                <form method="post" action="{$ca_url}checkdomain">
                    <button class="btn btn-info"><i class="icon-shopping-cart icon-white"></i> {$lang.add_domain}</button>{securitytoken}</form>{/if}
    </div>
{/if}
{/if}
