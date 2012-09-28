<div class="row">
                <div class="span8">
                    <div class="row ">
                        <div class="span5">
                            <ul class="span2">
                                <li class="nav-header span2">{$lang.tickets}</li>
                                    <li ><a href="{$ca_url}tickets/new/">{$lang.openticket}</a></li>
                                    <li ><a href="{$ca_url}tickets/" >{$lang.ticketarchive}</a></li>
                            </ul>

                           {if $enableFeatures.kb!='off'}<ul class="span2">
                                <li class="nav-header span2">Knowledgebase</li>
                                <li ><a href="{$ca_url}knowledgebase/"  > {$lang.vsarticles}</a></li>
                            </ul> {/if}


                            {if $enableFeatures.downloads!='off'}
                            <ul class="span2">
                                <li class="nav-header span2">{$lang.downloads}</li>
                                <li ><a href="{$ca_url}downloads/" >{$lang.browsedownloads}</a></li>
                            </ul>
                            {/if}


                             {if $enableFeatures.chat!='off'}
                            <ul class="span2">
                                <li ><a href="{$ca_url}chat/" >{$lang.chat}</a></li>
                            </ul>
                            {/if}

                        {if $enableFeatures.netstat!='off'}
                            <ul class="span2"> <li  ><a href="{$ca_url}netstat/" >{$lang.netstat}</a></li>  </ul>
                        {/if}

                        </div>
                        <div class="span3">
                            <center>
                                <div class="iconwrap"><span style="" class="iconfont-question-round iconfont-size5 silver"></span><br/></div>
                                <p class="silver">{$lang.wereherephrase}</p>
                                <button href="{$ca_url}support/" class="btn btn-success"><i class="icon-question-sign icon-white"></i> {$lang.supporthome}</button>
                            </center>
                        </div>
                    </div>
                </div>
            </div>