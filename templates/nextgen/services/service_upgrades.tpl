 {if $showupgrades}<div class="wbox">
    <div class="wbox_header">{$lang.UpgradeDowngrade}</div>
    <div id="cartSummary" class="wbox_content" style="padding:15px">
{if $fieldupgrades}
         <form action="" method="post">
              <input type="hidden" value="upgradeconfig" name="make" />
              <input type="hidden" value="upgradeconfig" name="do" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%" class="table table-striped">
        <tr>
                 <td  width="10%"></td>
                 <td   width="30%" align="center">{$lang.oldsetting}</td>
                 <td   width="60%" align="center">{$lang.newsetting}</td>
                </tr>
        {foreach from=$fieldupgrades item=cf key=k}
         
                    {include file=$cf.configtemplates.upgrades}
             
        {/foreach}

            <tr>
                <td colspan="3" align="right" style="border-bottom:none;"> <input type="submit" value="{$lang.continue}" style="font-weight:bold;" class="btn btn-info"/></td>
                </tr>
    </table> {foreach from=$fieldupgrades item=cf key=k}<input type="hidden" name="fupgrade[{$k}][old_qty]" value="{$cf.qty}" />
                    {foreach from=$cf.data item=it key=kk}<input type="hidden" name="fupgrade[{$k}][old_config_id]" value="{$kk}" />{/foreach}{/foreach}
         {securitytoken}</form>

{elseif $upgrades && $upgrades!=-1}
        <form action="" method="post">
            <input type="hidden" value="upgrade" name="make" />
            <input type="hidden" value="upgrade" name="do" />

            <table border="0" cellspacing="0" cellpadding="0" width="100%">

                <tr>
                    <td>{$lang.updownto}</td>
                    <td><select name="upgrades" onchange="sss(this)" >
		  {foreach from=$upgrades item=up}
                            <option value="{$up.id}">{$up.catname}: {$up.name}</option>
		  {/foreach}</select></td>

                    <td>
                        <div id="billing_options">
          	{foreach from=$upgrades item=i key=k}
                            <div {if $k!=0}style="display:none"{/if} class="up_desc">
      {if $i.paytype=='Free'}
                                <input type="hidden" name="cycle[{$i.id}]" value="Free" />
    			 {$lang.price}: <strong> {$lang.Free}</strong>
      {elseif $i.paytype=='Once'}
                                <input type="hidden" name="cycle[{$i.id}]" value="Once" />
    	 {$lang.price}: {$i.m|price:$currency:true:true} {$lang.once}
      {else}
	  {$lang.pickcycle}
                                <select name="cycle[{$i.id}]">
           {if $i.h!=0}<option value="h" {if $i.cycle=='h'}selected="selected"{/if}>{$i.h|price:$currency:true:true} {$lang.h}</option>{/if}
           {if $i.d!=0}<option value="d" {if $i.cycle=='d'}selected="selected"{/if}>{$i.d|price:$currency:true:true} {$lang.d}</option>{/if}
           {if $i.w!=0}<option value="w" {if $i.cycle=='w'}selected="selected"{/if}>{$i.w|price:$currency:true:true} {$lang.w}</option>{/if}
           {if $i.m!=0}<option value="m" {if $i.cycle=='m'}selected="selected"{/if}>{$i.m|price:$currency:true:true} {$lang.m}</option>{/if}
           {if $i.q!=0}<option value="q" {if $i.cycle=='q'}selected="selected"{/if}>{$i.q|price:$currency:true:true} {$lang.q}</option>{/if}
           {if $i.s!=0}<option value="s" {if $i.cycle=='s'}selected="selected"{/if}>{$i.s|price:$currency:true:true} {$lang.s}</option>{/if}
           {if $i.a!=0}<option value="a" {if $i.cycle=='a'}selected="selected"{/if}>{$i.a|price:$currency:true:true} {$lang.a}</option>{/if}
           {if $i.b!=0}<option value="b" {if $i.cycle=='b'}selected="selected"{/if}>{$i.b|price:$currency:true:true} {$lang.b}</option>{/if}
           {if $i.t!=0}<option value="t" {if $i.cycle=='t'}selected="selected"{/if}>{$i.t|price:$currency:true:true} {$lang.t}</option>{/if}
                                </select>
      {/if}
                            </div>
		 	 {/foreach}
                        </div>
                    </td>

                    <td> <input type="submit" value="{$lang.continue}" style="font-weight:bold;" class="btn btn-info"/></td>
                </tr>

            </table>



            <div class="fs11" id="up_descriptions" style="margin-top:10px">
		  	{foreach from=$upgrades item=up key=k}
                <span {if $k!=0}style="display:none"{/if} class="up_desc">{$up.description}</span>
		  {/foreach}
            </div>




            <script type="text/javascript">
            {literal}
            function sss(el) {
                  $('.up_desc').hide();
                  var index=$(el).eq(0).prop('selectedIndex');
                  $('#up_descriptions .up_desc').eq(index).show();
                  $('#billing_options .up_desc').eq(index).show();
            }
            {/literal}
            </script>
        {securitytoken}</form>

      {/if}
    </div>
</div>


		{/if}