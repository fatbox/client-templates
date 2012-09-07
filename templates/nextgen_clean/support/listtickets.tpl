<div class="bordered-section article">

    <h2 class="left">{$lang.tickets|capitalize}</h2>
{if $tickets || $currentfilter}
        <div class="right searchform form-horizontal">
            <div class="input-append">
                <form style="margin:0px" id="testform" href="{$ca_url}tickets/" method="post"><input type="text" size="16" name="filter[subject]" class="span3" value="{$currentfilter.subject}" placeholder="{$lang.filtertickets}" id="d_filter"  /><button type="submit" class="btn {if $tickets}submiter{/if}" style="{if $currentfilter.subject}{else}display:none;{/if}" name="resetfilter=1" id="r_filter"  onclick="$('#d_filter').val('');$('#r_filter').hide()">{$lang.Reset}</button><button onclick="$('#r_filter').show()" type="submit" class="{if $tickets}submiter{/if} btn btn-success"><i class="icon-search icon-white"></i></button></form>
              </div>
        </div>
    {/if}
    <div class="clear"></div>
    <p class="p19 pt0">{$lang.mytickets_desc}</p>
     <div class="ribbon form-horizontal">

            <div class="control-group">
                <label for="appendedPrependedInput" class="control-label left" style="width:auto">{$lang.newticket_desc}</label>
                <div class="right">
                    <a href="{$ca_url}tickets/new/" class="btn btn-success btn-large"><i class="icon-envelope icon-white"></i> {$lang.openticket|capitalize}</a>
                </div>
            </div>

    </div>
    <div class="ribbon-shadow-l"></div>
    <div class="ribbon-shadow-r"></div>

	{if $tickets}


        <div class="p19">
            <h3>{$lang.ticketarchive} <span class="right statistic">{$lang.tickets_opened} <span class="badge open">{$open_tickets}</span> {$lang.tickets_closed} <span class="badge">{$closed_tickets}</span> </span></h3>
        </div>

    <form action="" method="post" id="testform" >

        <a href="{$ca_url}tickets" id="currentlist" style="display:none" updater="#updater"></a>
        <table cellspacing="0" cellpadding="0" border="0" width="100%" class="table table-striped fullscreen">
           
            <tbody>
                <tr>

                    <th width="70"><a href="{$ca_url}tickets&amp;orderby=status|ASC"  class="sortorder">{$lang.status}</a></th>
                    <th ><a href="{$ca_url}tickets&amp;orderby=subject|ASC"  class="sortorder">{$lang.subject}</a></th>
                    <th width="230"><a href="{$ca_url}tickets&amp;orderby=name|ASC" class="sortorder">{$lang.department}</a></th>
                    <th width="130"><a href="{$ca_url}tickets&amp;orderby=date|ASC"  class="sortorder">{$lang.date}</a></th>

                </tr>
            </tbody>
            <tbody id="updater">

                {include file='ajax.tickets.tpl'}
            </tbody>

        </table>
        {if $totalpages>1}
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
        <div class="clear"></div>{/if}

        {securitytoken}</form>

	{else}

        <div class="p19"><h3>{$lang.nothing}</h3></div>
	{/if}
</div>