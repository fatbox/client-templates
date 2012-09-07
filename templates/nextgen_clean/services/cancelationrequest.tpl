<div class="bordered-section article">
    <h2 class="bbottom">{$lang.cancellrequest}</h2>
    <form action="" method="post" class="p19">
        <input type="hidden" value="cancel" name="make"/>

        <p>{$lang.cancel_for}<strong><a href="{$ca_url}clientarea&amp;action=services&amp;service={$service.id}">{$service.catname} - {$service.name}</a></strong></p>
        <table width="100%" align="center">
            <tbody>
                <tr><td colspan="2">{$lang.cancel_describe}</td></tr>
                <tr><td colspan="2"><textarea style="width: 99%;" rows="6" name="reason"></textarea></td></tr>
                <tr><td >{$lang.canceltype}
                        <select name="type">

                            <option value="Immediate">{$lang.immediate}</option>
                            <option value="End of billing period">{$lang.endofbil}</option>

                        </select></td>
                        <td align="right"> <input type="submit" value="{$lang.cancelrequest}" class="btn btn-danger btn-large" />
            {$lang.or} <a href="{$ca_url}clientarea&amp;action=services&amp;service={$service.id}">{$lang.backtoservice}</a></td>
                </tr>
            </tbody></table>
      
        {securitytoken}
    </form>
</div>