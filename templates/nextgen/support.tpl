{if $enableFeatures.kb!='off'}
<div class="row mb40">
    <div class="span4">
        <div class="box-feature"><a href="{$ca_url}knowledgebase/"><span class="iconfont-info-round iconfont-size5 silver" style=""></span></a>
            <h1>{$lang.knowledgebase}</h1>
        </div>
    </div>
    <div class="span8">
        <table class="table table-bordered table-striped">
          <thead>
              <tr>
                <th>Popular categories
            <a href="{$ca_url}knowledgebase/" class="btn btn-mini right">{$lang.dotmore}</a>
            <div class="clear"></div></th>
              </tr>
            </thead>
            <tbody>
               {foreach from=$topkb item=kb}
              <tr>
                <td> <a href="{$ca_url}knowledgebase/category/{$kb.id}/" class="list_item">{$kb.name}</a></td>
              </tr>
              {foreachelse}
               <tr>
                <td>{$lang.nothing}</td>
              </tr>
              {/foreach}

            </tbody>
          </table>

    </div>
</div>
{/if}

{if $enableFeatures.downloads!='off'}
<div class="row mb40">
    <div class="span4">
        <div class="box-feature"><a href="{$ca_url}downloads/"><span class="iconfont-download iconfont-size5 silver" style=""></span></a>
            <h1>{$lang.downloads}</h1>
        </div>
    </div>

    <div class="span8">
        <table class="table table-bordered table-striped">
          <thead>
              <tr>
                <th>Popular categories
            <a href="{$ca_url}downloads/" class="btn btn-mini right">{$lang.dotmore}</a>
            <div class="clear"></div></th>
              </tr>
            </thead>
            <tbody>
               {foreach from=$topdw item=kb}
              <tr>
                <td> <a href="{$ca_url}knowledgebase/category/{$kb.id}/" class="list_item">{$kb.name}</a></td>
              </tr>
              {foreachelse}
               <tr>
                <td>{$lang.nothing}</td>
              </tr>
              {/foreach}

            </tbody>
          </table>

    </div>
    
</div>
{/if}

<div class="row mb40">
    <div class="span4">
        <div class="box-feature"><a href="{$ca_url}tickets/"><span class="iconfont-mail iconfont-size5 silver" style=""></span></a>
            <h1>{$lang.tickets}</h1>
        </div>
    </div>
    <div class="span8">
        <table class="table table-bordered table-striped">
          <thead>
              <tr>
                <th colspan="2">{$lang.openedtickets|capitalize}

            <a href="{$ca_url}tickets/" class="btn btn-mini right">{$lang.dotmore}</a>
            <div class="clear"></div>
                </th>
              </tr>
            </thead>
            <tbody>
		{foreach from=$openedtickets item=ticket name=foo}
              <tr>
                  <td width="70"><span class="label label-{$ticket.status}">{$lang[$ticket.status]}</span></td>
                <td> <a href="{$ca_url}tickets/view/{$ticket.ticket_number}/"> {$ticket.deptname} -
                        {if $ticket.client_read=='0'}<strong>{/if}
                                {$ticket.subject}
                        {if $ticket.client_read==0}</strong>{/if}
                    </a></td>
              </tr>
              {foreachelse}
               <tr>
                <td colspan="2">{$lang.nothing}</td>
              </tr>
              {/foreach}

            </tbody>
          </table>

    </div>

    

</div>


{if $enableFeatures.netstat!='off'}
<div class="row mb40">
    <div class="span4">
        <div class="box-feature"><a href="{$ca_url}netstat/"><span class="iconfont-path iconfont-size5 silver" style=""></span></a>
            <h1>{$lang.netstat|capitalize}</h1>
        </div>
    </div>

    <div class="span8">
        <div class="bordered-section article">
            <div class="p19">{$lang.networkstatusintro} <div class="clear"></div>
            <a href="{$ca_url}netstat/" class="btn btn-mini right">{$lang.dotmore}</a>
            <div class="clear"></div>

            </div>
        </div>
    </div>

</div>
{/if}




