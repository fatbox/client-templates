<!--BOF: FILEUPLOAD -->
<script src="{$template_dir}js/fileupload/vendor/jquery.ui.widget.js"></script>
<script src="{$template_dir}js/fileupload/vendor/tmpl.min.js"></script>
<script src="{$template_dir}js/fileupload/jquery.iframe-transport.js"></script>
<script src="{$template_dir}js/fileupload/jquery.fileupload.js"></script>
<script src="{$template_dir}js/fileupload/jquery.fileupload-ui.js"></script>
<link media="all" type="text/css" rel="stylesheet" href="{$template_dir}js/fileupload/styles.css" />
<!--EOF: FILEUPLOAD -->


<div class="bordered-section article">
    <h2 >{$lang.openticket}</h2>
    <div class="brcrm">
<span class="left">{$lang.reportproblem}</span>
<a class="btn btn-mini right" href="{$ca_url}tickets/"><i class="icon-chevron-left"></i> {$lang.back}</a>
<div class="clear"></div>
</div>

    <form  enctype="multipart/form-data" method="post" action="" class="p19" id="ticketsform">
        <input name="make" type="hidden" value="addticket" />
        <table width="100%" cellspacing="0" cellspacing="0"  border="0" >
            <tbody>
                <tr>
                   <td valign="middle" colspan="2">
                    <label>{$lang.department}</label>
                    <select name="dept_id" onchange="switchdeptdesc(this.value)" style="float:left; margin-right:10px;">

				{foreach from=$depts item=dept}

                            <option value="{$dept.id}" {if $submit.dept_id==$dept.id}selected="selected"{/if}>{$dept.name}</option>

				{/foreach}

                        </select>
                        <div class="deptsdesc" >
                        {foreach from=$depts item=dept name=fff}
                            <div class="dept_{$dept.id}" {if $submit.dept_id && $submit.dept_id==$dept.id} style="display:block" {elseif $smarty.foreach.fff.first}  style="display:block" {else} style="display:none"  {/if}>{$dept.description}</div>
                        {/foreach}
                        {foreach from=$depts item=dept name=fff}
                            {if $depts_avg[$dept.id]}
                            <div class="dept_{$dept.id}" {if $submit.dept_id && $submit.dept_id==$dept.id} style="display:block" {elseif $smarty.foreach.fff.first}  style="display:block" {else} style="display:none" {/if}>
                                {$lang.deptavgresponsetime} {$depts_avg[$dept.id]|convert:'second'}
                            </div>
                            {/if}
                        {/foreach}
                        </div>
                    <div class="clear"></div>
                    </td>
                </tr>
                
                {if !$clientdata.firstname}
                <tr>
                    <td width="300">
                        <label>{$lang.name}</label>
                        <input name="client_name" value="{$submit.client_name}" class="styled"/>
                    </td>
                    <td >
                        <label>{$lang.email}</label>
                        <input name="client_email" value="{$submit.client_email}" class="styled"/>
                    </td>
                </tr>
                {else}
                <tr>
                    {foreach from=$depts item=dept name=loop}
                        {if $dept.options & 64}
                    <td id="p{$dept.id}" class="dptpriority" {if ($submit && $submit.dept_id!=$dept.id) || ( !$submit && !$smarty.foreach.loop.first)}style="display: none"{/if} width="300">
                        <label>{$lang.priority}</label>
                        <select {if ($submit && $submit.dept_id!=$dept.id) || ( !$submit && !$smarty.foreach.loop.first)}disabled="disabled"{/if} name="priority" style="float:left; margin-right:10px;">
                        <option {if $submit.priority==0}selected="selected"{/if} value="0" >{$lang.low}</option>
                        <option {if $submit.priority==1}selected="selected"{/if} value="1" >{$lang.medium}</option>
                        <option {if $submit.priority==2}selected="selected"{/if} value="2" >{$lang.high}</option>
                        </select>
                    </td>
                        {/if}
                    {/foreach}
                </tr>
                {/if}
                
                <tr  class="even">
                    <td colspan="2">
                        <label for="subject">{$lang.subject}</label>
                        <input type="text" value="{$submit.subject}"  name="subject" style="width: 99%;" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
				<label for="body">{$lang.message}</label>
                        <textarea style="width: 99%;" cols="60" rows="12"  name="body" id="ticketmessage">{$submit.body}</textarea>
                        <div id="hintarea" style="display:none" class="well"></div>
                    </td>
                </tr>
           

               <!--BOF: FILEUPLOAD Provide url to file upload handler in data-url -->
                <tr  class="even">
                    <td colspan="2" id="fileupload" data-url="?cmd=tickets&action=handleupload">
                        <div id="dropzonecontainer">
                        <div id="dropzone"><h2>{$lang.droptoattach}</h2></div>
                        <div class="fileupload-buttonbar">
                            <div class="span5" style="float:left">
                                <!-- The fileinput-button span is used to style the file input field as button -->
                                <span class="btn btn-mini fileinput-button">
                                    <i class="icon-plus"></i>
                                    <span>{$lang.attachfile}</span>
                                    <input type="file" name="attachments[]" multiple  />
                                </span>
                                 <div class="fs11">{$extensions|string_format:$lang.allowedext}</div>
                            </div>
                            <!-- The global progress information -->
                            <div class="span5 fileupload-progress fade"  style="float:left">
                                <!-- The global progress bar -->
                                <div class="progress progress-success progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                                    <div class="bar" style="width:0%;"></div>
                                </div>
                                <!-- The extended global progress information -->
                                <div class="progress-extended">&nbsp;</div>
                            </div>
                            <div class="clear"></div>
                        </div>

                        <!-- The table listing the files available for upload/download -->
                        <table role="presentation" class="table table-striped"><tbody class="files"></tbody></table>
                        <!--EOF: FILEUPLOAD -->
                        <!--
                <label>{$lang.attachments}</label>
                    <input type="file" size="50" name="attachments[]" />
                <a onclick="return addAnother(this)" href="#" >{$lang.addanother}</a><br/>
                <div id="fileuploads"/>
                   </td>
                        -->

                         </div>
                    </td>

            </tr>

           
            <tr>
                <td colspan="2" >
                    <div class="form-actions">

                         {if $captcha}
                         <div class="left" style="margin-right:20px;">
                    <img src="?cmd=root&amp;action=captcha" alt="captcha" />
                         </div>
                         <div class="left">
                             <p>{$lang.typethecharacters}<br/></p>
                            <input type="text" value="" size="15" name="image_verification"   style="width:100px"/>
                         </div>
                         
            {/if}

                            <div class="right"><input type="submit" value="{$lang.submit}"  class="btn btn-success btn-large" style="font-weight: bold" id="submitbutton"/></div>
                        <div class="clear"></div>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>


        {securitytoken}</form>
</div>
{literal}
<script type="text/javascript">
    function switchdeptdesc(items) {

        $('.deptsdesc').find('div').hide();
        $('.dept_'+items).show();
        $('.dptpriority').hide().find('select').attr('disabled','disabled');
        $('#p'+items).show().find('select').removeAttr('disabled');
    }
     function addAnother(el) {
                    $(el).after('<br/><input type="file" size="50" name="attachments[]"/>');
                    return false;
                }


</script>
<!--BOF: FILEUPLOAD -->
<script type="text/javascript">
    $(function () {

        function enablesubmit() {
            $('#submitbutton').addClass('btn-success').removeClass('disabled').removeClass('btn-inverse').removeAttr('disabled');
        }
        function disablesubmit() {
            $('#submitbutton').removeClass('btn-success').addClass('disabled').addClass('btn-inverse').attr('disabled','disabled');
        }
        function showdropzone(e) {
          var dropZone = $('#dropzone').not('.hidden');
            dropZone.show();
                 setTimeout(function () {
                    hidedropzone()
                }, 6000);
        }
        function hidedropzone() {
            $('#dropzone').hide().addClass('hidden');
        }
        $('#fileupload').fileupload();
        $('#fileupload').bind('fileuploadsend', disablesubmit)
        .bind('fileuploadalways', enablesubmit)
        .bind('fileuploaddragover', showdropzone)
         .bind('fileuploaddrop', hidedropzone);

    });

</script>
<script id="template-upload" type="text/x-tmpl">
    {% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-upload fade">
        <td class="name" width="40%"><span>{%=file.name%}</span></td>
        <td class="size" width="90"><span>{%=o.formatFileSize(file.size)%}</span></td>
        {% if (file.error) { %}
        <td class="error" colspan="2"><span class="label label-important">Error</span> {%=file.error%}</td>
        {% } else if (o.files.valid && !i) { %}
        <td>            <div class="progress progress-success progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="bar" style="width:0%;"></div></div>

        </td>
        <td class="start" width="90">{% if (!o.options.autoUpload) { %}
            <button class="btn btn-primary btn-mini">
                <i class="icon-upload icon-white"></i>
                <span>Start</span>
            </button>
            {% } %}</td>
        {% } else { %}
        <td colspan="2"></td>
        {% } %}
        <td class="cancel" width="90" align="right">{% if (!i) { %}
            <button class="btn btn-warning  btn-mini">
                <i class="icon-ban-circle icon-white"></i>
                <span>{/literal}{$lang.cancel}{literal}</span>
            </button>
            {% } %}</td>
    </tr>
    {% } %}
</script><!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-download fade">
        {% if (file.error) { %}
            <td class="name" width="40%"><span>{%=file.name%}</span></td>
            <td class="size" width="90"><span>{%=o.formatFileSize(file.size)%}</span></td>
            <td class="error" colspan="2"><span class="label label-important">Error</span> {%=file.error%}</td>
        {% } else { %}
            <td class="name" width="40%">{%=file.name%} <input type="hidden" name="asyncattachment[]" value="{%=file.hash%}" /></td>
            <td class="size"><span>{%=o.formatFileSize(file.size)%}</span></td>
            <td colspan="2"></td>
        {% } %}
        <td class="delete" width="90" align="right">
            <button class="btn btn-danger btn-mini" data-type="{%=file.delete_type%}" data-url="{%=file.delete_url%}">
                <i class="icon-trash icon-white"></i>
                <span>{/literal}{$lang.delete}{literal}</span>
            </button>
        </td>
    </tr>
{% } %}
</script>
{/literal}
<!--EOF: FILEUPLOAD -->
