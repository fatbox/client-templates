<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
	<td valign="top" width="50%">
	<table cellpadding="0" cellspacing="0" width="100%" class="checker">
<tbody>

<tr height="46">
<td width="110" >{$lang.firstname}</td><td><input type="text" value="{$submit.firstname}" style="width: 80%;" name="firstname" class="styled"/></td>

</tr>

<tr class="even" height="46">
<td >{$lang.lastname}</td><td><input type="text" value="{$submit.lastname}" style="width: 80%;" name="lastname" class="styled"/></td>

</tr>
<tr height="46">
<td >{$lang.phone}</td><td><input type="text" value="{$submit.phonenumber}" style="width: 80%;" name="phonenumber" class="styled"/></td></tr>




<tr height="46" class="even">
<td >{$lang.email}</td><td><input type="text" value="{$submit.email}" style="width: 80%;" name="email" class="styled"/></td>

</tr>

<tr  height="46">

<td >{$lang.country}</td><td>
<select name="country">
	{foreach from=$countries key=k item=v}
		<option value="{$k}" {if $k==$submit.country  || (!$submit && $k==$defaultCountry)} selected="Selected"{/if}>{$v}</option>
		
	{/foreach}
</select></td>
</tr>

<tr ><td style="border:none;">{$lang.clacctype}</td><td  style="border:none;">
				<select  name="type" style="width: 80%;" onchange="{literal}if ($(this).val()=='Private') {$('.iscomp').hide();$('.ispr').show();}else {$('.ispr').hide();$('.iscomp').show();}{/literal}">
					<option value="Private" {if $submit.type=='Private'}selected="selected"{/if}>{$lang.Private}</option>
					<option value="Company" {if $submit.type=='Company'}selected="selected"{/if}>{$lang.Company}</option>
				</select>
				</td></tr>
				
	{if $extrafields}
				 {foreach from=$extrafields item=field name=f}
				 	{if $smarty.foreach.f.index%2==0}
						<tr {if $field.type=='Company'}class="iscomp" style="{if !$submit || $submit.type=='Private'}display:none{/if}" 
						{elseif $field.type=='Private'}class="ispr" style="{if $submit.type=='Company'}display:none{/if}" {/if}>
						<td style="border:none;">{$field.name} {if $field.required=='1'}*{/if}</td>
						
						<td style="border:none;">
						{if $field.field_type=='Input'}
						<input  value="{$submit[$field.code]}" name="{$field.code}" style="width: 80%;" class="styled"/>
						{elseif $field.field_type=='Check'}
							{foreach from=$field.default_value item=fa}
								<input type="checkbox" name="{$field.code}[{$fa}]" value="1" />{$fa}<br />
							{/foreach}
						{else}
							<select name="{$field.code}" style="width: 80%;">
							{foreach from=$field.default_value item=fa}
								<option {if $submit[$field.code]==$fa}selected="selected"{/if}>{$fa}</option>
							{/foreach}
							</select>
						{/if}
						</td></tr>
					{/if}
				 {/foreach}
				 {/if}			
</tbody>

</table>
	</td>
	<td valign="top" width="50%">
	<table cellpadding="0" cellspacing="0" width="100%" class="checker">
<tbody>

<tr height="46">

<td width="110" >{$lang.address}</td><td><input type="text" value="{$submit.address1}" style="width: 80%;" name="address1" class="styled"/></td>
</tr>

<tr class="even" height="46">

<td width="110" >{$lang.address2}</td><td><input type="text" value="{$submit.address2}" style="width: 80%;" name="address2" class="styled"/></td>
</tr>

<tr height="46">

<td >{$lang.city}</td><td><input type="text" value="{$submit.city}" style="width: 80%;" name="city" class="styled"/></td>
</tr>

<tr class="even" height="46">
<td >{$lang.state}</td><td><input type="text" value="{$submit.state}" style="width: 80%;" name="state" class="styled"/></td>
</tr>

<tr height="46">

<td >{$lang.postcode}</td><td><input type="text" value="{$submit.postcode}" size="15" name="postcode" class="styled"/></td>
</tr>



<tr height="46" style="{if !$submit || $submit.type=='Private'}display:none{/if}" class="iscomp">
<td style="border:none;">{$lang.company}</td><td  style="border:none;"><input type="text" value="{$submit.companyname}" style="width: 80%;" name="companyname" class="styled"/></td>

{if $extrafields}
				 {foreach from=$extrafields item=field name=f}
				 	{if $smarty.foreach.f.index%2!=0}
						<tr {if $field.type=='Company'}class="iscomp" style="{if !$submit || $submit.type=='Private'}display:none{/if}" 
						{elseif $field.type=='Private'}class="ispr" style="{if $submit.type=='Company'}display:none{/if}" {/if}>
						<td  style="border:none;">{$field.name} {if $field.required=='1'}*{/if}</td>
						
						<td  style="border:none;">
						{if $field.field_type=='Input'}
						<input  value="{$submit[$field.code]}" name="{$field.code}" style="width: 80%;"  class="styled"/>
						{elseif $field.field_type=='Check'}
							{foreach from=$field.default_value item=fa}
								<input type="checkbox" name="{$field.code}[{$fa}]" value="1" />{$fa}<br />
							{/foreach}
						{else}
							<select name="{$field.code}" style="width: 80%;">
							{foreach from=$field.default_value item=fa}
								<option {if $submit[$field.code]==$fa}selected="selected"{/if}>{$fa}</option>
							{/foreach}
							</select>
						{/if}
						</td></tr>
					{/if}
				 {/foreach}
				 {/if}
</tr>

</tbody>

</table>
	</td>
</tr>
</table>





