<center>
    <table border="0" cellpadding="0" cellspacing="6">
        <tr>
            <td align="left">
                <label for="username" class="styled">{$lang.email}</label>
                <input name="username" value="{$submit.username}" class="styled"/>
            </td>
            <td align="left">
                <label for="password" class="styled">{$lang.password}</label>
                <input name="password" type="password"  class="styled"/>
            </td>
            <td align="left">
                <label for="loginbtn" class="btnfix styled">&nbsp;</label>
                <input name="loginbtn" class="btn padded" type="submit" style="font-weight:bold;" value="{$lang.login}">
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <a href="index.php?/root&action=passreminder" class="list_item" style="display: block;" target="_blank">{$lang.passreminder}</a>
                <a href="index.php?/signup/" id="signup" class="list_item" style="display: block;">{$lang.createaccount}</a>
            </td>
        </tr>
    </table>

    <input type="hidden" name="action" value="login"/>
</center>

{literal}<script type="text/javascript">
    $('#signup').live('click', function(e) {
        e.preventDefault();
        $('#orderform').find('li.t1').click();
    });
</script>{/literal}