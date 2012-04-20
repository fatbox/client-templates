<div class="row flex-container bordered-section">
    <div class="span3 left-content flex-box-1">

        <div class="sidebar-block">

            <div class="header-title">
                <span>Ticket</span>
                <h3 >#{$ticket.ticket_number}</h3>
            </div>
        </div>

        <div class="sidebar-block">
            <p><i class="icon-tag"></i> {$lang.status} <b>{$lang[$ticket.status]}</b></p>
            <p><i class="icon-folder-open"></i> {$lang.department} <b>{$ticket.deptname}</b></p>
            <p><i class="icon-time"></i> Added <b>{$ticket.date|dateformat:$date_format}</b></p>
        </div>

        <div class="sidebar-block">

            {if $ticket.status!='Closed'}
            <p>Your issue is already resolved? Click button below to close this ticket</p>

            <form  action="" method="post">
                <input type="hidden" value="closeticket" name="make" />
                <button class="btn btn-info btn-mini" ><i class="icon-ok icon-white"></i> {$lang.resolved}</button>

	{securitytoken}</form>
            {else}
            <p>Your issue is not yet resolved? Use button below to re-open this ticket.</p>

            <form  action="" method="post">
                <input type="hidden" value="reopen" name="make" />

                <button class="btn btn-info btn-mini" ><i class="icon-refresh icon-white"></i> {$lang.reopen}</button>
	{securitytoken}</form>
            {/if}
        </div>

    </div>
    <div class="span9 right-content flex-box-1">
        <div class="header-title">
            {$lang.subject}
            <h2>{$ticket.subject|wordwrap:40:"\n":true}</h2>
        </div>

        <div class="p19">
                    <a class="right btn btn-mini" href="{$ca_url}tickets/"><i class="icon-chevron-left"></i> All tickets</a>
                <div class="clear"></div>
        </div>
        {if $ticket.status!='Closed'}
        <div class="brcrm">
            <form enctype="multipart/form-data" action="" method="post" id="replyform">
                <h3>{$lang.reply}</h3>

                <input type="hidden" value="addreply" name="make" />
                <input name="client_name" type="hidden" value="{$ticket.name}"/>

                <input name="client_email" value="{$ticket.email}" type="hidden"/>
                <table width="100%" cellspacing="0" cellpadding="0" class="frame">
                    <tbody>
                        <tr>
                            <td><table width="100%" cellspacing="10" cellpadding="0" border="0">
                                    <tbody>




                                        <tr>
                                            <td colspan="2"><textarea style="width: 98%;" cols="60" rows="6"  name="body" id="ticketmessage">{$submit.body}</textarea>
                                                <div id="hintarea" style="display:none"></div></td>
                                        </tr>
                                        <tr>
                                            <td ><button class="btn btn-success  btn-large" ><i class="icon-comment icon-white"></i> {$lang.submit}</button></td>
                                            <td align="right"><a class="btn btn-mini" onclick="$(this).hide();$('#attachments-new').show();return false;"><i class="icon-plus"></i> Attach a file</a</td>
                                        </tr>
                                        <tr id="attachments-new" style="display:none">
                                    <script type="text/javascript">
                                        {literal}
                                        function addAnother(el) {
                                            $(el).after('<br/><input type="file" size="50" name="attachments[]"/>');
                                            return false;
                                        }
                                        {/literal}
                                    </script>
                                    <td colspan="2"><input type="file" size="50" name="attachments[]" />
                                        <a onclick="addAnother(this)" href="javascript:void(0)" >{$lang.addanother}</a><br/>
                                        <div id="fileuploads"/>
                                        <small>{$extensions|string_format:$lang.allowedext}</small></td>
                        </tr>
                    </tbody>
                </table></td>
                </tr>
                </tbody>
                </table>



                {securitytoken}</form>
        </div>
        {/if}


        <div class="p19">

            {if $replies && !empty($replies) }
            <h3>{$lang.replies}</h3>
            {foreach from=$replies_rev item=reply}

            <div class="com-con">
                <div class="{if $reply.type=='Client'}cticket{else}aticket{/if}">

                    <div class="avatar left">
                        <span class="iconfont-user iconfont-size1 {if $reply.type=='Client'}black{else}red{/if}"></span>
                    </div>

                    <div class="byline left" rel="tooltip" {if $reply.type!='Client'}rel="tooltip" title="{$lang.staff}"{/if}><strong>{$reply.name}</strong> {$reply.date|dateformat:$date_format}</div>


                    <a class="right btn btn-mini quoter" rel="tooltip" title="Quote" onclick="return quoteTicket('r{$reply.id}');"><i class="icon-share"></i></a>

                    <div class="clear"></div>

                    <div class="comment"><div id="r{$reply.id}">{$reply.body|httptohref|nl2br}</div>

                        {if !empty($attachments[$reply.id])}
                        <br /><strong>		{$lang.attachments}</strong><br />
                        {foreach from=$attachments[$reply.id] item=attachment}
                        <a href="?action=download&amp;id={$attachment.id} "  class="attach3">{$attachment.org_filename}</a><br />
                        {/foreach}{/if}
                    </div>
                </div>

            </div>




            {/foreach}
            {/if}


            <div class="com-con">
                <div class="{if $ticket.type=='Client'}cticket{else}aticket{/if}">

                    <div class="avatar left">
                        <span class="iconfont-user iconfont-size1 {if $ticket.type=='Client'}black{else}red{/if}"></span>
                    </div>

                    <div class="byline left" rel="tooltip" {if $ticket.type!='Client'}rel="tooltip" title="{$lang.staff}"{/if}><strong>{$ticket.name}</strong> {$ticket.date|dateformat:$date_format}</div>

                    <a class="right btn btn-mini quoter" rel="tooltip" title="Quote" onclick="return quoteTicket('t{$ticket.id}');"><i class="icon-share"></i></a>
                    <div class="clear"></div>

                    <div class="comment"><div id="t{$ticket.id}">{$ticket.body|httptohref|nl2br}</div>
                        {if !empty($attachments[0])}
                        <strong>{$lang.attachments}</strong><br />
                        {foreach from=$attachments[0] item=attachment}
                        <a href="?action=download&amp;id={$attachment.id}" class="attach3">{$attachment.org_filename}</a><br />
                        {/foreach}
                        {/if}</div>
                </div>
                
            </div>

        </div>
    </div>
</div>

 <script type="text/javascript" src="{$template_dir}js/jquery.elastic.min.js"></script>
    {literal}
    <script>

    function quoteTicket(target) {
        var resp = $('#'+target).text();
        var reply = $('#ticketmessage').val();
        $('#ticketmessage').val(reply + "\r\n>" + resp.replace(/\n/g,"\n>")+"\r\n").change().focus();
        return false;
    }
    $(document).ready(function(){
        $('a[rel=tooltip], div[rel=tooltip]').tooltip();
        if(!$('#ticketmessage').length) {
            $('.quoter').hide();
        } else {
            $('#ticketmessage').elastic();
        }
    });
    </script>{/literal}