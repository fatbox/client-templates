{*

Security/IP access settings

*}
<h2>{$lang.ipaccess} <span class="right" style="color:#cacaca">{$lang.currentipadd} {$yourip}</span></h2>
<div class="ribbon form-horizontal">
    <form action='' method='post' >
        <input type="hidden" name="make" value="addrule" />

        <div class="control-group">
            <label for="appendedPrependedInput" class="control-label">{$lang.ipsubnet}</label>
            <div class="controls">
                <input name="rule" type="text" class="magnify"  placeholder="eg. {$yourip}" />

                <input  name="add" type="submit" value="{$lang.addipsubnet}" class="btn btn-success btn-large"/>
            </div>
        </div>

        {securitytoken}</form>
</div>
<div class="ribbon-shadow-l"></div>
<div class="ribbon-shadow-r"></div>


<div class="p19">

    <div class="row">
        <div class="span5">
        <table width="100%" border=0 class="table table-striped table-bordered" cellspacing="0">
            <tr>

                <th align="left">{$lang.ipsubnet}</th>
                <th width="20"></th>
            </tr>
	{if $rules }
	{foreach from=$rules item=rule name=rules}
            <tr class="{if $smarty.foreach.rules.index % 2 == 0}even{/if}{if $smarty.foreach.rules.last} lastone{/if}">

                <td>{if $rule.rule == 'all'}{$lang.allaccess}{else}{$rule.rule}{/if}</td>
                <td><a class="deleteico" href="{$ca_url}{$cmd}/{$action}/&make=delrule&id={$rule.id}">{$lang.delete}</a></td>
            </tr>
	{/foreach}
	{else}
            <tr class="even lastone">

                <td colspan="2">{$lang.norules} - {$lang.allaccess}</td>
            </tr>
	{/if}
        </table>
    </div>
        <div class="span4 well" style="font-size:11px">
           <b>{$lang.ruleformat}:</b><ul style="padding:0;margin:0px;" >
				
                <li> <strong>all</strong> - {$lang.keywordmatchingall}</li>
                <li> <strong>xxx.xxx.xxx.xxx</strong> - {$lang.singleiprule}</li>
                <li> <strong>xxx.xxx.xxx.xxx/M</strong> - {$lang.ipmaskrule}</li>
                <li> <strong>xxx.xxx.xxx.xxx/mmm.mmm.mmm.mmm</strong> - {$lang.ipmaskruledoted}</li>
            </ul><br/>
            <b>Example rules:</b>
            <ul style="padding:0;margin:0px;" >
		
                <li>{$lang.ruleexample1} </li>
                <li>{$lang.ruleexample2}</li>
            </ul></div>

    </div>

</div>

