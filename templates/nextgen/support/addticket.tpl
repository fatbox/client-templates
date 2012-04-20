

<div class="bordered-section article">
    <h2 >{$lang.openticket}</h2>
    <div class="brcrm">
<span class="left">{$lang.reportproblem}</span>
<a class="btn btn-mini right" href="{$ca_url}tickets/"><i class="icon-chevron-left"></i> Back</a>
<div class="clear"></div>
</div>

    <form  enctype="multipart/form-data" method="post" action="" class="p19">
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
                            <div id="d{$dept.id}" {if $submit.dept_id && $submit.dept_id==$dept.id} style="display:block" {elseif $smarty.foreach.fff.first}  style="display:block"  {/if}>{$dept.description}</div>
				  {/foreach}
                        </div>
                    <div class="clear"></div>
                    </td>
                </tr>
                
                {if !$clientdata.firstname}<tr>
                    <td width="300">
                        <label>{$lang.name}</label>
                        <input name="client_name" value="{$submit.client_name}" class="styled"/>
                    </td>
                <td >
                        <label>{$lang.email}</label>
                        <input name="client_email" value="{$submit.client_email}" class="styled"/>
                    </td>
                </tr>{/if}
                
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
                  <tr>
                                            <td ></td>
                                            <td align="right"><a class="btn btn-mini" onclick="$(this).hide();$('#attachments-new').show();return false;"><i class="icon-plus"></i> Attach a file</a</td>
                                        </tr>
                                        <tr  class="even" id="attachments-new" style="display:none">
           
            <td colspan="2" >
                <label>{$lang.attachments}</label>
                    <input type="file" size="50" name="attachments[]" />
                <a onclick="return addAnother(this)" href="#" >{$lang.addanother}</a><br/>
                <div id="fileuploads"/>
                <small>{$extensions|string_format:$lang.allowedext}</small></td>
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

                        <div class="right"><input type="submit" value="{$lang.submit}"  class="btn btn-success btn-large" style="font-weight: bold"/></div>
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
        $('#d'+items).show();
    }
     function addAnother(el) {
                    $(el).after('<br/><input type="file" size="50" name="attachments[]"/>');
                    return false;
                }
</script>{/literal}
