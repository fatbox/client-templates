{*

    Manage contacts

*}
<h2 class="details2">{$lang.profiles}</h2>
<div class="ribbon form-horizontal">

            <div class="control-group">
                <label for="appendedPrependedInput" class="control-label left" style="width:auto">{$lang.profileinfo}</label>
                <div class="right">
                    <a href="{$ca_url}profiles/add/" class="btn btn-success btn-large"><i class="icon-plus-sign icon-white"></i> {$lang.addnewprofile}</a>
                </div>
            </div>

    </div>
    <div class="ribbon-shadow-l"></div>
    <div class="ribbon-shadow-r"></div>

            {if $profiles}
    <div class="divider"></div>

            <table width="100%" cellspacing="0" cellpadding="0" border="0" class="table table-striped fullscreen">
                <colgroup class="firstcol"></colgroup>
                <colgroup class="alternatecol"></colgroup>
                <colgroup class="firstcol"></colgroup>
                <colgroup class="alternatecol"></colgroup>
                <colgroup class="firstcol"></colgroup>
                <tbody>
                    <tr>
                        <th align="left">{$lang.firstname}</th>
                        <th>{$lang.lastname}</th>
                        <th>{$lang.email}</th>
                        <th>{$lang.lastlogin}</th>
                        <th width="50"></th>
                    </tr>
                </tbody>
                <tbody id="updater">
                    {foreach from=$profiles item=p name=ff}
                    <tr class="{if $smarty.foreach.ff.index%2==0}even{/if}">
                        <td><a href="{$ca_url}profiles/edit/{$p.id}/">{$p.firstname}</a></td>
                        <td align="center"><a href="{$ca_url}profiles/edit/{$p.id}/">{$p.lastname}</a></td>
                        <td align="center"><a href="{$ca_url}profiles/edit/{$p.id}/">{$p.email}</a></td>
                        <td align="center">{if !$p.lastlogin|dateformat:$date_format}-{else}{$p.lastlogin|dateformat:$date_format}{/if}</td>
                        <td>
                            <div class="btn-group">
              <a href="{$ca_url}profiles/edit/{$p.id}/" class="btn dropdown-toggle" data-toggle="dropdown"><i class="icon-cog"></i> <span class="caret"></span></a>
          <ul class="dropdown-menu">

            <li><a href="{$ca_url}profiles/edit/{$p.id}/">{$lang.editcontact}</a></li>
            <li><a href="{$ca_url}profiles/loginascontact/{$p.id}/">{$lang.loginascontact}</a></li>
            <li><a href="{$ca_url}profiles/&do=delete&id={$p.id}&security_token={$security_token}" onclick="return confirm('{$lang.areyousuredelete}');" style="color:red">{$lang.delete}</a></li>

          </ul>
          </div>

                        </td>
                    </tr>
                    {/foreach}
                </tbody>
            </table>


            {else}
            <div class="p19"> <h3>{$lang.nothing}</h3></div>
            {/if}
