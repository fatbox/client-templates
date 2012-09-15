<div class="cntn">
    <div class="row">
        <div class="span8">
            <div class="row ">
                <div class="span5">
                    <ul class="span2">
                        <li class="nav-header span2">{$lang.mainaccount}</li>
                        <li ><a href="{$ca_url}clientarea/details/" >{$lang.details}</a></li>
                        <li ><a href="{$ca_url}clientarea/password/" >{$lang.changepass}</a></li>
                        <li ><a href="{$ca_url}profiles/" >{$lang.managecontacts}</a></li>
                        <li ><a href="{$ca_url}clientarea/ipaccess/" >{$lang.security}</a></li>
                        {if $enableFeatures.deposit!='off' }<li><a href="{$ca_url}clientarea/addfunds/">{$lang.addfunds}</a></li>{/if}
                    </ul>

                    <ul class="span2">
                        <li class="nav-header span2">{$lang.billing}</li>
                        <li ><a href="{$ca_url}clientarea/invoices/">{$lang.invoices}</a></li>
                        <li ><a href="{$ca_url}clientarea/ccard/">{$lang.ccard}</a></li>
                    </ul>

                    <ul class="span2">
                        <li class="nav-header span2">{$lang.userhistory}</li>
                        <li ><a href="{$ca_url}clientarea/emails/">{$lang.emails}</a></li>
                        <li ><a href="{$ca_url}clientarea/history/">{$lang.logs}</a></li>
                    </ul>
                </div>
                <div class="span3">
                    <center>
                        <div class="iconwrap"><span style="" class="iconfont-card iconfont-size5 silver"></span><br/></div>
                        <p class="silver">{$lang.managedetailsinfo}</p>
                        <button href="{$ca_url}clientarea/" class="btn btn-primary"><i class="icon-user icon-white"></i> {$lang.dashboard}</button>
                    </center>
                </div>
            </div>
        </div>
    </div>
</div>
