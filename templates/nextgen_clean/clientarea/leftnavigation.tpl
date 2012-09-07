<div class="box-feature{if $action=='details'} active{/if}"><a href="{$ca_url}clientarea/details/"><span class="iconfont-card iconfont-size4 silver" style=""></span></a>
    <h4>{$lang.mydetails}</h4>
</div>

<div class="box-feature{if $action=='password'} active{/if}"><a href="{$ca_url}clientarea/password/"><span class="iconfont-lock iconfont-size4 silver" style=""></span></a>
    <h4>{if $clientdata.contact_id}{$lang.changemainpass}{else}{$lang.changepass}{/if}</h4>
</div>

{if $enableFeatures.deposit!='off' }
<div class="box-feature{if $action=='addfunds'} active{/if}"><a href="{$ca_url}clientarea/addfunds/"><span class="iconfont-plus-round iconfont-size4 silver" style=""></span></a>
    <h4>{$lang.addfunds}</h4>
</div>
{/if}
{if $clientdata.contact_id}
<div class="box-feature{if $action=='profilepassword'} active{/if}"><a href="{$ca_url}clientarea/profilepassword/"><span class="iconfont-lock iconfont-size4 silver" style=""></span></a>
    <h4>{$lang.changemypass}</h4>
</div>
{/if}


{if $enableCCards}
<div class="box-feature{if $action=='ccard'} active{/if}"><a href="{$ca_url}clientarea/ccard/"><span class="iconfont-extract iconfont-size4 silver" style=""></span></a>
    <h4>{$lang.ccard}</h4>
</div>
{/if}

<div class="box-feature{if $cmd=='profiles'} active{/if}"><a href="{$ca_url}profiles/"><span class="iconfont-add-user iconfont-size4 silver" style=""></span></a>
    <h4>{$lang.profiles}</h4>
</div>

<div class="box-feature{if $action=='ipaccess'} active{/if}"><a href="{$ca_url}clientarea/ipaccess/"><span class="iconfont-cloud-upload iconfont-size4 silver" style=""></span></a>
    <h4>{$lang.ipaccess}</h4>
</div>

