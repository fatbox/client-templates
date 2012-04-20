
            <table class="checker" width="100%" cellspacing="0" cellpadding="0">
                  {foreach from=$fields item=field name=floop key=k}
                       
                  {if $smarty.foreach.floop.index%2==0}
                    <tr height="30" {if $smarty.foreach.floop.index%4==0}class="even"{/if}>
                        {/if}
                         <td class=""> 
                            {if $field.options & 1}{if $lang[$k]}{$lang[$k]}{else}{$field.name}{/if}
                            {else}{$field.name}{/if}</td><td>

                            {if $k=='country'}
	{foreach from=$countries key=k item=v}{if $k==$client.country}{$v}{/if}{/foreach}
                            {else}
                                {if $field.field_type=='Input'}{$client[$k]}
                                {elseif $field.field_type=='Password'}
                                {elseif $field.field_type=='Select'}
                                  
                                        {foreach from=$field.default_value item=fa}
                                               {if $client[$k]==$fa}{$fa}{/if}
					{/foreach}
                                 
                                {elseif $field.field_type=='Check'}
                                     {foreach from=$field.default_value item=fa}
                                         {if in_array($fa,$client[$k])}{$fa}<br/>{/if}
							{/foreach}

                                {/if}
                            {/if}
                        </td>
                     {if $smarty.foreach.floop.index%2==1 }
                    </tr>
                        {/if}

                    {/foreach}

            </table>
     