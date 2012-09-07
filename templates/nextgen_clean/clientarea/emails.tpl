{*

Browse email history

*}
<div class="bordered-section article">{if $email}
    <h2 >{$email.subject}</h2>


    <div class="brcrm">
        <span class="annoucement_date left"><i class="icon-time"></i> {$lang.sent} {$email.date|dateformat:$date_format}</span>

        <a href="{$ca_url}clientarea/emails/"  class="btn btn-mini right"><i class="icon-chevron-left"></i> Back</a>

        <div class="clear"></div>
    </div>
    <div class="p19">
        <p >{$email.message}</p>
    </div>

  

    {else}
    <h2>{$lang.emails|capitalize}</h2>
    <p class="p19 pt0">{$lang.email_info}</p>
    
    {if $emails}
    
    <a href="{$ca_url}clientarea&amp;action=emails" id="currentlist" style="display:none" updater="#updater"></a>
    <table cellspacing="0" cellpadding="0" border="0" width="100%" class="table table-striped  fullscreen">
        <colgroup class="firstcol"></colgroup>
        <colgroup class="alternatecol"></colgroup>

        <tbody>
            <tr>
                <th><a href="{$ca_url}clientarea&amp;action=emails&amp;orderby=subject|ASC"  class="sortorder">{$lang.subject}</a></th>
                <th width="150"><a href="{$ca_url}clientarea&amp;action=emails&amp;orderby=date|ASC"  class="sortorder">{$lang.date_sent}</a></th>
            </tr>
        </tbody>
        <tbody id="updater">

            {include file='ajax/ajax.emails.tpl'}
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
    <h3> {$lang.nothing}</h3>
    {/if}
    {/if}
</div>