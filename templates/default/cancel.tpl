<h1 class="gears2">{$lang.cancellrequest}</h1>
<form action="" method="post">
    <input type="hidden" value="cancel" name="make"/>

    <p>{$lang.cancel_for}<strong><a href="{$ca_url}clientarea&amp;action=services&amp;service={$service.id}">{$service.catname} - {$service.name}</a></strong></p>
    <table width="100%" align="center">
        <tbody><tr><td>{$lang.cancel_describe}</td></tr>
            <tr><td><textarea style="width: 99%;" rows="6" name="reason"></textarea></td></tr>
            <tr><td align="center">{$lang.canceltype}
                    <select name="type">

                        <option value="Immediate">{$lang.immediate}</option>
                        <option value="End of billing period">{$lang.endofbil}</option>

                    </select></td></tr>
        </tbody></table>
    <p align="center"><input type="submit" class="button" value="{$lang.cancelrequest}" class="padded" style="font-weight:bold;"/> {$lang.or} <a href="{$ca_url}clientarea&amp;action=services&amp;service={$service.id}">{$lang.backtoservice}</a></p>
    {securitytoken}</form>