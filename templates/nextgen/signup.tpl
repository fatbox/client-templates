<div class="bordered-section article">
    <h2 class="bbottom" >{$lang.createaccount}</h2>
    <div class="p19">
    <form method="post" action="" name="signupform">
        {include file='ajax.signup.tpl}

        <div class="form-actions">
            <center><input type="submit" value="{$lang.submit}" class="btn btn-info btn-large" style="font-weight:bold"/></center>
        </div>

        {securitytoken}
    </form>
    </div>
</div>