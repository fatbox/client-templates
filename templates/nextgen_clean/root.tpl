{*

This file is rendered on main HostBill screen when browsed by user

*}

<h3>{$lang.welcome}</h3>
<div class="row box-feature-divider">
    <div class="span4">
        <div class="box-feature"><a href="{$ca_url}cart/"><span style="" class="iconfont-bag iconfont-size5 silver"></span></a>
               <h1>{$lang.placeorder|capitalize}</h1>
                <p>{$lang.placeorder_desc}</p>

        </div>
    </div>
    <div class="span4">

        <div class="box-feature">
            <a href="{$ca_url}clientarea/"><span style="" class="iconfont-gear iconfont-size5 silver"></span></a>
                <h1>{$lang.clientarea|capitalize}</h1>
                <p>{$lang.clientarea_desc}</p>
        </div>
    </div>

    <div class="span4">
        <div class="box-feature">

            <a href="{if $logged=='1'}{$ca_url}support{elseif $enableFeatures.kb!='off'}{$ca_url}knowledgebase{else}{$ca_url}tickets/new{/if}/"><span style="" class="iconfont-question-round iconfont-size5 silver"></span></a>
                <h1>{$lang.support|capitalize}</h1>
                <p>{$lang.support_desc}</p>
        </div>
    </div>
</div>






{if $enableFeatures.news!='off' && $annoucements}
<div id="announcements">
	{foreach from=$annoucements item=annoucement}

<h3><a href="{$ca_url}news/view/{$annoucement.id}/{$annoucement.slug}/">{$annoucement.title}</a></h3>
<span class="annoucement_date"><i class="icon-time"></i> {$lang.published} {$annoucement.date|dateformat:$date_format}</span>
<p >{$annoucement.content}


</p><div class="right">
    <div  class="btn-group">
          <a href="{$ca_url}news/" class="btn btn-small">{$lang.newsarchive}</a>
          <a  href="{$ca_url}news/view/{$annoucement.id}/{$annoucement.slug}/" class="btn btn-small">{$lang.readall}</a>
        </div> </div>
<div class="clear"></div>
	{/foreach}
</div>
{/if}

