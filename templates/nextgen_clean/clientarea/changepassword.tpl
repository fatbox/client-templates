{*

Change password of main client account/contact

*}<div class="p19"><form action='' method='post' >
        <input type="hidden" name="make" value="changepassword" />
        <table width="100%" border=0 cellspacing="0">
            <tbody>

                <tr><td >{$lang.oldpass}</td></tr>
                <tr><td ><input name="oldpassword" type="password"  class="styled" style="width: 60%" /></td></tr>
                <tr ><td  >{$lang.newpassword}</td></tr>
                <tr><td ><input name="password" type="password"  class="styled" style="width: 60%" /></td></tr>
                <tr><td >{$lang.confirmpassword}</td></tr>
                <tr><td ><input name="password2" type="password"  class="styled" style="width: 60%" /></td></tr>

            </tbody>
        </table>
        <div class="form-actions">
            <center>
                <input type="submit" value="{$lang.savechanges}" class="btn btn-info btn-large" style="font-weight:bold"/>
            </center>
        </div>
	{securitytoken}
    </form>
</div>