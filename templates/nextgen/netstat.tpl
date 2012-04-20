<div class="bordered-section article">
    <h2>{$lang.netstat|capitalize}</h2>

    {if $servers}
    <table cellspacing="0" cellpadding="0" border="0" width="100%" class="table table-striped  fullscreen">
        <colgroup class="firstcol"></colgroup>

				{if $fields.FTP}<colgroup class="alternatecol"></colgroup>{/if}
        {if $fields.SSH}<colgroup class="firstcol"></colgroup>{/if}
			   {if $fields.HTTP}<colgroup class="alternatecol"></colgroup>{/if}
			   {if $fields.POP3}<colgroup class="firstcol"></colgroup>{/if}
			   {if $fields.IMAP}<colgroup class="alternatecol"></colgroup>{/if}
			   {if $fields.MYSQL}<colgroup class="firstcol"></colgroup>{/if}
			   {if $fields.LOAD}<colgroup class="alternatecol"></colgroup>{/if}
			   {if $fields.UPTIME}<colgroup class="firstcol"></colgroup>{/if}

        <tr>
            <th  align="left">{$lang.servers}</th>
            {if $fields.FTP}<th>{$lang.FTP}</th>{/if}
            {if $fields.SSH}<th>{$lang.SSH}</th>{/if}
			   {if $fields.HTTP}<th>{$lang.HTTP}</th>{/if}
			   {if $fields.POP3}<th>{$lang.POP3}</th>{/if}
			   {if $fields.IMAP}<th>{$lang.IMAP}</th>{/if}
			   {if $fields.MYSQL}<th>{$lang.MYSQL}</th>{/if}
			   {if $fields.LOAD}<th>{$lang.LOAD}</th>{/if}
			   {if $fields.UPTIME}<th>{$lang.UPTIME}</th>{/if}
        </tr>
	{foreach from=$servers item=server}
        <tr class="toloads" id="{$server.id}">
            <td ><strong>{$server.name}</strong></td>
				{if $fields.FTP}<td align="center"><img src="{$template_dir}img/bullet_white.gif" /></td>{/if}
            {if $fields.SSH}<td align="center"><img src="{$template_dir}img/bullet_white.gif" /></td>{/if}
			   {if $fields.HTTP}<td align="center"><img src="{$template_dir}img/bullet_white.gif" /></td>{/if}
			   {if $fields.POP3}<td align="center"><img src="{$template_dir}img/bullet_white.gif" /></td>{/if}
			   {if $fields.IMAP}<td align="center"><img src="{$template_dir}img/bullet_white.gif" /></td>{/if}
			   {if $fields.MYSQL}<td align="center"><img src="{$template_dir}img/bullet_white.gif" /></td>{/if}
			   {if $fields.LOAD}<td align="center">-</td>{/if}
			   {if $fields.UPTIME}<td align="center">-</td>{/if}

        </tr>
			{/foreach}
    </table>
    <script type="text/javascript">{literal}
        function loadStatuses() {
            if ($('.toloads').length<1)
                return;
            var id=$('.toloads').eq(0).attr('id');
            $.post('?cmd=netstat&action=getstatus',{server_id:id},function(data){
                var resp = parse_response(data);
                if(resp.length>4) {
                    $('.toloads').eq(0).html(resp);
                    $('.toloads').eq(0).removeClass('toloads');
                    loadStatuses();
                }
			
            });
        }
        appendLoader('loadStatuses');
    {/literal}</script>
    {else}
    {$lang.nothing}
    {/if}
</div>